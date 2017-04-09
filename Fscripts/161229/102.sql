
CREATE TABLE [dbo].[Transport_Order](
	[ID] [bigint] NOT NULL,
	[CustomerID] [bigint] NULL,
	[StorageFeesStartDate] [date] NULL,
	[Place_transport] [nvarchar](150) NULL,
	[PortID] [bigint] NULL,
	[No_container] [nvarchar](150) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Transport_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


