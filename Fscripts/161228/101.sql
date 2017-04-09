
CREATE TABLE [dbo].[Shiping_Details]
    (
      [ShipingDetailsID] [BIGINT] IDENTITY(1, 1)
                                  NOT NULL ,
      [Type_goods] [NVARCHAR](50) NULL ,
      [Unit] [NVARCHAR](10) NULL ,
      [Quantity] [BIGINT] NULL ,
      [Weight] [NVARCHAR](10) NULL ,
      [ShipingID] [BIGINT] NULL ,
      [DetailsIindex] [INT] NULL ,
      CONSTRAINT [PK_Shiping_Details] PRIMARY KEY CLUSTERED
        ( [ShipingDetailsID] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


