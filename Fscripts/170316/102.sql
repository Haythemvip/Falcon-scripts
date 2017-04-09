

CREATE TABLE [dbo].[byan_Discounts](
	[InvoiceNo] [bigint] NULL,
	[Serial] [int] NULL,
	[AccCode] [bigint] NULL,
	[Details] [nvarchar](100) NULL,
	[Notes] [nvarchar](250) NOT NULL,
	[Valcost] [numeric](18, 2) NULL,
	[costid] [bigint] NULL,
	[Costname] [nvarchar](200) NULL,
	[JournalID] [bigint] NULL
) ON [PRIMARY]

GO


