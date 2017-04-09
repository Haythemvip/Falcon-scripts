 

CREATE TABLE [dbo].[Dependents](
	[ID] [BIGINT] IDENTITY(1,1) NOT NULL,
	[Emp_Code] [BIGINT] NULL,
	[Dependent] [NVARCHAR](150) NULL,
	[Kinship_ID] [INT] NULL,
	[Kinship_Name] [NVARCHAR](150) NULL,
	[No_Medical_Insurance] [NVARCHAR](50) NULL,
	[Date_Add_To_Insurance] [DATE] NULL,
	[Birth_Date] [DATE] NULL,
	[Iqama] [NVARCHAR](50) NULL,
	[Passport] [NVARCHAR](50) NULL,
[InsClass] [NVARCHAR](50) NULL,

) ON [PRIMARY]

GO


