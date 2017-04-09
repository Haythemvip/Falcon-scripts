 
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Colors](
	[ID] [BIGINT] IDENTITY(1,1) NOT NULL,
	[ColorName] [NVARCHAR](50) NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

