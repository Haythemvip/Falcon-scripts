 

CREATE TABLE [dbo].[Transfer_Emp](
	[TransferID] [BIGINT] IDENTITY(1,1) NOT NULL,
	[Emp_ID] [BIGINT] NULL,
	[Emp_Name] [NVARCHAR](100) NULL,
	[Project_From] [NVARCHAR](100) NULL,
	[Project_From_ID] [INT] NULL,
	[Project_To] [NVARCHAR](100) NULL,
	[Project_To_ID] [INT] NULL,
	[HR_Responsible] [NVARCHAR](50) NULL,
	[HR_Note] [NVARCHAR](250) NULL,
	[Request_Date] [DATE] NULL,
	[HR_Managere] [NVARCHAR](50) NULL,
	[HR_Managere_Note] [NVARCHAR](100) NULL,
	[HR_Managere_Date] [DATE] NULL,
	[Project_From_Managere] [NVARCHAR](50) NULL,
	[Project_From_Managere_Note] [NVARCHAR](100) NULL,
	[Project_From_Managere_Date] [DATE] NULL,
	[Project_To_Managere] [NVARCHAR](50) NULL,
	[Project_To_Managere_Note] [NVARCHAR](100) NULL,
	[Project_To_Managere_Date] [DATE] NULL,
 CONSTRAINT [PK_Transfer_Emp] PRIMARY KEY CLUSTERED 
(
	[TransferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


