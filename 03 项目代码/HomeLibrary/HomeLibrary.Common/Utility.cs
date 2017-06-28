using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

namespace HomeLibrary.Common
{
    /// <summary>
    /// 公共方法
    /// </summary>
    public static class Utility
    {
        /// <summary>
        /// 分页
        /// </summary>
        /// <typeparam name="T">查询对象类型</typeparam>
        /// <param name="queryable">需要分页的数据</param>
        /// <param name="pages">分页信息</param>
        /// <returns>分页结果</returns>
        public static IQueryable<T> SplitPage<T>(IQueryable<T> queryable, Pages pages)
        {
            // 如果分页信息为空，返回全部数据
            if (pages == null)
            {
                return queryable;
            }

            // 设置总记录数
            pages.RecordSum = queryable.Count();

            // 如果页码超出总页数，取最后一页
            if (pages.PageNumber > pages.PageSum && pages.PageSum > 0)
            {
                pages.PageNumber = pages.PageSum;
            }

            // 排序
            if (pages.SortFields.Count != 0)
            {
                bool firstOrder = true;
                pages.SortFields.Reverse();

                foreach (KeyValuePair<string, bool> sortField in pages.SortFields)
                {
                    queryable = OrderBy<T>(queryable, sortField, firstOrder);

                    firstOrder = false;
                }

                pages.SortFields.Reverse();
            }
            else
            {
                // 没有排序规则，默认用主键属性进行排序
                string sortField = typeof(T).GetProperties().FirstOrDefault(x => x.GetCustomAttributes(true).Where(y => y.GetType().Name.Contains("PrimaryKeyAttribute")).Count() != 0).Name;
                queryable = OrderBy<T>(queryable, new KeyValuePair<string, bool>(sortField, true), true);
            }

            // 返回当页的数据
            var result = queryable
                .Skip(pages.First - 1)
                .Take(pages.RecordPaginal);

            return result;
        }

        /// <summary>
        /// 排序
        /// </summary>
        /// <typeparam name="T">查询对象类型</typeparam>
        /// <param name="queryable">需要排序的数据</param>
        /// <param name="sortField">排序字段</param>
        /// <param name="isFirstOrder">是否第一个排序</param>
        /// <returns>分页结果</returns>
        public static IQueryable<T> OrderBy<T>(IQueryable<T> queryable, KeyValuePair<string, bool> sortField, bool isFirstOrder)
        {
            string[] propertys = sortField.Key.Split('.');
            Type elementType = queryable.ElementType;

            // 参数
            ParameterExpression parameterExpression =
                Expression.Parameter(queryable.ElementType, "p");

            // 需要排序的属性
            MemberExpression memberExpression = null;

            for (int i = 0; i < propertys.Count(); i++)
            {
                string property = propertys[i];

                if (elementType.GetProperty(property) == null)
                {
                    throw new Exception("排序字段 " + property + " 不存在！");
                }

                if (i == 0)
                {
                    // 第一个属性
                    memberExpression = Expression.Property(parameterExpression, property);
                }
                else
                {
                    // 非第一个属性
                    memberExpression = Expression.Property(memberExpression, property);
                }

                elementType = elementType.GetProperty(property).PropertyType;
            }

            Expression expression = Expression.Lambda(memberExpression, parameterExpression);

            // 调用Queryable的静态方法进行排序
            MethodCallExpression methodCallExpression = Expression.Call(
                typeof(Queryable),
                sortField.Value ? (isFirstOrder ? "OrderBy" : "ThenBy") : (isFirstOrder ? "OrderByDescending" : "ThenByDescending"),
                new Type[] { queryable.ElementType, elementType },
                queryable.Expression,
                expression);

            // 返回当页的数据
            var result = queryable.Provider.CreateQuery<T>(methodCallExpression);

            return result;
        }

        /// <summary>
        /// MD5加密
        /// </summary>
        /// <param name="str">源字符串</param>
        /// <returns>加密字符串</returns>
        public static string EncryptMD5(string str)
        {
            using (MD5 md5 = MD5.Create())
            {
                byte[] strBytes = Encoding.UTF8.GetBytes(str);
                byte[] md5Bytes = md5.ComputeHash(strBytes);

                md5.Clear();

                StringBuilder sb = new StringBuilder();
                foreach (byte b in md5Bytes)
                {
                    sb.Append(b.ToString("x2"));
                }

                return sb.ToString().ToUpper();
            }
        }

        /// <summary>
        /// 获取枚举字典
        /// </summary>
        /// <param name="value"></param>
        /// <returns>枚举字典</returns>
        public static Dictionary<int, string> GetEnumDictionary(this Type enumType)
        {
            FieldInfo[] fields = enumType.GetFields();
            Dictionary<int, string> dictionaryEnum = new Dictionary<int, string>();

            foreach (FieldInfo field in fields)
            {
                DescriptionAttribute attribute = field.GetCustomAttributes(typeof(DescriptionAttribute), false).SingleOrDefault() as DescriptionAttribute;
                if (attribute != null)
                {
                    dictionaryEnum.Add((int)field.GetValue(field.Name), attribute.Description);
                }
            }

            return dictionaryEnum;
        }

        /// <summary>
        /// 获取枚举描述
        /// </summary>
        /// <param name="enumValue">枚举值</param>
        /// <returns>枚举描述</returns>
        public static string GetEnumDescription(this Enum enumValue)
        {
            DescriptionAttribute attribute = enumValue.GetType()
                .GetField(enumValue.ToString())
                .GetCustomAttributes(typeof(DescriptionAttribute), false)
                .SingleOrDefault() as DescriptionAttribute;
            return attribute == null ? enumValue.ToString() : attribute.Description;
        }


        public static DateTime TransferStartDateTime(this DateTime date)
        {
            return date.Date;
        }

        public static DateTime TransferEndDateTime(this DateTime date)
        {
            return date.Date.AddHours(23).AddMinutes(59).AddSeconds(59);
        }


        public static string FormatHtmlPictureName(string pictureName)
        {
            string extname = pictureName.Split('.').ToList().Last();//取文件扩展名
            string filename = pictureName.TrimEnd(extname.ToCharArray());

            if (filename.Length > 10)
            {
                filename = filename.Substring(0, 5) + "..." + filename.Substring(filename.Length - 3, 3);
            }
            return filename + extname;
        }




        /// <summary>
        /// 获取格式化日期,yyyy-MM-dd
        /// </summary>
        /// <param name="obj">日期</param>
        /// <returns>格式化后的日期</returns>
        public static string FormatDate(this DateTime? obj)
        {
            if (obj == null)
            {
                return string.Empty;
            }
            else
            {
                return Convert.ToDateTime(obj).ToString("yyyy-MM-dd");
            }
        }

        public static string FormatDate(this DateTime obj)
        {
            if (obj == null)
            {
                return string.Empty;
            }
            else
            {
                return Convert.ToDateTime(obj).ToString("yyyy-MM-dd");
            }
        }

        /// <summary>
        /// 获取格式化日期时间,yyyy-MM-dd HH:mm
        /// </summary>
        /// <param name="obj">日期时间</param>
        /// <returns>格式化后的日期时间</returns>
        public static string FormatDateTime(this DateTime? obj)
        {
            if (obj == null)
            {
                return string.Empty;
            }
            else
            {
                return Convert.ToDateTime(obj).ToString("yyyy-MM-dd HH:mm");
            }
        }

        public static string FormatDateTime(this DateTime obj)
        {
            if (obj == null)
            {
                return string.Empty;
            }
            else
            {
                return Convert.ToDateTime(obj).ToString("yyyy-MM-dd HH:mm");
            }
        }

        /// <summary>
        /// 获取格式化日期时间,yyyyMMddhhmmss
        /// </summary>
        /// <param name="obj">日期时间</param>
        /// <returns>格式化后的日期时间</returns>
        public static string FormatDateTime2(this DateTime? obj)
        {
            if (obj == null)
            {
                return string.Empty;
            }
            else
            {
                return Convert.ToDateTime(obj).ToString("yyyyMMddhhmmss");
            }
        }

        public static string FormatDateTime2(this DateTime obj)
        {
            if (obj == null)
            {
                return string.Empty;
            }
            else
            {
                return Convert.ToDateTime(obj).ToString("yyyyMMddhhmmss");
            }
        }


        public readonly static DateTime NullExpiryDate = DateTime.Parse("1975-01-01 00:00:00");
        /// <summary>
        /// 格式化从HIS读取的效期，HIS返回的空效期为了方便在SQL中存储以及处理，赋默认值1975-01-01，效期为此值时返回空字符串
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static string FormatDateTimeForHISExpiryDate(this DateTime? obj)
        {
            if (obj == null)
            {
                return string.Empty;
            }
            else
            {
                DateTime dateTime = Convert.ToDateTime(obj);
                if (dateTime == NullExpiryDate)
                {
                    return string.Empty;
                }
                else
                {
                    return FormatDate(obj);
                }
            }
        }

        public static string FormatDateTimeForHISExpiryDate(this DateTime obj)
        {
            if (obj == null)
            {
                return string.Empty;
            }
            else
            {
                DateTime dateTime = Convert.ToDateTime(obj);
                if (dateTime == NullExpiryDate)
                {
                    return string.Empty;
                }
                else
                {
                    return FormatDate(obj);
                }
            }
        }

        /// <summary>
        /// 将日期转换成整数
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        public static int DateTimeToInt(this DateTime date)
        {
            return int.Parse(date.ToString("yyyyMMdd"));
        }


        #region 判断字符类型
        /// <summary>
        /// 判断是否数值型数据
        /// </summary>
        public static bool isNumeric(String message)
        {
            Regex rex = new Regex(@"^[-]?\d+[.]?\d*$");
            if (rex.IsMatch(message))
            {
                return true;
            }
            else
                return false;
        }

        /// <summary>
        /// 判断是否整数型数据
        /// </summary>
        public static bool isInteger(String message)
        {
            Regex rex = new Regex(@"^\d+$");
            if (rex.IsMatch(message))
            {
                return true;
            }
            else
                return false;
        }


        /// <summary>
        /// 判断是否日期型数据
        /// </summary>
        public static bool isDate(String message)
        {
            DateTime dtime;
            if (DateTime.TryParse(message, out dtime))
            {
                if (dtime.Year >= 1975)
                    return true;
                return false;
            }
            else
            {
                return false;
            }
        }



        #endregion




    }
}
