 

 
ALTER   FUNCTION [dbo].[Item_Balance_AvG_Purshase]
    (
      @Itemid BIGINT ,
      @Storeid BIGINT ,
      @ActionDate DATE ,
      @year INT = 0   
    )
RETURNS @RESUIT TABLE
    (
      serial [INT] IDENTITY(1, 1)
                   NOT NULL ,
      item_Code BIGINT ,
      ActionDate DATE ,
      QCome FLOAT ,
      Average_Price FLOAT ,
      AllPriceCome FLOAT
    )
AS
    BEGIN
	 
        DECLARE @Qout AS FLOAT 
         
        DECLARE @Start_Date AS DATE  
        DECLARE @x AS INT = 0

 

        INSERT  INTO @RESUIT
                ( item_Code ,
                  ActionDate ,
                  QCome ,
                  Average_Price ,
                  AllPriceCome
                )
                SELECT  Item_Id , -- item_Code - bigint
                        ActionDate , -- ActionDate - date
                        QCome , -- QCome  
                        0 , -- Average_Price
                        AllPriceCome -- AllPriceCome
                FROM    Item_Card
                WHERE   Item_Id = @Itemid
                        AND store_id = @Storeid
                        AND Year = @year
                        AND QCome > 0
                        AND ActionDate <= @ActionDate
                ORDER BY ActionDate
                        
     


        SELECT  @Qout = SUM(Qout)
        FROM    dbo.Item_Card
        WHERE   Item_Id = @Itemid
                AND store_id = @Storeid
                AND Year = @year
                AND ActionDate <= @ActionDate
                

        
        SET @x = 0
		 

        WHILE ( @Qout > 0 )
            BEGIN  
                SET @x = @x + 1
                SET @Qout = @Qout - ( SELECT    QCome
                                      FROM      @RESUIT
                                      WHERE     serial = @x
                                    )

                SET @Start_Date = ( SELECT  ActionDate
                                    FROM    @RESUIT
                                    WHERE   serial = @x
                                  )
               
 

            END


			 

        UPDATE  @RESUIT
        SET     Average_Price = 0



        UPDATE  @RESUIT
        SET     Average_Price = ( SELECT    SUM(AllPriceCome)
                                  FROM      @RESUIT
                                  WHERE     ActionDate >= @Start_Date
                                ) / ( SELECT    SUM(QCome)
                                      FROM      @RESUIT
                                      WHERE     ActionDate >= @Start_Date
                                    )   

        IF (SELECT TOP 1 Average_Price FROM @RESUIT ) > 0
            BEGIN

                RETURN  

            END

 
  
        UPDATE  @RESUIT
        SET     Average_Price = ISNULL(( SELECT TOP 1
                                                PriceOne
                                         FROM   dbo.invcomeitemNoTax
                                                INNER JOIN dbo.invcomeNoTax ON invcomeNoTax.InvoiceNo = invcomeitemNoTax.InvoiceNo
                                         WHERE  itemid = @Itemid
                                                AND iyeer = @year
                                                AND store_id = @Storeid
                                         ORDER BY idate DESC
                                       ), 0);
            
 


           
        RETURN






    END
 