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
	/// 阅读笔记数据访问
	/// </summary>
	public partial class BookNoteData : DataBase
    {
		/// <summary>
		/// 新增阅读笔记
		/// </summary>
		/// <param name="bookNote">阅读笔记</param>
		public static void AddBookNote(BookNote bookNote)
		{
			Context.BookNotes.Add(bookNote);
		}

		/// <summary>
		/// 修改阅读笔记
		/// </summary>
		/// <param name="bookNote">阅读笔记</param>
		public static void UpdateBookNote(BookNote bookNote)
		{
			Context.Entry(bookNote).State = EntityState.Modified;
		}

		/// <summary>
		/// 删除阅读笔记
		/// </summary>
		/// <param name="bookNote">阅读笔记</param>
		public static void RemoveBookNote(BookNote bookNote)
		{
			Context.BookNotes.Remove(bookNote);
		}

		/// <summary>
		/// 获取阅读笔记
		/// </summary>
		/// <param name="id">唯一编号</param>
		/// <returns>阅读笔记</returns>
		public static BookNote GetBookNote(int id)
		{
			return Context.BookNotes.Find(id);
		}

		/// <summary>
		/// 根据条件查询阅读笔记
		/// </summary>
        /// <param name="predicate">查询条件</param>
        /// <param name="pages">分页信息</param>
        /// <returns>阅读笔记集合</returns>
		public static List<BookNote> QueryBookNote(Expression<Func<BookNote, bool>> predicate, Pages pages = null)
		{
			return Utility.SplitPage(Context.BookNotes.Where(predicate), pages).ToList();
		}
    }
}
