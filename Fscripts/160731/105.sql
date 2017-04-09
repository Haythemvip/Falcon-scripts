

CREATE TABLE [dbo].[Visitors]
    (
      [VisitID] [INT] NOT NULL ,
      [VisitDatetime] [NVARCHAR](50) NULL ,
      [VisitorsName] [NVARCHAR](50) NULL ,
      [VisitPurpose] [TEXT] NULL ,
      [EnterTime] [DATETIME] NULL ,
      [ExitTime] [DATETIME] NULL ,
      [CarNum] [NVARCHAR](50) NULL ,
      [Note] [TEXT] NULL ,
      CONSTRAINT [PK_Visitors] PRIMARY KEY CLUSTERED ( [VisitID] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


