
CREATE TABLE [dbo].[ShipmentData](
	[ShipmentID] [bigint] IDENTITY(1,1) NOT NULL,
	[ShipmentNumber] [nvarchar](50) NULL,
	[ShipmentQuantiy] [nvarchar](50) NULL,
	[ShipmentWeight] [nvarchar](50) NULL,
	[ShipmentVessel] [nvarchar](50) NULL,
	[ShipmentDescription] [nvarchar](max) NULL,
	[ShipmentRemarks] [nvarchar](max) NULL,
	[WaybillID] [bigint] NULL,
 CONSTRAINT [PK_ShipmentData] PRIMARY KEY CLUSTERED 
(
	[ShipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


