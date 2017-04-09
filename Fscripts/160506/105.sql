 
CREATE TABLE [dbo].[Cashflow](
	[Serial] [BIGINT] IDENTITY(1,1) NOT NULL,
	[InNote] [NVARCHAR](MAX) NULL,
	[InAmount] [FLOAT] NULL,
	[InDate] [DATE] NULL,
	[OutNote] [NVARCHAR](MAX) NULL,
	[OutAmount] [FLOAT] NULL,
	[OutDate] [DATE] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


