 
CREATE TABLE [dbo].[Visa](
	[Visa_code] [BIGINT] NOT NULL,
	[Visa_No] [NVARCHAR](50) NULL,
	[Job_In_Visa] [NVARCHAR](100) NULL,
	[Place_To_Come] [NVARCHAR](100) NULL,
	[ID_Of_Sponsor] [NVARCHAR](50) NULL,
	[Emp_Code] [BIGINT] NULL,
	[emp_name] [NVARCHAR](100) NULL,
	[Date_Action] [DATE] NULL,
 CONSTRAINT [PK_Visa] PRIMARY KEY CLUSTERED 
(
	[Visa_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


