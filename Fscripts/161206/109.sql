
CREATE TABLE [dbo].[EmpCosts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpCode] [bigint] NULL,
	[CostNotes] [nvarchar](max) NULL,
	[CostName] [nvarchar](max) NULL,
	[Cost] [float] NULL,
	[CostType] [nvarchar](50) NULL,
	[Year] [int] NULL,
	[StartDate] [date] NULL,
	[State] [bit] NULL,
	[Selected] [bit] NULL,
 CONSTRAINT [PK_EmpCosts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[EmpCosts] ADD  DEFAULT ((0)) FOR [State]
GO

ALTER TABLE [dbo].[EmpCosts] ADD  DEFAULT ((0)) FOR [Selected]
GO


