 
CREATE PROCEDURE Loan_materials @ID BIGINT, @CaseID INT
AS
    BEGIN
 

        CREATE TABLE #Result
            (
              InvoiceNo BIGINT ,
              Type NVARCHAR(50) ,
              itemid BIGINT ,
              Item_Name NVARCHAR(MAX) ,
              Q FLOAT ,
              Qbak FLOAT ,
              Qtotal FLOAT ,
              QDiff FLOAT ,
              Journal BIGINT ,
              ClientID BIGINT ,
              store_name NVARCHAR(50) ,
              idate DATE
            )

        IF @CaseID = 1
            BEGIN 
                INSERT  INTO #Result
                        SELECT  SarfID AS InvoiceNo ,
                                 'Emp Lon' ,
                                itemid ,
                                Item_Name ,
                                Quantity AS Q ,
                                0 AS Qbak ,
                                0 AS Qtotal ,
                                0 AS QDiff ,
                                0 AS Journal ,
                                emp_code AS ClientID ,
                                store_name ,
                                ActionDate AS idate
                        FROM    dbo.View_EznSarfOhda
                        WHERE   store_id > 0
                                AND SarfID = @ID
            END


        IF @CaseID = 2
            BEGIN 
                INSERT  INTO #Result
                        SELECT  InvoiceNo ,
                                 'Bill' ,
                                itemid ,
                                Item_Name ,
                                Q ,
                                0 AS Qbak ,
                                0 AS Qtotal ,
                                0 AS QDiff ,
                                Journal ,
                                ClientID ,
                                store_name ,
                                idate
                        FROM    dbo.vbyan
                        WHERE   store_id > 0
                                AND InvoiceNo = @ID
            END

        
        IF @CaseID = 3
            BEGIN 
                INSERT  INTO #Result
                        SELECT  SarfID AS InvoiceNo ,
                                 'Bill' ,
                                itemid ,
                                Item_Name ,
                                Quantity AS Q ,
                                0 AS Qbak ,
                                0 AS Qtotal ,
                                0 AS QDiff ,
                                Journal ,
                                Customer_id AS ClientID ,
                                store_name ,
                                ActionDate AS idate
                        FROM    dbo.VEznSarf
                        WHERE   store_id > 0
                                AND SarfID = @ID
            END





SELECT * FROM #Result 

    END
GO
