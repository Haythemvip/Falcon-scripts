 
DROP TABLE [dbo].[Signing]
GO

 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Signing](
	[Mydepart_Id] [INT] NULL,
	[MyDepart_Name] [NVARCHAR](150) NULL,
	[UserID] [INT] NULL,
	[UserName] [NVARCHAR](150) NULL,
	[DepartID] [INT] NULL,
	[DepartName] [NVARCHAR](150) NULL
) ON [PRIMARY]

GO


