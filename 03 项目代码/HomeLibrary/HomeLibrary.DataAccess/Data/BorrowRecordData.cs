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
	/// 借阅记录数据访问
	/// </summary>
	public partial class BorrowRecordData : DataBase
    {
		/// <summary>
		/// 新增借阅记录
		/// </summary>
		/// <param name="borrowRecord">借阅记录</param>
		public static void AddBorrowRecord(BorrowRecord borrowRecord)
		{
			Context.BorrowRecords.Add(borrowRecord);
		}

		/// <summary>
		/// 修改借阅记录
		/// </summary>
		/// <param name="borrowRecord">借阅记录</param>
		public static void UpdateBorrowRecord(BorrowRecord borrowRecord)
		{
			Context.Entry(borrowRecord).State = EntityState.Modified;
		}

		/// <summary>
		/// 删除借阅记录
		/// </summary>
		/// <param name="borrowRecord">借阅记录</param>
		public static void RemoveBorrowRecord(BorrowRecord borrowRecord)
		{
			Context.BorrowRecords.Remove(borrowRecord);
		}

		/// <summary>
		/// 获取借阅记录
		/// </summary>
		/// <param name="id">唯一编号</param>
		/// <returns>借阅记录</returns>
		public static BorrowRecord GetBorrowRecord(int id)
		{
			return Context.BorrowRecords.Find(id);
		}

		/// <summary>
		/// 根据条件查询借阅记录
		/// </summary>
        /// <param name="predicate">查询条件</param>
        /// <param name="pages">分页信息</param>
        /// <returns>借阅记录集合</returns>
		public static List<BorrowRecord> QueryBorrowRecord(Expression<Func<BorrowRecord, bool>> predicate, Pages pages = null)
		{
			return Utility.SplitPage(Context.BorrowRecords.Where(predicate), pages).ToList();
		}
    }
}
