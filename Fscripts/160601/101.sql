 
DROP TABLE [dbo].[PO_Payments]
GO

 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PO_Payments](
	[ID] [BIGINT] IDENTITY(1,1) NOT NULL,
	[performa_id] [BIGINT] NULL,
	[DayCounts] [BIGINT] NULL,
	[Amount] [FLOAT] NULL,
	[Percenteg] [FLOAT] NULL,
	[AmountDate] [DATE] NULL,
	[AmountState] [NVARCHAR](50) NULL,
	[PayMent_Notes] [NVARCHAR](150) NULL,
 CONSTRAINT [PK_PO_Payments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

