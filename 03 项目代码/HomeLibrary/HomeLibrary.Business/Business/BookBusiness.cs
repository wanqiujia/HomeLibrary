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
	/// 图书信息业务逻辑
	/// </summary>
	public partial class BookBusiness
    {
		/// <summary>
		/// 新增图书信息
		/// </summary>
		/// <param name="book">图书信息</param>
		public static void AddBook(Book book)
		{
			
			
            BookData.AddBook(book);
			
			DataBase.SaveChanges();
		}

		/// <summary>
		/// 修改图书信息
		/// </summary>
		/// <param name="book">图书信息</param>
		public static void UpdateBook(Book book)
		{

			BookData.UpdateBook(book);

			DataBase.SaveChanges();
		}

		/// <summary>
		/// 删除图书信息
		/// </summary>
		/// <param name="id">唯一编号</param>
		public static void RemoveBook(int id)
		{
			Book book = BookData.GetBook(id);
			BookData.RemoveBook(book);

			DataBase.SaveChanges();
		}

		/// <summary>
		/// 获取图书信息
		/// </summary>
		/// <param name="id">唯一编号</param>
		/// <returns>图书信息</returns>
		public static Book GetBook(int id)
		{
			return BookData.GetBook(id);
		}

		/// <summary>
		/// 根据条件查询图书信息
		/// </summary>
        /// <param name="predicate">查询条件</param>
        /// <param name="pages">分页信息</param>
        /// <returns>图书信息集合</returns>
		public static List<Book> QueryBook(Expression<Func<Book, bool>> predicate, Pages pages)
		{
			return BookData.QueryBook(predicate, pages);
		}
    }
}
