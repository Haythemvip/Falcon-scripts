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
ALTER TABLE dbo.invcomeitemNoTax
	DROP CONSTRAINT FK_invcomeitemNoTax_invcomeNoTax
GO
ALTER TABLE dbo.invcomeNoTax SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_invcomeitemNoTax
	(
	Id bigint NOT NULL IDENTITY (1, 1),
	InvoiceNo bigint NOT NULL,
	serialitem bigint NOT NULL,
	itemid bigint NULL,
	ITEMS_ITEM_NAME nvarchar(200) NULL,
	unit varchar(50) NULL,
	PriceOne decimal(18, 2) NULL,
	Q decimal(18, 2) NULL,
	TotalPrice decimal(18, 2) NULL,
	SN nvarchar(MAX) NULL,
	ponas_percent float(53) NULL,
	ponsa_val float(53) NULL,
	descount_percent float(53) NULL,
	descount_val float(53) NULL,
	total_quantity float(53) NULL,
	oparateno varchar(100) NULL,
	CostId bigint NULL,
	Rate decimal(18, 2) NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_invcomeitemNoTax SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_invcomeitemNoTax OFF
GO
IF EXISTS(SELECT * FROM dbo.invcomeitemNoTax)
	 EXEC('INSERT INTO dbo.Tmp_invcomeitemNoTax (InvoiceNo, serialitem, itemid, ITEMS_ITEM_NAME, unit, PriceOne, Q, TotalPrice, SN, ponas_percent, ponsa_val, descount_percent, descount_val, total_quantity, oparateno, CostId, Rate)
		SELECT InvoiceNo, serialitem, itemid, ITEMS_ITEM_NAME, unit, PriceOne, Q, TotalPrice, SN, ponas_percent, ponsa_val, descount_percent, descount_val, total_quantity, oparateno, CostId, Rate FROM dbo.invcomeitemNoTax WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.invcomeitemNoTax
GO
EXECUTE sp_rename N'dbo.Tmp_invcomeitemNoTax', N'invcomeitemNoTax', 'OBJECT' 
GO
ALTER TABLE dbo.invcomeitemNoTax ADD CONSTRAINT
	PK_invcomeitemNoTax PRIMARY KEY CLUSTERED 
	(
	Id,
	InvoiceNo,
	serialitem
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.invcomeitemNoTax ADD CONSTRAINT
	FK_invcomeitemNoTax_invcomeNoTax FOREIGN KEY
	(
	InvoiceNo
	) REFERENCES dbo.invcomeNoTax
	(
	InvoiceNo
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
COMMIT