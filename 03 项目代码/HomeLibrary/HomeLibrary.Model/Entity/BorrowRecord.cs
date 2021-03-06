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
    /// 借阅记录
    /// </summary>
    public partial class BorrowRecord
    {
        /// <summary>
        /// 获取或设置借阅记录编号
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// 获取或设置图书编号
        /// </summary>
        public int BookID { get; set; }
        /// <summary>
        /// 获取或设置借阅人编号
        /// </summary>
        public int BorrowerID { get; set; }
        /// <summary>
        /// 获取或设置状态，归还否 1=归还，0=未还编号
        /// </summary>
        public byte StatusID { get; set; }
        /// <summary>
        /// 获取或设置借出时间
        /// </summary>
        public System.DateTime BorrowTime { get; set; }
        /// <summary>
        /// 获取或设置归还时间
        /// </summary>
        public Nullable<System.DateTime> ReturnTime { get; set; }
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
        public int LastModifyUserID { get; set; }
        /// <summary>
        /// 获取或设置是否已删除
        /// </summary>
        public bool IsDelete { get; set; }
    
        /// <summary>
    	
    	/// 获取或设置
        
    	/// </summary>
        public virtual Book Book { get; set; }
        /// <summary>
    	
    	/// 获取或设置
        
    	/// </summary>
        public virtual Borrower Borrower { get; set; }
        /// <summary>
    	
    	/// 获取或设置
        
    	/// </summary>
        public virtual User CreateUser { get; set; }
        /// <summary>
    	
    	/// 获取或设置
        
    	/// </summary>
        public virtual User LastModifyUser { get; set; }
    }
}
