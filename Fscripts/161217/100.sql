

CREATE TABLE [dbo].[WayBill](
	[WaybillID] [bigint] NOT NULL,
	[CompanyID] [int] NULL,
	[BranchID] [int] NULL,
	[date] [date] NULL,
	[UserID] [int] NULL,
	[LoadingPoint] [nvarchar](50) NULL,
	[LoadSeaport] [bit] NULL,
	[LoadTerminal] [bit] NULL,
	[LoadWhouse] [bit] NULL,
	[LoadAirport] [bit] NULL,
	[ArrivalPoint] [nvarchar](50) NULL,
	[ArrivalSeaport] [bit] NULL,
	[ArrivalTerminal] [bit] NULL,
	[ArrivalWhouse] [bit] NULL,
	[ArrivalAirport] [bit] NULL,
	[CustomerID] [bigint] NULL,
	[Quantity] [nvarchar](50) NULL,
	[ReceivedID] [bigint] NULL,
	[CarrierID] [bigint] NULL,
	[ShipmentID] [bigint] NULL,
	[TruckNumber] [nvarchar](50) NULL,
	[DriverID] [bigint] NULL,
	[TransportAmount] [decimal](18, 2) NULL,
	[Demurrage] [decimal](18, 2) NULL,
	[Other] [decimal](18, 2) NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[LoadArrivalDate] [date] NULL,
	[LoadArrivalTime] [time](7) NULL,
	[LoadDepartureDate] [date] NULL,
	[LoadDepartureTime] [time](7) NULL,
	[DeliveryArrivalDate] [date] NULL,
	[DeliveryArrivalTime] [time](7) NULL,
	[DeliveryunLoadingDate] [date] NULL,
	[DeliveryunLoadingTime] [time](7) NULL,
 CONSTRAINT [PK_WayBill] PRIMARY KEY CLUSTERED 
(
	[WaybillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


