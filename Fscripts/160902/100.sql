 

CREATE TABLE [dbo].[FinalMenuSittings](
	[ID] [INT] IDENTITY(1,1) NOT NULL,
	[FainalMenuID] [INT] NULL,
	[Name_Ar] [NVARCHAR](250) NULL,
	[Name_En] [NVARCHAR](250) NULL,
	[SortID] [INT] NULL,
	[isTitle] [INT] NULL,
 CONSTRAINT [PK_FinalMenuSittings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

