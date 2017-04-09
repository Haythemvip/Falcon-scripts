 
DROP TABLE [dbo].[berchasebetweendate]
GO
 
CREATE TABLE [dbo].[berchasebetweendate](
	[itemid] [BIGINT] NULL,
	[itemname] [NVARCHAR](MAX) NULL,
	[unit] [NVARCHAR](50) NULL,
	[quantity] [FLOAT] NULL,
	[valsum] [FLOAT] NULL,
	[avrege] [FLOAT] NULL,
	[pricepercent] [FLOAT] NULL,
	[qpercent] [FLOAT] NULL,
	[fromdate] [NVARCHAR](50) NULL,
	[todate] [NVARCHAR](50) NULL,
	[store] [NVARCHAR](50) NULL,
	[tasnef] [NVARCHAR](50) NULL,
	[grouup] [NVARCHAR](50) NULL,
	[supgroup] [NVARCHAR](50) NULL,
	[moared] [NVARCHAR](50) NULL,
	[flag] [BIT] NULL CONSTRAINT [DF_berchasebetweendate_flag]  DEFAULT ((1))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


