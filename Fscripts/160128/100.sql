
CREATE TABLE [dbo].[FinancialYear](
	[YearName] [INT] NOT NULL,
	[FromDate] [DATE] NULL,
	[ToDate] [DATE] NULL,
 CONSTRAINT [PK_FinancialYear_1] PRIMARY KEY CLUSTERED 
(
	[YearName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

