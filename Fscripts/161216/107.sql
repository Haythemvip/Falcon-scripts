

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_UpDate_Salary
	(
	ID bigint NOT NULL IDENTITY (1, 1),
	Emp_Code bigint NOT NULL,
	Emp_Name nvarchar(100) NULL,
	Signed bit NULL,
	emp_tamensallery bigint NULL,
	emp_sallery bigint NULL,
	emp_tamensalleryCanged bigint NULL,
	emp_Take_Bus bigint NULL,
	emp_Take_Food bigint NULL,
	HavezEntetzam bigint NULL,
	emp_Take_Home bigint NULL,
	Take_Schole bigint NULL,
	emp_Take_other bigint NULL,
	Dengers bigint NULL,
	Notes nvarchar(MAX) NULL,
	aDate date NULL,
	GM_Note nvarchar(150) NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_UpDate_Salary SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_UpDate_Salary OFF
GO
IF EXISTS(SELECT * FROM dbo.UpDate_Salary)
	 EXEC('INSERT INTO dbo.Tmp_UpDate_Salary (Emp_Code, Emp_Name, Signed, emp_tamensallery, emp_sallery, emp_tamensalleryCanged, emp_Take_Bus, emp_Take_Food, HavezEntetzam, emp_Take_Home, Take_Schole, emp_Take_other, Dengers, Notes, aDate, GM_Note)
		SELECT Emp_Code, Emp_Name, Signed, emp_tamensallery, emp_sallery, emp_tamensalleryCanged, emp_Take_Bus, emp_Take_Food, HavezEntetzam, emp_Take_Home, Take_Schole, emp_Take_other, Dengers, Notes, aDate, GM_Note FROM dbo.UpDate_Salary WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.UpDate_Salary
GO
EXECUTE sp_rename N'dbo.Tmp_UpDate_Salary', N'UpDate_Salary', 'OBJECT' 
GO
ALTER TABLE dbo.UpDate_Salary ADD CONSTRAINT
	PK_UpDate_Salary PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT

