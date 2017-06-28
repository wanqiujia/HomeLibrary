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
	/// 借阅人业务逻辑
	/// </summary>
	public partial class BorrowerBusiness
    {
		/// <summary>
		/// 新增借阅人
		/// </summary>
		/// <param name="borrower">借阅人</param>
		public static void AddBorrower(Borrower borrower)
		{
			
			
            BorrowerData.AddBorrower(borrower);
			
			DataBase.SaveChanges();
		}

		/// <summary>
		/// 修改借阅人
		/// </summary>
		/// <param name="borrower">借阅人</param>
		public static void UpdateBorrower(Borrower borrower)
		{

			BorrowerData.UpdateBorrower(borrower);

			DataBase.SaveChanges();
		}

		/// <summary>
		/// 删除借阅人
		/// </summary>
		/// <param name="id">唯一编号</param>
		public static void RemoveBorrower(int id)
		{
			Borrower borrower = BorrowerData.GetBorrower(id);
			BorrowerData.RemoveBorrower(borrower);

			DataBase.SaveChanges();
		}

		/// <summary>
		/// 获取借阅人
		/// </summary>
		/// <param name="id">唯一编号</param>
		/// <returns>借阅人</returns>
		public static Borrower GetBorrower(int id)
		{
			return BorrowerData.GetBorrower(id);
		}

		/// <summary>
		/// 根据条件查询借阅人
		/// </summary>
        /// <param name="predicate">查询条件</param>
        /// <param name="pages">分页信息</param>
        /// <returns>借阅人集合</returns>
		public static List<Borrower> QueryBorrower(Expression<Func<Borrower, bool>> predicate, Pages pages)
		{
			return BorrowerData.QueryBorrower(predicate, pages);
		}
    }
}
