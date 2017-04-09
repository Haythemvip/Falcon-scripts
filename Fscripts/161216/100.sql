 

CREATE TABLE [dbo].[Signed_Settings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TagID] [int] NULL,
	[ActionName] [nvarchar](150) NULL,
	[CaseID] [int] NULL,
	[Authorized_ID] [int] NULL,
	[Authorized] [nvarchar](150) NULL,
	[Mandatory] [bit] NULL,
 CONSTRAINT [PK_Signed_Settings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Signed_Settings] ADD  CONSTRAINT [DF_Signed_Settings_Mandatory]  DEFAULT ((0)) FOR [Mandatory]
GO


