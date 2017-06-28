using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

using HomeLibrary.Common;
using HomeLibrary.DataAccess;
using HomeLibrary.Model;

namespace HomeLibrary.Business
{
	/// <summary>
	/// 业务逻辑
	/// </summary>
	public partial class UserBusiness
    {
		/// <summary>
		/// 新增
		/// </summary>
		/// <param name="user"></param>
		public static void AddUser(User user)
		{
			
			
            UserData.AddUser(user);
			
			DataBase.SaveChanges();
		}

		/// <summary>
		/// 修改
		/// </summary>
		/// <param name="user"></param>
		public static void UpdateUser(User user)
		{

			UserData.UpdateUser(user);

			DataBase.SaveChanges();
		}

		/// <summary>
		/// 删除
		/// </summary>
		/// <param name="id">唯一编号</param>
		public static void RemoveUser(int id)
		{
			User user = UserData.GetUser(id);
			UserData.RemoveUser(user);

			DataBase.SaveChanges();
		}

		/// <summary>
		/// 获取
		/// </summary>
		/// <param name="id">唯一编号</param>
		/// <returns></returns>
		public static User GetUser(int id)
		{
			return UserData.GetUser(id);
		}

		/// <summary>
		/// 根据条件查询
		/// </summary>
        /// <param name="predicate">查询条件</param>
        /// <param name="pages">分页信息</param>
        /// <returns>集合</returns>
		public static List<User> QueryUser(Expression<Func<User, bool>> predicate, Pages pages)
		{
			return UserData.QueryUser(predicate, pages);
		}
    }
}
