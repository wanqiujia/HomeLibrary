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
	/// 借阅记录业务逻辑
	/// </summary>
	public partial class BorrowRecordBusiness
    {
		/// <summary>
		/// 新增借阅记录
		/// </summary>
		/// <param name="borrowRecord">借阅记录</param>
		public static void AddBorrowRecord(BorrowRecord borrowRecord)
		{
			
			
            BorrowRecordData.AddBorrowRecord(borrowRecord);
			
			DataBase.SaveChanges();
		}

		/// <summary>
		/// 修改借阅记录
		/// </summary>
		/// <param name="borrowRecord">借阅记录</param>
		public static void UpdateBorrowRecord(BorrowRecord borrowRecord)
		{

			BorrowRecordData.UpdateBorrowRecord(borrowRecord);

			DataBase.SaveChanges();
		}

		/// <summary>
		/// 删除借阅记录
		/// </summary>
		/// <param name="id">唯一编号</param>
		public static void RemoveBorrowRecord(int id)
		{
			BorrowRecord borrowRecord = BorrowRecordData.GetBorrowRecord(id);
			BorrowRecordData.RemoveBorrowRecord(borrowRecord);

			DataBase.SaveChanges();
		}

		/// <summary>
		/// 获取借阅记录
		/// </summary>
		/// <param name="id">唯一编号</param>
		/// <returns>借阅记录</returns>
		public static BorrowRecord GetBorrowRecord(int id)
		{
			return BorrowRecordData.GetBorrowRecord(id);
		}

		/// <summary>
		/// 根据条件查询借阅记录
		/// </summary>
        /// <param name="predicate">查询条件</param>
        /// <param name="pages">分页信息</param>
        /// <returns>借阅记录集合</returns>
		public static List<BorrowRecord> QueryBorrowRecord(Expression<Func<BorrowRecord, bool>> predicate, Pages pages)
		{
			return BorrowRecordData.QueryBorrowRecord(predicate, pages);
		}
    }
}
