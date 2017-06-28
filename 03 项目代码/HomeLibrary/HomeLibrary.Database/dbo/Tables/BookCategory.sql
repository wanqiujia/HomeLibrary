CREATE TABLE [dbo].[BookCategory] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [CategoryName]     NVARCHAR (32) NOT NULL,
    [CreateTime]       DATETIME      NOT NULL,
    [CreateUserID]     INT           NOT NULL,
    [LastModifyTime]   DATETIME      NOT NULL,
    [LastModifyUserID] INT           NOT NULL,
    [IsDelete]         BIT           NOT NULL,
    CONSTRAINT [PK_BookCategory] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_BookCategory_User_CreateUser] FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[User] ([ID]),
    CONSTRAINT [FK_BookCategory_User_LastModifyUser] FOREIGN KEY ([LastModifyUserID]) REFERENCES [dbo].[User] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '图书分类', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookCategory';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '图书分类编号', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookCategory', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '图书分类名称', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookCategory', @level2type = N'COLUMN', @level2name = N'CategoryName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '创建时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookCategory', @level2type = N'COLUMN', @level2name = N'CreateTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '创建人', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookCategory', @level2type = N'COLUMN', @level2name = N'CreateUserID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '最后修改时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookCategory', @level2type = N'COLUMN', @level2name = N'LastModifyTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '最后修改人', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookCategory', @level2type = N'COLUMN', @level2name = N'LastModifyUserID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '是否已删除', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookCategory', @level2type = N'COLUMN', @level2name = N'IsDelete';

