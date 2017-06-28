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
	/// 借阅人数据访问
	/// </summary>
	public partial class BorrowerData : DataBase
    {
		/// <summary>
		/// 新增借阅人
		/// </summary>
		/// <param name="borrower">借阅人</param>
		public static void AddBorrower(Borrower borrower)
		{
			Context.Borrowers.Add(borrower);
		}

		/// <summary>
		/// 修改借阅人
		/// </summary>
		/// <param name="borrower">借阅人</param>
		public static void UpdateBorrower(Borrower borrower)
		{
			Context.Entry(borrower).State = EntityState.Modified;
		}

		/// <summary>
		/// 删除借阅人
		/// </summary>
		/// <param name="borrower">借阅人</param>
		public static void RemoveBorrower(Borrower borrower)
		{
			Context.Borrowers.Remove(borrower);
		}

		/// <summary>
		/// 获取借阅人
		/// </summary>
		/// <param name="id">唯一编号</param>
		/// <returns>借阅人</returns>
		public static Borrower GetBorrower(int id)
		{
			return Context.Borrowers.Find(id);
		}

		/// <summary>
		/// 根据条件查询借阅人
		/// </summary>
        /// <param name="predicate">查询条件</param>
        /// <param name="pages">分页信息</param>
        /// <returns>借阅人集合</returns>
		public static List<Borrower> QueryBorrower(Expression<Func<Borrower, bool>> predicate, Pages pages = null)
		{
			return Utility.SplitPage(Context.Borrowers.Where(predicate), pages).ToList();
		}
    }
}
