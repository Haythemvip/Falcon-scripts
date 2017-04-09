

DROP TABLE [dbo].[berchasebetweendate]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[berchasebetweendate](
	[itemid] [BIGINT] NULL,
	[itemname] [NVARCHAR](MAX) NULL,
	[unit] [NVARCHAR](50) NULL,
	[quantity] [FLOAT] NULL,
	[valsum] [FLOAT] NULL,
	[avrege] [DECIMAL](18, 4) NULL,
	[pricepercent] [DECIMAL](18, 2) NULL,
	[qpercent] [DECIMAL](18, 2) NULL,
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


