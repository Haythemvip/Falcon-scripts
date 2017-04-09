 

CREATE TABLE [dbo].[Loan_Limit](
	[ID] [BIGINT] NULL,
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
	[commission] [FLOAT] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


