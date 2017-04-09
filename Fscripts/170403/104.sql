

CREATE TABLE [dbo].[Visa](
	[Visa_code] [bigint] NOT NULL,
	[RelaseDate] [date] NULL,
	[ExpireDate] [date] NULL,
	[VisaCount] [int] NULL,
	[SponsorID] [int] NULL,
 CONSTRAINT [PK_Visa] PRIMARY KEY CLUSTERED 
(
	[Visa_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


