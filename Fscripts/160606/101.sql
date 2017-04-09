 
CREATE TABLE [dbo].[Emp_Requests](
	[ID] [BIGINT] IDENTITY(1,1) NOT NULL,
	[Emp_ID] [BIGINT] NULL,
	[Request_Type] [NVARCHAR](50) NULL,
	[HR_Note] [NVARCHAR](MAX) NULL,
	[Users] [NVARCHAR](50) NULL,
	[Request_Date] [DATETIME] NULL,
	[VacDateFrom] [DATE] NULL,
	[VacDateTo] [DATE] NULL,
	[Loan_Value] [FLOAT] NULL,
	[HR_Signature] [BIT] NULL,
	[HR_Sign_Note] [NVARCHAR](250) NULL,
	[HR_Sign_Date] [DATETIME] NULL,
	[GM_Signature] [BIT] NULL,
	[GM_Sign_Note] [NVARCHAR](250) NULL,
	[GM_Sign_Date] [DATETIME] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


