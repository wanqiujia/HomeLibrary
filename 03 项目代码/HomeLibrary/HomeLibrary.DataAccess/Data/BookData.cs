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
	/// 图书信息数据访问
	/// </summary>
	public partial class BookData : DataBase
    {
		/// <summary>
		/// 新增图书信息
		/// </summary>
		/// <param name="book">图书信息</param>
		public static void AddBook(Book book)
		{
			Context.Books.Add(book);
		}

		/// <summary>
		/// 修改图书信息
		/// </summary>
		/// <param name="book">图书信息</param>
		public static void UpdateBook(Book book)
		{
			Context.Entry(book).State = EntityState.Modified;
		}

		/// <summary>
		/// 删除图书信息
		/// </summary>
		/// <param name="book">图书信息</param>
		public static void RemoveBook(Book book)
		{
			Context.Books.Remove(book);
		}

		/// <summary>
		/// 获取图书信息
		/// </summary>
		/// <param name="id">唯一编号</param>
		/// <returns>图书信息</returns>
		public static Book GetBook(int id)
		{
			return Context.Books.Find(id);
		}

		/// <summary>
		/// 根据条件查询图书信息
		/// </summary>
        /// <param name="predicate">查询条件</param>
        /// <param name="pages">分页信息</param>
        /// <returns>图书信息集合</returns>
		public static List<Book> QueryBook(Expression<Func<Book, bool>> predicate, Pages pages = null)
		{
			return Utility.SplitPage(Context.Books.Where(predicate), pages).ToList();
		}
    }
}
