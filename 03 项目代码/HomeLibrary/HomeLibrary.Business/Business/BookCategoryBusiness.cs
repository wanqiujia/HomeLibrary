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
	/// 图书分类业务逻辑
	/// </summary>
	public partial class BookCategoryBusiness
    {
		/// <summary>
		/// 新增图书分类
		/// </summary>
		/// <param name="bookCategory">图书分类</param>
		public static void AddBookCategory(BookCategory bookCategory)
		{
			
			
            BookCategoryData.AddBookCategory(bookCategory);
			
			DataBase.SaveChanges();
		}

		/// <summary>
		/// 修改图书分类
		/// </summary>
		/// <param name="bookCategory">图书分类</param>
		public static void UpdateBookCategory(BookCategory bookCategory)
		{

			BookCategoryData.UpdateBookCategory(bookCategory);

			DataBase.SaveChanges();
		}

		/// <summary>
		/// 删除图书分类
		/// </summary>
		/// <param name="id">唯一编号</param>
		public static void RemoveBookCategory(int id)
		{
			BookCategory bookCategory = BookCategoryData.GetBookCategory(id);
			BookCategoryData.RemoveBookCategory(bookCategory);

			DataBase.SaveChanges();
		}

		/// <summary>
		/// 获取图书分类
		/// </summary>
		/// <param name="id">唯一编号</param>
		/// <returns>图书分类</returns>
		public static BookCategory GetBookCategory(int id)
		{
			return BookCategoryData.GetBookCategory(id);
		}

		/// <summary>
		/// 根据条件查询图书分类
		/// </summary>
        /// <param name="predicate">查询条件</param>
        /// <param name="pages">分页信息</param>
        /// <returns>图书分类集合</returns>
		public static List<BookCategory> QueryBookCategory(Expression<Func<BookCategory, bool>> predicate, Pages pages)
		{
			return BookCategoryData.QueryBookCategory(predicate, pages);
		}
    }
}
