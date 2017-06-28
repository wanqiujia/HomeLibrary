CREATE TABLE [dbo].[BookNote] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [BookID]           INT            NOT NULL,
    [Title]            NVARCHAR (50)  NOT NULL,
    [Content]          NVARCHAR (MAX) NULL,
    [BeginTime]        DATETIME       NULL,
    [EndTime]          DATETIME       NULL,
    [CreateTime]       DATETIME       NOT NULL,
    [CreateUserID]     INT            NOT NULL,
    [LastModifyTime]   DATETIME       NOT NULL,
    [LastModifyUserID] INT            NOT NULL,
    [IsDelete]         BIT            NOT NULL,
    CONSTRAINT [PK_BookNote] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_BookNote_Book] FOREIGN KEY ([BookID]) REFERENCES [dbo].[Book] ([ID]),
    CONSTRAINT [FK_BookNote_User_CreateUser] FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[User] ([ID]),
    CONSTRAINT [FK_BookNote_User_LastModifyUser] FOREIGN KEY ([LastModifyUserID]) REFERENCES [dbo].[User] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '阅读笔记', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '阅读笔记编号', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookNote', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '图书编号', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookNote', @level2type = N'COLUMN', @level2name = N'BookID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '标题', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookNote', @level2type = N'COLUMN', @level2name = N'Title';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '笔记内容', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookNote', @level2type = N'COLUMN', @level2name = N'Content';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '阅读开始时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookNote', @level2type = N'COLUMN', @level2name = N'BeginTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '阅读结束时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookNote', @level2type = N'COLUMN', @level2name = N'EndTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '创建时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookNote', @level2type = N'COLUMN', @level2name = N'CreateTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '创建人', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookNote', @level2type = N'COLUMN', @level2name = N'CreateUserID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '最后修改时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookNote', @level2type = N'COLUMN', @level2name = N'LastModifyTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '最后修改人', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookNote', @level2type = N'COLUMN', @level2name = N'LastModifyUserID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '是否已删除', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BookNote', @level2type = N'COLUMN', @level2name = N'IsDelete';

