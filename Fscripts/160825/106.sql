


ALTER PROCEDURE [dbo].[Acc_Mezanya]
    @Cur_ID INT ,
    @Year CHAR(4) ,
    @PastYear CHAR(4) ,
    @CmbMyznya_ID INT ,
    @DT1 DATE ,
    @DT2 DATE ,
    @DT3 DATE ,
    @DT4 DATE
AS 



DELETE  FROM AccMezanya 


INSERT  INTO AccMezanya
            SELECT  AccCode ,
                    AccName ,
                    ISNULL(Type_Name, '') AS Type_Name ,
                    ISNULL(ClassificationName, '') AS ClassificationName ,
                    ISNULL(AccountGroup_Name, '') AS AccountGroup_Name ,
                    0.00 AS 'ThisYear' ,
                    0.00 AS 'PastYear' ,
                    View_tblAccTree.ClassificationId ,
                    View_tblAccTree.ACC_Type_ID ,
                    View_tblAccTree.AccountGroup_ID,0,0 ,0,0,0
            FROM    View_tblAccTree
            WHERE   MezanyaID = @CmbMyznya_ID
                    AND View_tblAccTree.ACC_Type_ID > 0
                    AND View_tblAccTree.ClassificationId > 0
                    AND View_tblAccTree.AccountGroup_ID > 0
                    AND ISmain = 0
            ORDER BY View_tblAccTree.ClassificationId ,
                    View_tblAccTree.ACC_Type_ID ,
                    View_tblAccTree.AccountGroup_ID

 
 
 
    UPDATE  AccMezanya
    SET     [ThisYear] = ISNULL(( SELECT    SUM(Maden)
                                  FROM      View_Mezn
                                  WHERE     View_Mezn.AccID = AccMezanya.AccCode
                                            AND aDate BETWEEN @DT1 AND @DT2
                                ), 0)
            - ISNULL(( SELECT   SUM(Daen)
                       FROM     View_Mezn
                       WHERE    View_Mezn.AccID = AccMezanya.AccCode
                                AND aDate BETWEEN @DT1 AND @DT2
                     ), 0)
 

    UPDATE  AccMezanya
    SET     [PastYear] = ISNULL(( SELECT    SUM(Maden)
                                  FROM      View_Mezn
                                  WHERE     View_Mezn.AccID = AccMezanya.AccCode
                                            AND aDate BETWEEN @DT3 AND @DT4
                                ), 0)
            - ISNULL(( SELECT   SUM(Daen)
                       FROM     View_Mezn
                       WHERE    View_Mezn.AccID = AccMezanya.AccCode
                                AND aDate BETWEEN @DT3 AND @DT4
                     ), 0)



	        
    

	 
    DELETE  FROM BalanceSheet 

	INSERT INTO dbo.BalanceSheet 
	        ( Net_fixed_assets ,
	          Net_fixed_assets2 ,
	          Investments_Sister_Companies ,
	          Investments_Sister_Companies2 ,
	          Projects_under_implementation ,
	          Projects_under_implementation2 ,
	          OthrAssets ,
	          OthrAssets2 ,
	          Total_Fixed_Assets ,
	          Total_Fixed_Assets2 ,
	          Cash ,
	          Cash2 ,
	          Customers ,
	          Customers2 ,
	          advance_payments ,
	          advance_payments2 ,
	          Notes_Receivable ,
	          Notes_Receivable2 ,
	          Stores ,
	          Stores2 ,
	          Total_Assets ,
	          Total_Assets2 ,
	          Supplires ,
	          Supplires2 ,
	          Bankque ,
	          Bankque2 ,
	          Short_Loan ,
	          Short_Loan2 ,
	          Annual_due ,
	          Annual_due2 ,
	          Other_Credit ,
	          Other_Credit2 ,
	          Allocations ,
	          Allocations2 ,
	          Total_Obligations ,
	          Total_Obligations2 ,
	          Working_Capital ,
	          Working_Capital2 ,
	          Total_Investment ,
	          Total_Investment2 ,
	          Payed_Capital ,
	          Payed_Capital2 ,
	          Reserves ,
	          Reserves2 ,
	          Profit_Or_loss_Past ,
	          Profit_Or_loss_Past2 ,
	          Profit_Or_loss ,
	          Profit_Or_loss2 ,
	          Total_Equity ,
	          Total_Equity2 ,
	          Long_obligations ,
	          Long_obligations2 ,
	          Long_Loan ,
	          Long_Loan2 ,
	          Sister_Loan ,
	          Sister_Loan2 ,
	          Other_Obligations ,
	          Other_Obligations2 ,
	          Total_Equity_Obligations ,
	          Total_Equity_Obligations2
	        )
	VALUES  ( 0.0 , -- Net_fixed_assets - float
	          0.0 , -- Net_fixed_assets2 - float
	          0.0 , -- Investments_Sister_Companies - float
	          0.0 , -- Investments_Sister_Companies2 - float
	          0.0 , -- Projects_under_implementation - float
	          0.0 , -- Projects_under_implementation2 - float
	          0.0 , -- OthrAssets - float
	          0.0 , -- OthrAssets2 - float
	          0.0 , -- Total_Fixed_Assets - float
	          0.0 , -- Total_Fixed_Assets2 - float
	          0.0 , -- Cash - float
	          0.0 , -- Cash2 - float
	          0.0 , -- Customers - float
	          0.0 , -- Customers2 - float
	          0.0 , -- advance_payments - float
	          0.0 , -- advance_payments2 - float
	          0.0 , -- Notes_Receivable - float
	          0.0 , -- Notes_Receivable2 - float
	          0.0 , -- Stores - float
	          0.0 , -- Stores2 - float
	          0.0 , -- Total_Assets - float
	          0.0 , -- Total_Assets2 - float
	          0.0 , -- Supplires - float
	          0.0 , -- Supplires2 - float
	          0.0 , -- Bankque - float
	          0.0 , -- Bankque2 - float
	          0.0 , -- Short_Loan - float
	          0.0 , -- Short_Loan2 - float
	          0.0 , -- Annual_due - float
	          0.0 , -- Annual_due2 - float
	          0.0 , -- Other_Credit - float
	          0.0 , -- Other_Credit2 - float
	          0.0 , -- Allocations - float
	          0.0 , -- Allocations2 - float
	          0.0 , -- Total_Obligations - float
	          0.0 , -- Total_Obligations2 - float
	          0.0 , -- Working_Capital - float
	          0.0 , -- Working_Capital2 - float
	          0.0 , -- Total_Investment - float
	          0.0 , -- Total_Investment2 - float
	          0.0 , -- Payed_Capital - float
	          0.0 , -- Payed_Capital2 - float
	          0.0 , -- Reserves - float
	          0.0 , -- Reserves2 - float
	          0.0 , -- Profit_Or_loss_Past - float
	          0.0 , -- Profit_Or_loss_Past2 - float
	          0.0 , -- Profit_Or_loss - float
	          0.0 , -- Profit_Or_loss2 - float
	          0.0 , -- Total_Equity - float
	          0.0 , -- Total_Equity2 - float
	          0.0 , -- Long_obligations - float
	          0.0 , -- Long_obligations2 - float
	          0.0 , -- Long_Loan - float
	          0.0 , -- Long_Loan2 - float
	          0.0 , -- Sister_Loan - float
	          0.0 , -- Sister_Loan2 - float
	          0.0 , -- Other_Obligations - float
	          0.0 , -- Other_Obligations2 - float
	          0.0 , -- Total_Equity_Obligations - float
	          0.0  -- Total_Equity_Obligations2 - float
	        )

--Net_fixed_assets
UPDATE  BalanceSheet
    SET     Net_fixed_assets = ( ISNULL(( SELECT    SUM(Maden)
                                          FROM      View_Mezn
                                          WHERE     View_Mezn.AccountGroup_ID = 1
                                                    AND aDate BETWEEN @DT1 AND @DT2
                                        ), 0)
                                 - ISNULL(( SELECT  SUM(Daen)
                                            FROM    View_Mezn
                                            WHERE   View_Mezn.AccountGroup_ID = 1
                                                    AND aDate BETWEEN @DT1 AND @DT2
                                          ), 0) )



UPDATE  BalanceSheet
    SET     Net_fixed_assets2 = ( ISNULL(( SELECT    SUM(Maden)
                                          FROM      View_Mezn
                                          WHERE     View_Mezn.AccountGroup_ID = 1
                                                    AND aDate BETWEEN @DT2 AND @DT4
                                        ), 0)
                                 - ISNULL(( SELECT  SUM(Daen)
                                            FROM    View_Mezn
                                            WHERE   View_Mezn.AccountGroup_ID = 1
                                                    AND aDate BETWEEN @DT2 AND @DT4
                                          ), 0) )



--===========================================================================================


UPDATE  BalanceSheet
    SET     Investments_Sister_Companies = ( ISNULL(( SELECT    SUM(Maden)
                                          FROM      View_Mezn
                                          WHERE     View_Mezn.AccountGroup_ID = 2
                                                    AND aDate BETWEEN @DT1 AND @DT2
                                        ), 0)
                                 - ISNULL(( SELECT  SUM(Daen)
                                            FROM    View_Mezn
                                            WHERE   View_Mezn.AccountGroup_ID = 2
                                                    AND aDate BETWEEN @DT1 AND @DT2
                                          ), 0) )



UPDATE  BalanceSheet
    SET     Investments_Sister_Companies2 = ( ISNULL(( SELECT    SUM(Maden)
                                          FROM      View_Mezn
                                          WHERE     View_Mezn.AccountGroup_ID = 2
                                                    AND aDate BETWEEN @DT2 AND @DT4
                                        ), 0)
                                 - ISNULL(( SELECT  SUM(Daen)
                                            FROM    View_Mezn
                                            WHERE   View_Mezn.AccountGroup_ID = 2
                                                    AND aDate BETWEEN @DT2 AND @DT4
                                          ), 0) )





    SELECT  *
    FROM    AccMezanya
  
    ORDER BY AccMezanya.ClassificationId ,
            AccMezanya.ACC_Type_ID ,
            AccMezanya.AccountGroup_ID
