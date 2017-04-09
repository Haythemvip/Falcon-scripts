 

CREATE    FUNCTION [dbo].[Item_Balance_AvG_Purshase]
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
      Average_Price FLOAT
    )
AS
    BEGIN
	 
        DECLARE @Qout AS FLOAT 
         
        DECLARE @Start_Date AS DATE
          
        INSERT  INTO @RESUIT
                ( item_Code ,
                  ActionDate ,
                  QCome ,
                  Average_Price
                )
                SELECT  Item_Id , -- item_Code - bigint
                        ActionDate , -- ActionDate - date
                        QCome , -- QCome  
                        0
                FROM    Item_Card
                WHERE   Item_Id = @Itemid
                        AND store_id = @Storeid
                        AND Year = @year
                        AND QCome > 0
                        AND ActionDate <= @ActionDate 
     


        SELECT  @Qout = SUM(Qout)
        FROM    dbo.Item_Card
        WHERE   Item_Id = @Itemid
                AND store_id = @Storeid
                AND Year = @year
                AND ActionDate <= @ActionDate 

        DECLARE @x AS INT = 0

        WHILE ( @Qout >= 0 )
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
                                  FROM      dbo.Item_Card
                                  WHERE     Item_Id = @Itemid
                                            AND store_id = @Storeid
                                            AND Year = @year
                                            AND ActionDate >= @Start_Date
                                ) / ( SELECT    SUM(QCome)
                                      FROM      dbo.Item_Card
                                      WHERE     Item_Id = @Itemid
                                                AND store_id = @Storeid
                                                AND Year = @year
                                                AND ActionDate >= @Start_Date
                                    )  
                
                 
               
        RETURN 

 


    END
 