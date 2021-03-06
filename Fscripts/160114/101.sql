 

create PROCEDURE [dbo].[PO_PayMent]
    @Date1 DATE ,
    @Date2 DATE

AS
    CREATE TABLE #PO_PayMent
        (
          PO_NO NVARCHAR(50) NULL ,
          Vender_Name NVARCHAR(150) NULL ,
          Pay_Ment FLOAT NULL ,
          Action_Date DATE NULL
        )
 
 
    INSERT  INTO #PO_PayMent
            SELECT  performa_id ,
                    performa_id ,
                    Amount ,
                    AmountDate
            FROM    dbo.PO_Payments
            WHERE   AmountDate BETWEEN @Date1 AND @Date2 
		 

	 UPDATE  #PO_PayMent SET
         
	  #PO_PayMent.Vender_Name = Amr_Sheraa.customername  
	  FROM #PO_PayMent
      INNER JOIN  Amr_Sheraa ON Amr_Sheraa.performa_id = #PO_PayMent.PO_NO



	   UPDATE  #PO_PayMent SET
         
	  #PO_PayMent.PO_NO = Amr_Sheraa.PO_NO   
	  FROM #PO_PayMent
      INNER JOIN  Amr_Sheraa ON Amr_Sheraa.performa_id = #PO_PayMent.PO_NO



    SELECT  *
    FROM    #PO_PayMent
    ORDER BY PO_NO

