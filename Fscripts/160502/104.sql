

CREATE TABLE [dbo].[DaylyReport](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpCode] [bigint] NULL,
	[Action] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[ActionDate] [date] NULL,
	[CostID] [bigint] NULL,
	[ProjectID] [bigint] NULL,
	[TimeFrom] [char](5) NULL,
	[TimeTo] [char](5) NULL,
	[TotalTime] [char](5) NULL,
 CONSTRAINT [PK_DaylyReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[DaylyReport] ADD  CONSTRAINT [DF_DaylyReport_CostID]  DEFAULT ((0)) FOR [CostID]
GO

ALTER TABLE [dbo].[DaylyReport] ADD  CONSTRAINT [DF_DaylyReport_ProjectID]  DEFAULT ((0)) FOR [ProjectID]
GO


