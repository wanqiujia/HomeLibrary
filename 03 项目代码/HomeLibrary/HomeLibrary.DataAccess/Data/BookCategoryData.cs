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
	/// 图书分类数据访问
	/// </summary>
	public partial class BookCategoryData : DataBase
    {
		/// <summary>
		/// 新增图书分类
		/// </summary>
		/// <param name="bookCategory">图书分类</param>
		public static void AddBookCategory(BookCategory bookCategory)
		{
			Context.BookCategories.Add(bookCategory);
		}

		/// <summary>
		/// 修改图书分类
		/// </summary>
		/// <param name="bookCategory">图书分类</param>
		public static void UpdateBookCategory(BookCategory bookCategory)
		{
			Context.Entry(bookCategory).State = EntityState.Modified;
		}

		/// <summary>
		/// 删除图书分类
		/// </summary>
		/// <param name="bookCategory">图书分类</param>
		public static void RemoveBookCategory(BookCategory bookCategory)
		{
			Context.BookCategories.Remove(bookCategory);
		}

		/// <summary>
		/// 获取图书分类
		/// </summary>
		/// <param name="id">唯一编号</param>
		/// <returns>图书分类</returns>
		public static BookCategory GetBookCategory(int id)
		{
			return Context.BookCategories.Find(id);
		}

		/// <summary>
		/// 根据条件查询图书分类
		/// </summary>
        /// <param name="predicate">查询条件</param>
        /// <param name="pages">分页信息</param>
        /// <returns>图书分类集合</returns>
		public static List<BookCategory> QueryBookCategory(Expression<Func<BookCategory, bool>> predicate, Pages pages = null)
		{
			return Utility.SplitPage(Context.BookCategories.Where(predicate), pages).ToList();
		}
    }
}
