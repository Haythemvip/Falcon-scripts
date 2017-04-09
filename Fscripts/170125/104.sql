 

CREATE TABLE [dbo].[Inv_CollectHistory](
	[JournalID] [BIGINT] NULL,
	[InvID] [BIGINT] NULL,
	[CollectValue] [FLOAT] NULL,
	[ISTax] [BIT] NULL,
	[IsCome] [BIT] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Inv_CollectHistory] ADD  CONSTRAINT [DF_Inv_CollectHistory_ISTax]  DEFAULT ((0)) FOR [ISTax]
GO

ALTER TABLE [dbo].[Inv_CollectHistory] ADD  CONSTRAINT [DF_Inv_CollectHistory_IsCome]  DEFAULT ((0)) FOR [IsCome]
GO


