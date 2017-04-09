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
CREATE TABLE dbo.Tmp_FinalBalanceForms
	(
	ID int NOT NULL IDENTITY (1, 1),
	MezaniaID int NULL,
	GroupId int NOT NULL,
	FinalMenuID int NULL,
	Aaccount_GroupID int NULL,
	MethodID int NULL,
	MethodTitele nvarchar(50) NULL,
	Switch_to_positive int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_FinalBalanceForms SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_FinalBalanceForms OFF
GO
IF EXISTS(SELECT * FROM dbo.FinalBalanceForms)
	 EXEC('INSERT INTO dbo.Tmp_FinalBalanceForms (MezaniaID, GroupId, FinalMenuID, Aaccount_GroupID, MethodID, MethodTitele, Switch_to_positive)
		SELECT MezaniaID, GroupId, FinalMenuID, Aaccount_GroupID, MethodID, MethodTitele, Switch_to_positive FROM dbo.FinalBalanceForms WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.FinalBalanceForms
GO
EXECUTE sp_rename N'dbo.Tmp_FinalBalanceForms', N'FinalBalanceForms', 'OBJECT' 
GO
ALTER TABLE dbo.FinalBalanceForms ADD CONSTRAINT
	PK_FinalBalanceForms PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT