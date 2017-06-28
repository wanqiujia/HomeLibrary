CREATE TABLE [dbo].[Borrower] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [BorrowerName]     NVARCHAR (64) NOT NULL,
    [Gender]           TINYINT       NULL,
    [Cellphone]        VARCHAR (20)  NULL,
    [Email]            VARCHAR (32)  NULL,
    [Relationship]     NVARCHAR (32) NULL,
    [Record]           TINYINT       NULL,
    [CreateTime]       DATETIME      NOT NULL,
    [CreateUserID]     INT           NOT NULL,
    [LastModifyTime]   DATETIME      NOT NULL,
    [LastModifyUserID] INT           NOT NULL,
    [IsDelete]         BIT           NOT NULL,
    CONSTRAINT [PK_Borrower] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Borrower_User_CreateUser] FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[User] ([ID]),
    CONSTRAINT [FK_Borrower_User_LastModifyUser] FOREIGN KEY ([LastModifyUserID]) REFERENCES [dbo].[User] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '借阅人', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Borrower';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '借阅人编号', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Borrower', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '借阅人姓名', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Borrower', @level2type = N'COLUMN', @level2name = N'BorrowerName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '借阅人性别', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Borrower', @level2type = N'COLUMN', @level2name = N'Gender';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '电话', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Borrower', @level2type = N'COLUMN', @level2name = N'Cellphone';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '邮箱', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Borrower', @level2type = N'COLUMN', @level2name = N'Email';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '关系', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Borrower', @level2type = N'COLUMN', @level2name = N'Relationship';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '信用记录', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Borrower', @level2type = N'COLUMN', @level2name = N'Record';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '创建时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Borrower', @level2type = N'COLUMN', @level2name = N'CreateTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '创建人', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Borrower', @level2type = N'COLUMN', @level2name = N'CreateUserID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '最后修改时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Borrower', @level2type = N'COLUMN', @level2name = N'LastModifyTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '最后修改人', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Borrower', @level2type = N'COLUMN', @level2name = N'LastModifyUserID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '是否已删除', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Borrower', @level2type = N'COLUMN', @level2name = N'IsDelete';

