
 
CREATE TYPE [dbo].[JournalType_Requst] AS TABLE(
	[Seyial] [INT] NULL,
	[Maden] [DECIMAL](18, 2) NULL,
	[Daen] [DECIMAL](18, 2) NULL,
	[Detis] [NVARCHAR](MAX) NULL,
	[AccID] [BIGINT] NULL,
	[AccName] [NVARCHAR](500) NULL,
	[costid] [BIGINT] NULL,
	[CostName] [NVARCHAR](MAX) NULL,
	[DocNO] [NVARCHAR](50) NULL,
	[CostTypeID] [INT] NULL,
	[CostTypeName] [NVARCHAR](50) NULL,
	[Acccode2] [BIGINT] NULL,
	[AccName2] [NVARCHAR](250) NULL,
	[CaseID] [BIGINT] NULL,
	[CaseName] [NVARCHAR](50) NULL,
	[BeneficiaryCode] [NVARCHAR](50) NULL,
	[Beneficiary] [NVARCHAR](50) NULL,
	[aDate] [DATE] NULL
)
GO


