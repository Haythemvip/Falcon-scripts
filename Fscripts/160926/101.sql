 

ALTER PROCEDURE [dbo].[PO_PayMent]
    @Date1 DATE ,
    @Date2 DATE
AS
    CREATE TABLE #Result
        (
          ID BIGINT ,
          performa_id BIGINT ,
          order_no BIGINT ,
          AmountDate DATE ,
          customername NVARCHAR(150) ,
          Customer_id BIGINT ,
          Amount FLOAT ,
          PO_NO NVARCHAR(50) ,
          Paid FLOAT ,
          Due FLOAT ,
          AmountState NVARCHAR(250) ,
          PayMent_Notes NVARCHAR(250) ,
          TheName NVARCHAR(150)
        );




    INSERT  INTO #Result
            ( ID ,
              performa_id ,
              order_no ,
              AmountDate ,
              customername ,
              Customer_id ,
              Amount ,
              PO_NO ,
              Paid ,
              Due ,
              AmountState ,
              PayMent_Notes ,
              TheName
		    )
            SELECT  PO_Payments.ID ,
                    Amr_Sheraa.performa_id ,
                    Amr_Sheraa.order_no ,
                    PO_Payments.AmountDate ,
                    Amr_Sheraa.customername ,
                    Amr_Sheraa.Customer_id ,
                    PO_Payments.Amount ,
                    Amr_Sheraa.PO_NO ,
                    0 AS Paid ,
                    0 AS Due ,
                    PO_Payments.AmountState ,
                    PO_Payments.PayMent_Notes ,
                    Tenders_Add.TheName
            FROM    PO_Payments
                    INNER JOIN Amr_Sheraa ON Amr_Sheraa.performa_id = PO_Payments.performa_id
                    INNER JOIN Tenders_Add ON Amr_Sheraa.ProjectID = Tenders_Add.ID
            WHERE   AmountDate BETWEEN @Date1 AND @Date2;  




    UPDATE  #Result
    SET     Paid = ( SELECT ISNULL(SUM(Value), 0)
                     FROM   Po_Pyment_Journal
                     WHERE  #Result.ID = Po_Pyment_Journal.PO_Payments_ID
                            AND #Result.performa_id = Po_Pyment_Journal.PO_NO
                   ) 



    UPDATE  #Result
    SET     Due = Amount - Paid;




    SELECT  *
    FROM    #Result;





		 
 
