/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
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
ALTER TABLE dbo.Box_Moves
DROP CONSTRAINT DF_Box_Moves_Journal
GO
ALTER TABLE dbo.Box_Moves
DROP CONSTRAINT DF__Box_Moves__IsSta__2AB88D0E
GO
CREATE TABLE dbo.Tmp_Box_Moves
    (
      ID_move BIGINT NOT NULL
                     IDENTITY(1, 1) ,
      BoxID INT NULL ,
      accountcode BIGINT NULL ,
      account_name VARCHAR(100) NULL ,
      Account_info TEXT NULL ,
      aDate DATE NULL ,
      Year INT NULL ,
      Price_Elwared DECIMAL(18, 2) NULL ,
      Price_ElMonsaref DECIMAL(18, 2) NULL ,
      rased DECIMAL(18, 2) NULL ,
      ProunchID INT NULL ,
      COMP_ID INT NULL ,
      waredcust BIT NULL ,
      waredvender BIT NULL ,
      waredchart BIT NULL ,
      waredCutting BIT NULL ,
      waredcuttingto BIT NULL ,
      warecostcenter BIT NULL ,
      monsarefCast BIT NULL ,
      monsarefvender BIT NULL ,
      monsarefchart BIT NULL ,
      monsarefconstcenter BIT NULL ,
      Journal BIGINT NULL ,
      HavFromInBank BIT NULL ,
      putinbank BIT NULL ,
      EmpSolafin BIT NULL ,
      Solafemp BIT NULL ,
      MonyOnly NVARCHAR(300) NULL ,
      byan_No BIGINT NULL ,
      Invoice_No BIGINT NULL ,
      InvoiceCome_No BIGINT NULL ,
      InvoiceCome_NOTax_No BIGINT NULL ,
      Mardodat_byan BIGINT NULL ,
      Mardodat_Invoice BIGINT NULL ,
      Mardodat_InvoiceCome_Notax BIGINT NULL ,
      Mardodat_InvoiceCome BIGINT NULL ,
      CostId BIGINT NULL ,
      CurID INT NULL ,
      Flag1 INT NULL ,
      Reate_Exgange DECIMAL(18, 4) NULL ,
      DocMonsaref_No NVARCHAR(50) NULL ,
      DocEstlam_No NVARCHAR(50) NULL ,
      TaswyaID INT NULL ,
      DayName NVARCHAR(250) NULL ,
      Wared_Cust_ID INT NULL ,
      MakbodatID INT NULL ,
      MakbodatID_Bank INT NULL ,
      MasrofaaaatID_Bank INT NULL ,
      TiketNO BIGINT NULL ,
      Taswya_Mony_ID INT NULL ,
      TaswyaEmpID INT NULL ,
      contType CHAR(1) NULL ,
      QestNO INT NULL ,
      ContNO INT NULL ,
      Solfa BIT NULL ,
      IsStartedBalance BIT NULL
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Box_Moves SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_Box_Moves ADD CONSTRAINT
DF_Box_Moves_Journal DEFAULT ((0)) FOR Journal
GO
ALTER TABLE dbo.Tmp_Box_Moves ADD CONSTRAINT
DF__Box_Moves__IsSta__2AB88D0E DEFAULT ((0)) FOR IsStartedBalance
GO
SET IDENTITY_INSERT dbo.Tmp_Box_Moves ON
GO
IF EXISTS ( SELECT  *
            FROM    dbo.Box_Moves )
    EXEC('INSERT INTO dbo.Tmp_Box_Moves (ID_move, BoxID, accountcode, account_name, Account_info, aDate, Year, Price_Elwared, Price_ElMonsaref, rased, ProunchID, COMP_ID, waredcust, waredvender, waredchart, waredCutting, waredcuttingto, warecostcenter, monsarefCast, monsarefvender, monsarefchart, monsarefconstcenter, Journal, HavFromInBank, putinbank, EmpSolafin, Solafemp, MonyOnly, byan_No, Invoice_No, InvoiceCome_No, InvoiceCome_NOTax_No, Mardodat_byan, Mardodat_Invoice, Mardodat_InvoiceCome_Notax, Mardodat_InvoiceCome, CostId, CurID, Flag1, Reate_Exgange, DocMonsaref_No, DocEstlam_No, TaswyaID, DayName, Wared_Cust_ID, MakbodatID, MakbodatID_Bank, MasrofaaaatID_Bank, TiketNO, Taswya_Mony_ID, TaswyaEmpID, contType, QestNO, ContNO, Solfa, IsStartedBalance)
    SELECT ID_move, BoxID, accountcode, account_name, Account_info, aDate, Year, Price_Elwared, Price_ElMonsaref, rased, ProunchID, COMP_ID, waredcust, waredvender, waredchart, waredCutting, waredcuttingto, warecostcenter, monsarefCast, monsarefvender, monsarefchart, monsarefconstcenter, Journal, HavFromInBank, putinbank, EmpSolafin, Solafemp, MonyOnly, byan_No, Invoice_No, InvoiceCome_No, InvoiceCome_NOTax_No, Mardodat_byan, Mardodat_Invoice, Mardodat_InvoiceCome_Notax, Mardodat_InvoiceCome, CostId, CurID, Flag1, Reate_Exgange, DocMonsaref_No, DocEstlam_No, TaswyaID, DayName, Wared_Cust_ID, MakbodatID, MakbodatID_Bank, MasrofaaaatID_Bank, TiketNO, Taswya_Mony_ID, TaswyaEmpID, contType, QestNO, ContNO, Solfa, IsStartedBalance FROM dbo.Box_Moves WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Box_Moves OFF
GO
DROP TABLE dbo.Box_Moves
GO
EXECUTE sp_rename N'dbo.Tmp_Box_Moves', N'Box_Moves', 'OBJECT' 
GO
ALTER TABLE dbo.Box_Moves ADD CONSTRAINT
PK_Box_Moves PRIMARY KEY CLUSTERED 
(
ID_move
) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
