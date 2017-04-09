 
DROP TABLE [dbo].[EmpForm_Extradition]
GO

/****** Object:  Table [dbo].[EmpForm_Extradition]    Script Date: 07/12/2016 07:51:05 � ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmpForm_Extradition](
	[ID] [BIGINT] IDENTITY(1,1) NOT NULL,
	[EmpCode] [BIGINT] NULL,
	[Date] [DATE] NULL,
	[Detail] [NVARCHAR](MAX) NULL,
	[Custody_Status] [VARCHAR](50) NULL,
	[Notes] [NVARCHAR](200) NULL,
 CONSTRAINT [PK_EmpForm_Extradition] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

