 

 


CREATE TABLE [dbo].[El_Koyod_El_Yawmia_Request](
	[ID] [BIGINT] NOT NULL,
	[KaidID] [BIGINT] NOT NULL,
	[OstazID] [INT] NOT NULL,
	[OstasName] [NVARCHAR](50) NULL,
	[Seyial] [INT] NOT NULL,
	[Detis] [VARCHAR](500) NULL,
	[AccID] [BIGINT] NULL,
	[AccName] [NVARCHAR](500) NULL,
	[Maden] [DECIMAL](18, 2) NULL,
	[Daen] [DECIMAL](18, 2) NULL,
	[aDate] [DATE] NULL,
	[trancename] [TEXT] NULL,
	[Notes] [TEXT] NULL,
	[ProunchID] [INT] NULL,
	[COMP_ID] [INT] NULL,
	[IsStartedBalance] [BIT] NULL,
	[costid] [BIGINT] NULL,
	[CurID] [INT] NULL,
	[UserAA] [NVARCHAR](50) NULL,
	[year] [INT] NULL,
	[DayName] [NVARCHAR](50) NULL,
	[Loked] [BIT] NULL,
	[CostTypeID] [INT] NULL,
	[CostTypeName] [NVARCHAR](50) NULL,
	[Acccode2] [BIGINT] NULL,
	[AccName2] [NVARCHAR](250) NULL,
	[DocJorrnal] [NVARCHAR](50) NULL,
	[contType] [CHAR](1) NULL,
	[QestNO] [INT] NULL,
	[ContNO] [INT] NULL,
	[CaseID] [BIGINT] NULL,
	[CaseName] [NVARCHAR](50) NULL,
	[DocNO] [NVARCHAR](50) NULL,
	[Destination] [NVARCHAR](250) NULL,
	[Date_Add] [DATE] NULL,
	[BeneficiaryCode] [NVARCHAR](50) NULL,
	[Beneficiary] [NVARCHAR](50) NULL,
	 
 CONSTRAINT [PK_El_Koyod_El_Yawmia_Request] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Seyial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[El_Koyod_El_Yawmia_Request] ADD  CONSTRAINT [DF__El_Koyod_Requst___IsSta__2878DCDC]  DEFAULT ((0)) FOR [IsStartedBalance]
GO

ALTER TABLE [dbo].[El_Koyod_El_Yawmia_Request] ADD  CONSTRAINT [DF_El_Koyod_El_Yawmia_Request_Loked]  DEFAULT ((0)) FOR [Loked]
GO

ALTER TABLE [dbo].[El_Koyod_El_Yawmia_Request] ADD  DEFAULT (GETDATE()) FOR [Date_Add]
GO


