 
DROP TABLE [dbo].[improvedsection]
GO

/****** Object:  Table [dbo].[improvedsection]    Script Date: 2/26/2017 4:09:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[improvedsection](
	[improvedid] [BIGINT] IDENTITY(1,1) NOT NULL,
	[depart_id] [BIGINT] NULL,
	[machiinedi] [BIGINT] NULL,
	[improveddate] [DATE] NULL,
	[itemid] [NVARCHAR](MAX) NULL,
	[itemdescrip] [TEXT] NULL,
	[unites] [VARCHAR](50) NULL,
	[itemquantity] [BIGINT] NULL,
	[price] [FLOAT] NULL,
	[total] [FLOAT] NULL,
	[ProunchID] [INT] NULL,
	[COMP_ID] [INT] NULL,
	[Supplire] [NVARCHAR](250) NULL,
 CONSTRAINT [PK_improvedsection] PRIMARY KEY CLUSTERED 
(
	[improvedid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


