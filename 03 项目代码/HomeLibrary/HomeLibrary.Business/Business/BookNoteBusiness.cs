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
	/// 阅读笔记业务逻辑
	/// </summary>
	public partial class BookNoteBusiness
    {
		/// <summary>
		/// 新增阅读笔记
		/// </summary>
		/// <param name="bookNote">阅读笔记</param>
		public static void AddBookNote(BookNote bookNote)
		{
			
			
            BookNoteData.AddBookNote(bookNote);
			
			DataBase.SaveChanges();
		}

		/// <summary>
		/// 修改阅读笔记
		/// </summary>
		/// <param name="bookNote">阅读笔记</param>
		public static void UpdateBookNote(BookNote bookNote)
		{

			BookNoteData.UpdateBookNote(bookNote);

			DataBase.SaveChanges();
		}

		/// <summary>
		/// 删除阅读笔记
		/// </summary>
		/// <param name="id">唯一编号</param>
		public static void RemoveBookNote(int id)
		{
			BookNote bookNote = BookNoteData.GetBookNote(id);
			BookNoteData.RemoveBookNote(bookNote);

			DataBase.SaveChanges();
		}

		/// <summary>
		/// 获取阅读笔记
		/// </summary>
		/// <param name="id">唯一编号</param>
		/// <returns>阅读笔记</returns>
		public static BookNote GetBookNote(int id)
		{
			return BookNoteData.GetBookNote(id);
		}

		/// <summary>
		/// 根据条件查询阅读笔记
		/// </summary>
        /// <param name="predicate">查询条件</param>
        /// <param name="pages">分页信息</param>
        /// <returns>阅读笔记集合</returns>
		public static List<BookNote> QueryBookNote(Expression<Func<BookNote, bool>> predicate, Pages pages)
		{
			return BookNoteData.QueryBookNote(predicate, pages);
		}
    }
}
