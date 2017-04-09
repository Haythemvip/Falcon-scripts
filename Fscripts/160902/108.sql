
DROP TABLE [dbo].[FinalBalanceForms]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FinalBalanceForms](
	[MezaniaID] [INT] NULL,
	[GroupId] [INT] NOT NULL,
	[FinalMenuID] [INT] NULL,
	[Aaccount_GroupID] [INT] NULL,
	[MethodID] [INT] NULL,
	[MethodTitele] [NVARCHAR](50) NULL
) ON [PRIMARY]

GO


