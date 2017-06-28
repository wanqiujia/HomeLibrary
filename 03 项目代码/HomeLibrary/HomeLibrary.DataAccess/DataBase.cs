using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace HomeLibrary.DataAccess
{
    public class DataBase
    {
        private static Entities objectContext = null;

        /// <summary>
        /// 获取数据上下文
        /// </summary>
        internal static Entities Context
        {
            get
            {

                // Web应用中使用HttpContext保存上下文
                if (HttpContext.Current != null)
                {
                    if (!HttpContext.Current.Items.Contains("entities"))
                    {
                        HttpContext.Current.Items["entities"] = new Entities();
                    }
                    var dbContext = HttpContext.Current.Items["entities"] as Entities;

                    dbContext.Database.CommandTimeout = 300;

                    return dbContext;
                }
                else
                {
                    if (DataBase.objectContext == null)
                    {
                        DataBase.objectContext = new Entities();

                    }
                    else
                    {
                        if (DataBase.objectContext.Database.Connection.State == System.Data.ConnectionState.Closed || DataBase.objectContext.Database.Connection.State == System.Data.ConnectionState.Broken)
                        {
                            DataBase.objectContext.Database.Connection.Open();
                        }
                    }
                    DataBase.objectContext.Database.CommandTimeout = 300;
                    return DataBase.objectContext;
                }
            }
        }
        public static void InitContext()
        {
            DataBase.objectContext = new Entities();
        }

        /// <summary>
        /// 保存变更
        /// </summary>
        public static void SaveChanges()
        {
            Context.SaveChanges();
        }
    }
}
