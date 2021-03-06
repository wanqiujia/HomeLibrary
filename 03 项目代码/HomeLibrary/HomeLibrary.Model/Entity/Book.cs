//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace HomeLibrary.Model
{
    using System;
    using System.Collections.Generic;
    
    /// <summary>
    /// 图书信息
    /// </summary>
    public partial class Book
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Book()
        {
            this.BookNotes = new HashSet<BookNote>();
            this.BorrowRecords = new HashSet<BorrowRecord>();
        }
    
        /// <summary>
        /// 获取或设置图书编号
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// 获取或设置ISBN号
        /// </summary>
        public string ISBN { get; set; }
        /// <summary>
        /// 获取或设置书名
        /// </summary>
        public string BookName { get; set; }
        /// <summary>
        /// 获取或设置作者
        /// </summary>
        public string Author { get; set; }
        /// <summary>
        /// 获取或设置出版社
        /// </summary>
        public string Publisher { get; set; }
        /// <summary>
        /// 获取或设置分类编号
        /// </summary>
        public Nullable<int> BookCategoryID { get; set; }
        /// <summary>
        /// 获取或设置状态，在家不在家。1在家，0不在家。编号
        /// </summary>
        public byte StatusID { get; set; }
        /// <summary>
        /// 获取或设置语种
        /// </summary>
        public string Language { get; set; }
        /// <summary>
        /// 获取或设置封面图片地址
        /// </summary>
        public string Icon { get; set; }
        /// <summary>
        /// 获取或设置描述
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// 获取或设置开本
        /// </summary>
        public string BookSize { get; set; }
        /// <summary>
        /// 获取或设置价格
        /// </summary>
        public Nullable<decimal> Price { get; set; }
        /// <summary>
        /// 获取或设置版次
        /// </summary>
        public string Revision { get; set; }
        /// <summary>
        /// 获取或设置书的分类，电子，实体 1=实体，2=电子编号
        /// </summary>
        public byte TypeID { get; set; }
        /// <summary>
        /// 获取或设置购买时间
        /// </summary>
        public Nullable<System.DateTime> BoughtTime { get; set; }
        /// <summary>
        /// 获取或设置创建时间
        /// </summary>
        public System.DateTime CreateTime { get; set; }
        /// <summary>
        /// 获取或设置创建人编号
        /// </summary>
        public int CreateUserID { get; set; }
        /// <summary>
        /// 获取或设置最后修改时间
        /// </summary>
        public System.DateTime LastModifyTime { get; set; }
        /// <summary>
        /// 获取或设置最后修改人编号
        /// </summary>
        public Nullable<int> LastModifyUserID { get; set; }
        /// <summary>
        /// 获取或设置是否已删除
        /// </summary>
        public bool IsDelete { get; set; }
    
        /// <summary>
    	
    	/// 获取或设置图书分类
        
    	/// </summary>
        public virtual BookCategory BookCategory { get; set; }
        /// <summary>
    	
    	/// 获取或设置
        
    	/// </summary>
        public virtual User CreateUser { get; set; }
        /// <summary>
    	
    	/// 获取或设置
        
    	/// </summary>
        public virtual User LastModifyUser { get; set; }
        /// <summary>
    	
    	/// 获取或设置阅读笔记
        
    	/// </summary>
        public virtual ICollection<BookNote> BookNotes { get; set; }
        /// <summary>
    	
    	/// 获取或设置借阅记录
        
    	/// </summary>
        public virtual ICollection<BorrowRecord> BorrowRecords { get; set; }
    }
}
