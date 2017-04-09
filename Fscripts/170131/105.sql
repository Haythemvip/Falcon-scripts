 

CREATE TABLE [dbo].[Loan_Extend](
	[ID] [bigint] NOT NULL,
	[Letter_ID] [int] NULL,
	[Collateral_NO] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
	[Date_Strat] [date] NULL,
	[Date_End] [date] NULL,
	[commission] [float] NULL,
	[KaidID] [bigint] NULL,
	[Journal] [bigint] NULL,
	[OstazID] [int] NULL,
	[CostID] [bigint] NULL,
	[CurrnceID] [int] NULL,
	[ActionDate] [date] NULL,
 CONSTRAINT [PK_Loan_Extend] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Loan_Extend] ADD  DEFAULT (getdate()) FOR [ActionDate]
GO


