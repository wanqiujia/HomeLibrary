using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

using HomeLibrary.Common;
using HomeLibrary.Model;

namespace HomeLibrary.DataAccess
{
	/// <summary>
	/// 数据访问
	/// </summary>
	public partial class UserData : DataBase
    {
		/// <summary>
		/// 新增
		/// </summary>
		/// <param name="user"></param>
		public static void AddUser(User user)
		{
			Context.Users.Add(user);
		}

		/// <summary>
		/// 修改
		/// </summary>
		/// <param name="user"></param>
		public static void UpdateUser(User user)
		{
			Context.Entry(user).State = EntityState.Modified;
		}

		/// <summary>
		/// 删除
		/// </summary>
		/// <param name="user"></param>
		public static void RemoveUser(User user)
		{
			Context.Users.Remove(user);
		}

		/// <summary>
		/// 获取
		/// </summary>
		/// <param name="id">唯一编号</param>
		/// <returns></returns>
		public static User GetUser(int id)
		{
			return Context.Users.Find(id);
		}

		/// <summary>
		/// 根据条件查询
		/// </summary>
        /// <param name="predicate">查询条件</param>
        /// <param name="pages">分页信息</param>
        /// <returns>集合</returns>
		public static List<User> QueryUser(Expression<Func<User, bool>> predicate, Pages pages = null)
		{
			return Utility.SplitPage(Context.Users.Where(predicate), pages).ToList();
		}
    }
}
