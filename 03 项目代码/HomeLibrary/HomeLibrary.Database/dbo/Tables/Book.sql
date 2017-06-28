CREATE TABLE [dbo].[Book] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [ISBN]             VARCHAR (20)   NOT NULL,
    [BookName]         VARCHAR (50)   NOT NULL,
    [Author]           VARCHAR (50)   NULL,
    [Publisher]        VARCHAR (50)   NULL,
    [BookCategoryID]   INT            NULL,
    [StatusID]         TINYINT        NOT NULL,
    [Language]         VARCHAR (50)   NULL,
    [Icon]             VARCHAR (100)  NULL,
    [Description]      VARCHAR (1000) NULL,
    [BookSize]         VARCHAR (10)   NULL,
    [Price]            DECIMAL (18)   NULL,
    [Revision]         VARCHAR (50)   NULL,
    [TypeID]           TINYINT        NOT NULL,
    [BoughtTime]       DATETIME       NULL,
    [CreateTime]       DATETIME       NOT NULL,
    [CreateUserID]     INT            NOT NULL,
    [LastModifyTime]   DATETIME       NOT NULL,
    [LastModifyUserID] INT            NULL,
    [IsDelete]         BIT            NOT NULL,
	[Remark]  AS ((((((((((isnull([ISBN],'')+' ')+isnull([BookName],''))+' ')+isnull([Author],''))+' ')+isnull([Publisher],''))+' ')+isnull([Language],''))+' ')+isnull([Description],'')) PERSISTED NOT NULL,
    CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Book_BookCategory] FOREIGN KEY ([BookCategoryID]) REFERENCES [dbo].[BookCategory] ([ID]),
    CONSTRAINT [FK_Book_User_CreateUser] FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[User] ([ID]),
    CONSTRAINT [FK_Book_User_LastModifyUser] FOREIGN KEY ([LastModifyUserID]) REFERENCES [dbo].[User] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '图书信息', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '图书编号', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'ISBN号', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'ISBN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '书名', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'BookName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '作者', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'Author';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '出版社', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'Publisher';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '分类', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'BookCategoryID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '状态，在家不在家。1在家，0不在家。', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'StatusID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '语种', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'Language';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '封面图片地址', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'Icon';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '描述', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '开本', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'BookSize';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '价格', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'Price';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '版次', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'Revision';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '书的分类，电子，实体 1=实体，2=电子', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'TypeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '购买时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'BoughtTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '创建时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'CreateTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '创建人', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'CreateUserID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '最后修改时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'LastModifyTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '最后修改人', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'LastModifyUserID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '是否已删除', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'IsDelete';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '全文索引列', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Book', @level2type = N'COLUMN', @level2name = N'Remark';
