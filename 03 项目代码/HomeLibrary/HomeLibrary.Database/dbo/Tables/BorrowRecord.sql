CREATE TABLE [dbo].[BorrowRecord] (
    [ID]               INT      IDENTITY (1, 1) NOT NULL,
    [BookID]           INT      NOT NULL,
    [BorrowerID]       INT      NOT NULL,
    [StatusID]         TINYINT  DEFAULT ((0)) NOT NULL,
    [BorrowTime]       DATETIME NOT NULL,
    [ReturnTime]       DATETIME NULL,
    [CreateTime]       DATETIME NOT NULL,
    [CreateUserID]     INT      NOT NULL,
    [LastModifyTime]   DATETIME NOT NULL,
    [LastModifyUserID] INT      NOT NULL,
    [IsDelete]         BIT      NOT NULL,
    CONSTRAINT [PK_BorrowRecord] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_BorrowRecord_Book] FOREIGN KEY ([BookID]) REFERENCES [dbo].[Book] ([ID]),
    CONSTRAINT [FK_BorrowRecord_Borrower] FOREIGN KEY ([BorrowerID]) REFERENCES [dbo].[Borrower] ([ID]),
    CONSTRAINT [FK_BorrowRecord_User_CreateUser] FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[User] ([ID]),
    CONSTRAINT [FK_BorrowRecord_User_LastModifyUser] FOREIGN KEY ([LastModifyUserID]) REFERENCES [dbo].[User] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '借阅记录', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BorrowRecord';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '借阅记录编号', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BorrowRecord', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '图书编号', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BorrowRecord', @level2type = N'COLUMN', @level2name = N'BookID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '借阅人编号', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BorrowRecord', @level2type = N'COLUMN', @level2name = N'BorrowerID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '状态，归还否 1=归还，0=未还', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BorrowRecord', @level2type = N'COLUMN', @level2name = N'StatusID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '借出时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BorrowRecord', @level2type = N'COLUMN', @level2name = N'BorrowTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '归还时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BorrowRecord', @level2type = N'COLUMN', @level2name = N'ReturnTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '创建时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BorrowRecord', @level2type = N'COLUMN', @level2name = N'CreateTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '创建人', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BorrowRecord', @level2type = N'COLUMN', @level2name = N'CreateUserID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '最后修改时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BorrowRecord', @level2type = N'COLUMN', @level2name = N'LastModifyTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '最后修改人', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BorrowRecord', @level2type = N'COLUMN', @level2name = N'LastModifyUserID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '是否已删除', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BorrowRecord', @level2type = N'COLUMN', @level2name = N'IsDelete';

