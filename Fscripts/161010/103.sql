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
CREATE TABLE dbo.Tmp_Amr_Sheraa_Item
	(
	Id bigint NOT NULL IDENTITY (1, 1),
	performa_id bigint NULL,
	serial bigint NULL,
	item_name nvarchar(MAX) NULL,
	price float(53) NULL,
	unit varchar(50) NULL,
	quantity float(53) NULL,
	total float(53) NULL,
	ConstControl nvarchar(100) NULL,
	ConstControlStart datetime NULL,
	ConstControlStartEnd datetime NULL,
	ConstControlNOtes nvarchar(MAX) NULL,
	ProjectManeger nvarchar(100) NULL,
	ProjectManegerStart datetime NULL,
	ProjectManegerEnd datetime NULL,
	ProjectManegerNOtes nvarchar(MAX) NULL,
	ExcutiveManager nvarchar(100) NULL,
	ExcutiveManagerStart datetime NULL,
	ExcutiveManagerEnd datetime NULL,
	ExcutiveManagerNotes nvarchar(MAX) NULL,
	Accont nvarchar(100) NULL,
	AccontStart datetime NULL,
	AccontEnd datetime NULL,
	AccontNotes nvarchar(MAX) NULL,
	Gm nvarchar(100) NULL,
	GmStart datetime NULL,
	GmEnd datetime NULL,
	GmNotes nvarchar(MAX) NULL,
	BurchaseDate datetime NULL,
	TotlAccount decimal(18, 2) NULL,
	TotalExcutive decimal(18, 2) NULL,
	TotalGm decimal(18, 2) NULL,
	CostID bigint NULL,
	ItemNO_IN_Tender nvarchar(50) NULL,
	ItemCode int NULL,
	mohla int NULL,
	DateNeed nchar(10) NULL,
	ItemDiscount float(53) NULL,
	ItemNet float(53) NULL,
	Budget float(53) NULL,
	PreviousValue float(53) NULL,
	Diff float(53) NULL,
	SupID bigint NULL,
	DiscountPercent float(53) NULL,
	Last_purchase float(53) NULL,
	Stock float(53) NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Amr_Sheraa_Item SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Amr_Sheraa_Item OFF
GO
IF EXISTS(SELECT * FROM dbo.Amr_Sheraa_Item)
	 EXEC('INSERT INTO dbo.Tmp_Amr_Sheraa_Item (performa_id, serial, item_name, price, unit, quantity, total, ConstControl, ConstControlStart, ConstControlStartEnd, ConstControlNOtes, ProjectManeger, ProjectManegerStart, ProjectManegerEnd, ProjectManegerNOtes, ExcutiveManager, ExcutiveManagerStart, ExcutiveManagerEnd, ExcutiveManagerNotes, Accont, AccontStart, AccontEnd, AccontNotes, Gm, GmStart, GmEnd, GmNotes, BurchaseDate, TotlAccount, TotalExcutive, TotalGm, CostID, ItemNO_IN_Tender, ItemCode, mohla, DateNeed, ItemDiscount, ItemNet, Budget, PreviousValue, Diff, SupID, DiscountPercent, Last_purchase, Stock)
		SELECT performa_id, serial, item_name, price, unit, quantity, total, ConstControl, ConstControlStart, ConstControlStartEnd, ConstControlNOtes, ProjectManeger, ProjectManegerStart, ProjectManegerEnd, ProjectManegerNOtes, ExcutiveManager, ExcutiveManagerStart, ExcutiveManagerEnd, ExcutiveManagerNotes, Accont, AccontStart, AccontEnd, AccontNotes, Gm, GmStart, GmEnd, GmNotes, BurchaseDate, TotlAccount, TotalExcutive, TotalGm, CostID, ItemNO_IN_Tender, ItemCode, mohla, DateNeed, ItemDiscount, ItemNet, Budget, PreviousValue, Diff, SupID, DiscountPercent, Last_purchase, Stock FROM dbo.Amr_Sheraa_Item WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.Amr_Sheraa_Item
GO
EXECUTE sp_rename N'dbo.Tmp_Amr_Sheraa_Item', N'Amr_Sheraa_Item', 'OBJECT' 
GO
ALTER TABLE dbo.Amr_Sheraa_Item ADD CONSTRAINT
	PK_Amr_Sheraa_Item PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
