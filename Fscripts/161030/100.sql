
CREATE TABLE [dbo].[CostGroups](
	[ClassificationId] [int] NOT NULL,
	[ClassificationName] [nvarchar](50) NULL,
 CONSTRAINT [PK_CostGroupsSetting] PRIMARY KEY CLUSTERED 
(
	[ClassificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


