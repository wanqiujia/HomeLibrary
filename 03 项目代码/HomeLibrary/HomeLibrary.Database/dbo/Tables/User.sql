CREATE TABLE [dbo].[User] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [Account]          VARCHAR (20)  NOT NULL,
    [UserName]         NVARCHAR (64) NOT NULL,
    [Password]         VARCHAR (64)  NOT NULL,
    [LastVisitTime]    DATETIME      NULL,
    [CreateTime]       DATETIME      NOT NULL,
    [CreateUserID]     INT           NULL,
    [LastModifyTime]   DATETIME      NOT NULL,
    [LastModifyUserID] INT           NULL,
    [IsDelete]         BIT           NOT NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_User_User_CreateUser] FOREIGN KEY ([CreateUserID]) REFERENCES [dbo].[User] ([ID]),
    CONSTRAINT [FK_User_User_LastModifyUser] FOREIGN KEY ([LastModifyUserID]) REFERENCES [dbo].[User] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '用户编号', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'User', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '登录名', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'User', @level2type = N'COLUMN', @level2name = N'Account';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '用户姓名', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'User', @level2type = N'COLUMN', @level2name = N'UserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '密码', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'User', @level2type = N'COLUMN', @level2name = N'Password';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '最后一次访问时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'User', @level2type = N'COLUMN', @level2name = N'LastVisitTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '创建时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'User', @level2type = N'COLUMN', @level2name = N'CreateTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '创建人', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'User', @level2type = N'COLUMN', @level2name = N'CreateUserID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '最后修改时间', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'User', @level2type = N'COLUMN', @level2name = N'LastModifyTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '最后修改人', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'User', @level2type = N'COLUMN', @level2name = N'LastModifyUserID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '是否已删除', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'User', @level2type = N'COLUMN', @level2name = N'IsDelete';

