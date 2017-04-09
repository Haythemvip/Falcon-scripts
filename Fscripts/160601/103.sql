

ALTER PROCEDURE [dbo].[PO_PayMent]
    @Date1 DATE ,
    @Date2 DATE
AS
    SELECT  PO_Payments.ID ,
            Amr_Sheraa.performa_id ,
            Amr_Sheraa.order_no ,
            PO_Payments.AmountDate ,
            Amr_Sheraa.customername ,
            Amr_Sheraa.Customer_id ,
            PO_Payments.Amount
    FROM    PO_Payments
            INNER JOIN Amr_Sheraa ON Amr_Sheraa.performa_id = PO_Payments.performa_id
    WHERE   AmountDate BETWEEN @Date1 AND @Date2 


		 
 
