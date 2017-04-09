 
CREATE TABLE [dbo].[UpDate_Salary](
	[Emp_Code] [BIGINT] NOT NULL,
	[Emp_Name] [NVARCHAR](100) NULL,
	[Signed] [BIT] NULL,
	[emp_tamensallery] [BIGINT] NULL,
	[emp_sallery] [BIGINT] NULL,
	[emp_tamensalleryCanged] [BIGINT] NULL,
	[emp_Take_Bus] [BIGINT] NULL,
	[emp_Take_Food] [BIGINT] NULL,
	[HavezEntetzam] [BIGINT] NULL,
	[emp_Take_Home] [BIGINT] NULL,
	[Take_Schole] [BIGINT] NULL,
	[emp_Take_other] [BIGINT] NULL,
	[Dengers] [BIGINT] NULL,
	[Notes] [NVARCHAR](MAX) NULL,
	[aDate] [DATE] NULL,
	[GM_Note] [NVARCHAR](150) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


