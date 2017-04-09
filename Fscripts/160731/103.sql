
CREATE TABLE [dbo].[Cartraffic](
	[ID] [int] NULL,
	[Date] [nvarchar](50) NULL,
	[DriverName] [nvarchar](50) NULL,
	[DriverID] [int] NULL,
	[Exittime] [nvarchar](50) NULL,
	[Returntime] [nvarchar](50) NULL,
	[Destination] [nvarchar](max) NULL,
	[CounterET] [nchar](10) NULL,
	[CounterRT] [nchar](10) NULL,
	[Purpose] [nvarchar](max) NULL,
	[Note] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


