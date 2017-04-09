
CREATE TABLE [dbo].[Load_Report](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[WaybillID] [bigint] NULL,
	[Note_index] [int] NULL,
	[LoadingNote] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoadBranchReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

