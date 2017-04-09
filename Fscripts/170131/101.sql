 

CREATE TABLE [dbo].[Loan_Used](
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
	[commission] [FLOAT] NULL,
	[JournalEnd] [BIGINT] NULL,
	[KIdIDEnd] [BIGINT] NULL,
	[NewValue] [FLOAT] NULL,
	[NewINs] [FLOAT] NULL,
	[KaidID] [BIGINT] NULL,
	[Journal] [BIGINT] NULL,
	[OstazID] [INT] NULL,
	[CostID] [BIGINT] NULL,
	[CurrnceID] [INT] NULL,
	[ActionDate] [DATE] NULL,
	[ProjectID] [BIGINT] NULL,
	[VedorID] [BIGINT] NULL,
 CONSTRAINT [PK_Loan_Used] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Loan_Used] ADD  DEFAULT (GETDATE()) FOR [ActionDate]
GO


