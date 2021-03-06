 
 
ALTER PROCEDURE [dbo].[Loan_materials] @ID BIGINT, @CaseID INT
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
              idate DATE ,
              bill BIT ,
              ezn BIT ,
              emplon BIT
            )


        IF @CaseID = 0
            BEGIN 
                INSERT  INTO #Result
                        SELECT  InvoiceNo ,
                                CASE WHEN Bill = 1 THEN 'Bill'
                                     WHEN Ezn = 1 THEN 'voucher'
                                     ELSE 'Emp Lon'
                                END ,
                                itemid ,
                                Item_Name ,
                                Q ,
                                Qbak ,
                                Qtotal ,
                                QDiff ,
                                0 AS Journal ,
                                ClientID ,
                                store_name ,
                                Fallow_Lon.ActionDate AS idate ,
                                Bill ,
                                Ezn ,
                                EmpLon
                        FROM    dbo.Fallow_Lon_Items
                                INNER JOIN dbo.Fallow_Lon ON Fallow_Lon.LonID = Fallow_Lon_Items.LonID
                                INNER JOIN dbo.Items ON Items.Item_Id = dbo.Fallow_Lon_Items.itemid
                        WHERE   Fallow_Lon.LonID = @ID 



             


                                 
            END



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
                                ActionDate AS idate ,
                                0 AS Bill ,
                                0 AS Ezn ,
                                1 AS EmpLon
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
                                idate ,
                                1 AS Bill ,
                                0 AS Ezn ,
                                0 AS EmpLon
                        FROM    dbo.vbyan
                        WHERE   store_id > 0
                                AND InvoiceNo = @ID


              


            END

        
        IF @CaseID = 3
            BEGIN 
                INSERT  INTO #Result
                        SELECT  SarfID AS InvoiceNo ,
                                'voucher' ,
                                itemid ,
                                Item_Name ,
                                Quantity AS Q ,
                                0 AS Qbak ,
                                0 AS Qtotal ,
                                0 AS QDiff ,
                                Journal ,
                                Customer_id AS ClientID ,
                                store_name ,
                                ActionDate AS idate ,
                                0 AS Bill ,
                                1 AS Ezn ,
                                0 AS EmpLon
                        FROM    dbo.VEznSarf
                        WHERE   store_id > 0
                                AND SarfID = @ID


          


            END



        IF @CaseID = 4
            BEGIN 
                INSERT  INTO #Result
                        SELECT  InvoiceNo ,
                                CASE WHEN Bill = 1 THEN 'Bill'
                                     WHEN Ezn = 1 THEN 'voucher'
                                     ELSE 'Emp Lon'
                                END ,
                                itemid ,
                                Item_Name ,
                                Q ,
                                SUM(Qbak) ,
                               SUM(Qbak) AS  Qtotal ,
                                QDiff ,
                                0 AS Journal ,
                                ClientID ,
                                store_name ,
                                Fallow_Lon.ActionDate AS idate ,
                                Bill ,
                                Ezn ,
                                EmpLon
                        FROM    dbo.Fallow_Lon_Items
                                INNER JOIN dbo.Fallow_Lon ON Fallow_Lon.LonID = Fallow_Lon_Items.LonID
                                INNER JOIN dbo.Items ON Items.Item_Id = dbo.Fallow_Lon_Items.itemid
                        WHERE   Fallow_Lon.ClientID = @ID 
						GROUP BY itemid,dbo.Items.Item_Name,Q,ClientID,store_name,Fallow_Lon.ActionDate,InvoiceNo,Bill,Ezn,EmpLon,Qtotal,QDiff


                 UPDATE  #Result
                SET     QDiff =   Q - Qbak
			

                                 
            END


        IF @CaseID >  0 AND @CaseID <> 4
            BEGIN 

                
                                         
                               

             
                UPDATE  #Result
                SET     Qtotal = CASE WHEN #Result.bill = 1
                                      THEN ( SELECT SUM(Fallow_Lon_Items.Qbak) AS Qbak 
                                                  
                                             FROM   Fallow_Lon
                                                    INNER JOIN Fallow_Lon_Items ON Fallow_Lon_Items.LonID = Fallow_Lon.LonID
													 
                                             WHERE  ( Fallow_Lon.Bill = 1 )
                                                    AND ( Fallow_Lon.InvoiceNo = @ID )
													AND (Fallow_Lon_Items.itemid = #Result.itemid)
                                             GROUP BY Fallow_Lon.InvoiceNo ,
                                                    Fallow_Lon_Items.itemid
                                           
                                           )
                                      WHEN ( #Result.ezn = 1 )
                                      THEN ( SELECT SUM(Fallow_Lon_Items.Qbak) AS Qbak 
                                             FROM   Fallow_Lon
                                                    INNER JOIN Fallow_Lon_Items ON Fallow_Lon_Items.LonID = Fallow_Lon.LonID
													 
                                             WHERE  ( Fallow_Lon.Ezn = 1 )
                                                    AND ( Fallow_Lon.InvoiceNo = @ID )
													AND (Fallow_Lon_Items.itemid = #Result.itemid)
                                             GROUP BY Fallow_Lon.InvoiceNo ,
                                                    Fallow_Lon_Items.itemid
                                            
                                           )
                                      WHEN ( #Result.emplon = 1 )
                                      THEN ( SELECT SUM(Fallow_Lon_Items.Qbak) AS Qbak 
                                             FROM   Fallow_Lon
                                                    INNER JOIN Fallow_Lon_Items ON Fallow_Lon_Items.LonID = Fallow_Lon.LonID
													 
                                             WHERE  ( Fallow_Lon.EmpLon = 1 )
                                                    AND ( Fallow_Lon.InvoiceNo = @ID )
													AND (Fallow_Lon_Items.itemid = #Result.itemid)
                                             GROUP BY Fallow_Lon.InvoiceNo ,
                                                    Fallow_Lon_Items.itemid
                                              
                                           )
                                      ELSE ( 0 )
                                 END
                                         



                UPDATE  #Result
                SET     QDiff = Q - Qtotal


            END
        

        SELECT  *
        FROM    #Result 

    END
