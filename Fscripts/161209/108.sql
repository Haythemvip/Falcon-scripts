 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Letter_of_Guarantee](
	[ID] [BIGINT] NOT NULL,
	[Collateral_ID] [INT] NULL,
	[Bank_ID] [INT] NULL,
	[Collateral_NO] [NVARCHAR](50) NULL,
	[Opration] [NVARCHAR](250) NULL,
	[Collateral_Value] [FLOAT] NULL,
	[Collateral_Rat] [FLOAT] NULL,
	[Collateral_Mony] [FLOAT] NULL,
	[Notes] [NVARCHAR](MAX) NULL,
	[Date_Strat] [DATE] NULL,
	[Date_End] [DATE] NULL,
 CONSTRAINT [PK_Letter_of_Guarantee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

