 
CREATE TABLE [dbo].[Contract_Home_Allaw](
	[ID] [BIGINT] IDENTITY(1,1) NOT NULL,
	[Emp_Code] [BIGINT] NULL,
	[Contract_Start] [DATE] NULL,
	[Count_Paid] [INT] NULL,
	[Contract_Period] [INT] NULL,
	[Paid_Value] [FLOAT] NULL,
	[due_date] [DATE] NULL,
	[Flag] [BIT] NULL
) ON [PRIMARY]

GO


