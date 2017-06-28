/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2017/6/11 18:17:25                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Book') and o.name = 'FK_Book_BookCategory')
alter table Book
   drop constraint FK_Book_BookCategory
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Book') and o.name = 'FK_Book_User_LastModifyUser')
alter table Book
   drop constraint FK_Book_User_LastModifyUser
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Book') and o.name = 'FK_Book_User_CreateUser')
alter table Book
   drop constraint FK_Book_User_CreateUser
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BookCategory') and o.name = 'FK_BookCategory_User_CreateUser')
alter table BookCategory
   drop constraint FK_BookCategory_User_CreateUser
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BookCategory') and o.name = 'FK_BookCategory_User_LastModifyUser')
alter table BookCategory
   drop constraint FK_BookCategory_User_LastModifyUser
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BookNote') and o.name = 'FK_BookNote_Book')
alter table BookNote
   drop constraint FK_BookNote_Book
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BookNote') and o.name = 'FK_BookNote_User_CreateUser')
alter table BookNote
   drop constraint FK_BookNote_User_CreateUser
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BookNote') and o.name = 'FK_BookNote_User_LastModifyUser')
alter table BookNote
   drop constraint FK_BookNote_User_LastModifyUser
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BorrowRecord') and o.name = 'FK_BorrowRecord_Book')
alter table BorrowRecord
   drop constraint FK_BorrowRecord_Book
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BorrowRecord') and o.name = 'FK_BorrowRecord_Borrower')
alter table BorrowRecord
   drop constraint FK_BorrowRecord_Borrower
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BorrowRecord') and o.name = 'FK_BorrowRecord_User_CreateUser')
alter table BorrowRecord
   drop constraint FK_BorrowRecord_User_CreateUser
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BorrowRecord') and o.name = 'FK_BorrowRecord_User_LastModifyUser')
alter table BorrowRecord
   drop constraint FK_BorrowRecord_User_LastModifyUser
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Borrower') and o.name = 'FK_Borrower_User_CreateUser')
alter table Borrower
   drop constraint FK_Borrower_User_CreateUser
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Borrower') and o.name = 'FK_Borrower_User_LastModifyUser')
alter table Borrower
   drop constraint FK_Borrower_User_LastModifyUser
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"User"') and o.name = 'FK_User_User_CreateUser')
alter table "User"
   drop constraint FK_User_User_CreateUser
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"User"') and o.name = 'FK_User_User_LastModifyUser')
alter table "User"
   drop constraint FK_User_User_LastModifyUser
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Book')
            and   type = 'U')
   drop table Book
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BookCategory')
            and   type = 'U')
   drop table BookCategory
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BookNote')
            and   type = 'U')
   drop table BookNote
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BorrowRecord')
            and   type = 'U')
   drop table BorrowRecord
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Borrower')
            and   type = 'U')
   drop table Borrower
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"User"')
            and   type = 'U')
   drop table "User"
go

/*==============================================================*/
/* Table: Book                                                  */
/*==============================================================*/
create table Book (
   ID                   int                  identity,
   ISBN                 varchar(20)          not null,
   BookName             varchar(50)          not null,
   Author               varchar(50)          null,
   Publisher            varchar(50)          null,
   BookCategoryID       int                  null,
   StatusID             tinyint              not null,
   Language             varchar(50)          null,
   Icon                 varchar(100)         null,
   Description          varchar(1000)        null,
   BookSize             varchar(10)          null,
   Price                decimal              null,
   Revision             varchar(50)          null,
   TypeID               tinyint              not null,
   BoughtTime           datetime             null,
   CreateTime           datetime             not null,
   CreateUserID         int                  not null,
   LastModifyTime       datetime             not null,
   LastModifyUserID     int                  null,
   IsDelete             bit                  not null,
   constraint PK_Book primary key (ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图书信息',
   'user', @CurrentUser, 'table', 'Book'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图书编号',
   'user', @CurrentUser, 'table', 'Book', 'column', 'ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ISBN号',
   'user', @CurrentUser, 'table', 'Book', 'column', 'ISBN'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '书名',
   'user', @CurrentUser, 'table', 'Book', 'column', 'BookName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '作者',
   'user', @CurrentUser, 'table', 'Book', 'column', 'Author'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '出版社',
   'user', @CurrentUser, 'table', 'Book', 'column', 'Publisher'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '分类',
   'user', @CurrentUser, 'table', 'Book', 'column', 'BookCategoryID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '状态，在家不在家。1在家，0不在家。',
   'user', @CurrentUser, 'table', 'Book', 'column', 'StatusID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '语种',
   'user', @CurrentUser, 'table', 'Book', 'column', 'Language'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '封面图片地址',
   'user', @CurrentUser, 'table', 'Book', 'column', 'Icon'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Book', 'column', 'Description'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '开本',
   'user', @CurrentUser, 'table', 'Book', 'column', 'BookSize'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '价格',
   'user', @CurrentUser, 'table', 'Book', 'column', 'Price'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '版次',
   'user', @CurrentUser, 'table', 'Book', 'column', 'Revision'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '书的分类，电子，实体 1=实体，2=电子',
   'user', @CurrentUser, 'table', 'Book', 'column', 'TypeID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '购买时间',
   'user', @CurrentUser, 'table', 'Book', 'column', 'BoughtTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Book', 'column', 'CreateTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', @CurrentUser, 'table', 'Book', 'column', 'CreateUserID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改时间',
   'user', @CurrentUser, 'table', 'Book', 'column', 'LastModifyTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改人',
   'user', @CurrentUser, 'table', 'Book', 'column', 'LastModifyUserID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否已删除',
   'user', @CurrentUser, 'table', 'Book', 'column', 'IsDelete'
go

/*==============================================================*/
/* Table: BookCategory                                          */
/*==============================================================*/
create table BookCategory (
   ID                   int                  identity,
   CategoryName         nvarchar(32)         not null,
   CreateTime           datetime             not null,
   CreateUserID         int                  not null,
   LastModifyTime       datetime             not null,
   LastModifyUserID     int                  not null,
   IsDelete             bit                  not null,
   constraint PK_BookCategory primary key (ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图书分类',
   'user', @CurrentUser, 'table', 'BookCategory'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图书分类编号',
   'user', @CurrentUser, 'table', 'BookCategory', 'column', 'ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图书分类名称',
   'user', @CurrentUser, 'table', 'BookCategory', 'column', 'CategoryName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'BookCategory', 'column', 'CreateTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', @CurrentUser, 'table', 'BookCategory', 'column', 'CreateUserID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改时间',
   'user', @CurrentUser, 'table', 'BookCategory', 'column', 'LastModifyTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改人',
   'user', @CurrentUser, 'table', 'BookCategory', 'column', 'LastModifyUserID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否已删除',
   'user', @CurrentUser, 'table', 'BookCategory', 'column', 'IsDelete'
go

/*==============================================================*/
/* Table: BookNote                                              */
/*==============================================================*/
create table BookNote (
   ID                   int                  identity,
   BookID               int                  not null,
   Title                nvarchar(50)         not null,
   Content              nvarchar(max)        null,
   BeginTime            datetime             null,
   EndTime              datetime             null,
   CreateTime           datetime             not null,
   CreateUserID         int                  not null,
   LastModifyTime       datetime             not null,
   LastModifyUserID     int                  not null,
   IsDelete             bit                  not null,
   constraint PK_BookNote primary key (ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '阅读笔记',
   'user', @CurrentUser, 'table', 'BookNote'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '阅读笔记编号',
   'user', @CurrentUser, 'table', 'BookNote', 'column', 'ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图书编号',
   'user', @CurrentUser, 'table', 'BookNote', 'column', 'BookID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '标题',
   'user', @CurrentUser, 'table', 'BookNote', 'column', 'Title'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '笔记内容',
   'user', @CurrentUser, 'table', 'BookNote', 'column', 'Content'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '阅读开始时间',
   'user', @CurrentUser, 'table', 'BookNote', 'column', 'BeginTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '阅读结束时间',
   'user', @CurrentUser, 'table', 'BookNote', 'column', 'EndTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'BookNote', 'column', 'CreateTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', @CurrentUser, 'table', 'BookNote', 'column', 'CreateUserID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改时间',
   'user', @CurrentUser, 'table', 'BookNote', 'column', 'LastModifyTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改人',
   'user', @CurrentUser, 'table', 'BookNote', 'column', 'LastModifyUserID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否已删除',
   'user', @CurrentUser, 'table', 'BookNote', 'column', 'IsDelete'
go

/*==============================================================*/
/* Table: BorrowRecord                                          */
/*==============================================================*/
create table BorrowRecord (
   ID                   int                  identity,
   BookID               int                  not null,
   BorrowerID           int                  not null,
   StatusID             tinyint              not null default 0,
   BorrowTime           datetime             not null,
   ReturnTime           datetime             null,
   CreateTime           datetime             not null,
   CreateUserID         int                  not null,
   LastModifyTime       datetime             not null,
   LastModifyUserID     int                  not null,
   IsDelete             bit                  not null,
   constraint PK_BorrowRecord primary key (ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '借阅记录',
   'user', @CurrentUser, 'table', 'BorrowRecord'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '借阅记录编号',
   'user', @CurrentUser, 'table', 'BorrowRecord', 'column', 'ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图书编号',
   'user', @CurrentUser, 'table', 'BorrowRecord', 'column', 'BookID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '借阅人编号',
   'user', @CurrentUser, 'table', 'BorrowRecord', 'column', 'BorrowerID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '状态，归还否 1=归还，0=未还',
   'user', @CurrentUser, 'table', 'BorrowRecord', 'column', 'StatusID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '借出时间',
   'user', @CurrentUser, 'table', 'BorrowRecord', 'column', 'BorrowTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '归还时间',
   'user', @CurrentUser, 'table', 'BorrowRecord', 'column', 'ReturnTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'BorrowRecord', 'column', 'CreateTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', @CurrentUser, 'table', 'BorrowRecord', 'column', 'CreateUserID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改时间',
   'user', @CurrentUser, 'table', 'BorrowRecord', 'column', 'LastModifyTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改人',
   'user', @CurrentUser, 'table', 'BorrowRecord', 'column', 'LastModifyUserID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否已删除',
   'user', @CurrentUser, 'table', 'BorrowRecord', 'column', 'IsDelete'
go

/*==============================================================*/
/* Table: Borrower                                              */
/*==============================================================*/
create table Borrower (
   ID                   int                  identity,
   BorrowerName         nvarchar(64)         not null,
   Gender               tinyint              null,
   Cellphone            varchar(20)          null,
   Email                varchar(32)          null,
   Relationship         nvarchar(32)         null,
   Record               tinyint              null,
   CreateTime           datetime             not null,
   CreateUserID         int                  not null,
   LastModifyTime       datetime             not null,
   LastModifyUserID     int                  not null,
   IsDelete             bit                  not null,
   constraint PK_Borrower primary key (ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '借阅人',
   'user', @CurrentUser, 'table', 'Borrower'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '借阅人编号',
   'user', @CurrentUser, 'table', 'Borrower', 'column', 'ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '借阅人姓名',
   'user', @CurrentUser, 'table', 'Borrower', 'column', 'BorrowerName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '借阅人性别',
   'user', @CurrentUser, 'table', 'Borrower', 'column', 'Gender'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '电话',
   'user', @CurrentUser, 'table', 'Borrower', 'column', 'Cellphone'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮箱',
   'user', @CurrentUser, 'table', 'Borrower', 'column', 'Email'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '关系',
   'user', @CurrentUser, 'table', 'Borrower', 'column', 'Relationship'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '信用记录',
   'user', @CurrentUser, 'table', 'Borrower', 'column', 'Record'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Borrower', 'column', 'CreateTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', @CurrentUser, 'table', 'Borrower', 'column', 'CreateUserID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改时间',
   'user', @CurrentUser, 'table', 'Borrower', 'column', 'LastModifyTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改人',
   'user', @CurrentUser, 'table', 'Borrower', 'column', 'LastModifyUserID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否已删除',
   'user', @CurrentUser, 'table', 'Borrower', 'column', 'IsDelete'
go

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" (
   ID                   int                  identity,
   Account              varchar(20)          not null,
   UserName             nvarchar(64)         not null,
   Password             varchar(64)          not null,
   LastVisitTime        datetime             null,
   CreateTime           datetime             not null,
   CreateUserID         int                  null,
   LastModifyTime       datetime             not null,
   LastModifyUserID     int                  null,
   IsDelete             bit                  not null,
   constraint PK_User primary key (ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户编号',
   'user', @CurrentUser, 'table', 'User', 'column', 'ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '登录名',
   'user', @CurrentUser, 'table', 'User', 'column', 'Account'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户姓名',
   'user', @CurrentUser, 'table', 'User', 'column', 'UserName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '密码',
   'user', @CurrentUser, 'table', 'User', 'column', 'Password'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后一次访问时间',
   'user', @CurrentUser, 'table', 'User', 'column', 'LastVisitTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'User', 'column', 'CreateTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', @CurrentUser, 'table', 'User', 'column', 'CreateUserID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改时间',
   'user', @CurrentUser, 'table', 'User', 'column', 'LastModifyTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后修改人',
   'user', @CurrentUser, 'table', 'User', 'column', 'LastModifyUserID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否已删除',
   'user', @CurrentUser, 'table', 'User', 'column', 'IsDelete'
go

alter table Book
   add constraint FK_Book_BookCategory foreign key (BookCategoryID)
      references BookCategory (ID)
go

alter table Book
   add constraint FK_Book_User_LastModifyUser foreign key (LastModifyUserID)
      references "User" (ID)
go

alter table Book
   add constraint FK_Book_User_CreateUser foreign key (CreateUserID)
      references "User" (ID)
go

alter table BookCategory
   add constraint FK_BookCategory_User_CreateUser foreign key (CreateUserID)
      references "User" (ID)
go

alter table BookCategory
   add constraint FK_BookCategory_User_LastModifyUser foreign key (LastModifyUserID)
      references "User" (ID)
go

alter table BookNote
   add constraint FK_BookNote_Book foreign key (BookID)
      references Book (ID)
go

alter table BookNote
   add constraint FK_BookNote_User_CreateUser foreign key (CreateUserID)
      references "User" (ID)
go

alter table BookNote
   add constraint FK_BookNote_User_LastModifyUser foreign key (LastModifyUserID)
      references "User" (ID)
go

alter table BorrowRecord
   add constraint FK_BorrowRecord_Book foreign key (BookID)
      references Book (ID)
go

alter table BorrowRecord
   add constraint FK_BorrowRecord_Borrower foreign key (BorrowerID)
      references Borrower (ID)
go

alter table BorrowRecord
   add constraint FK_BorrowRecord_User_CreateUser foreign key (CreateUserID)
      references "User" (ID)
go

alter table BorrowRecord
   add constraint FK_BorrowRecord_User_LastModifyUser foreign key (LastModifyUserID)
      references "User" (ID)
go

alter table Borrower
   add constraint FK_Borrower_User_CreateUser foreign key (CreateUserID)
      references "User" (ID)
go

alter table Borrower
   add constraint FK_Borrower_User_LastModifyUser foreign key (LastModifyUserID)
      references "User" (ID)
go

alter table "User"
   add constraint FK_User_User_CreateUser foreign key (CreateUserID)
      references "User" (ID)
go

alter table "User"
   add constraint FK_User_User_LastModifyUser foreign key (LastModifyUserID)
      references "User" (ID)
go

