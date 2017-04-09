 
CREATE TYPE [dbo].[AttendanceType] AS TABLE 
(
	
[code] BIGINT NULL  ,
[Date] DATE NULL , 
[time] NVARCHAR(5) NULL , 
[InOutMode] NVARCHAR(4),
[VerifyMode] NVARCHAR(4) NULL 
	
)
GO
