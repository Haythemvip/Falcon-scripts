
 

CREATE TABLE [dbo].[Letter_ChangeValue]
    (
      [ID] [BIGINT] NOT NULL ,
      [Letter_ID] [INT] NULL ,
      [Collateral_NO] [NVARCHAR](50) NULL ,
      [Notes] [NVARCHAR](MAX) NULL ,
      [ChangeDate] [DATE] NULL ,
      [commission] [FLOAT] NULL ,
      [NewValue] [FLOAT] NULL ,
      [insurance] [FLOAT] NULL ,
      CONSTRAINT [PK_Letter_ChangeValue] PRIMARY KEY CLUSTERED ( [ID] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY];

GO



