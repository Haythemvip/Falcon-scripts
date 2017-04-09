

CREATE TABLE [dbo].[Po_Pyment_Journal](
	[PayNO] [BIGINT] NULL,
	[PO_NO] [BIGINT] NULL,
	[Vender_Name] [NVARCHAR](150) NULL,
	[Value] [FLOAT] NULL,
	[Action_Date] [DATE] NULL,
	[PayMentType] [NVARCHAR](50) NULL,
	[Journal] [BIGINT] NULL,
	[AccName] [NVARCHAR](150) NULL,
	[PO_Payments_ID] [BIGINT] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Po_Pyment_Journal]  WITH CHECK ADD  CONSTRAINT [FK_Po_Pyment_Journal_PO_Payments] FOREIGN KEY([PO_Payments_ID])
REFERENCES [dbo].[PO_Payments] ([ID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Po_Pyment_Journal] CHECK CONSTRAINT [FK_Po_Pyment_Journal_PO_Payments]
GO


