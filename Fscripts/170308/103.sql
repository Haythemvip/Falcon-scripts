

ALTER   FUNCTION [dbo].[Item_FirstIn_FirstOut]
    (
      @Item_Id BIGINT ,
      @Store_Id BIGINT ,
      @DATE_To DATE ,
      @Filter VARCHAR(20) ,
      @Filter_Value VARCHAR(20) ,
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
                WHERE   Item_Id = @Item_Id
                        AND store_id = @Store_Id
                        AND Year = @year
                        AND QCome > 0
                        AND ActionDate <= @DATE_To 
     


        SELECT  @Qout = SUM(Qout)
        FROM    dbo.Item_Card
        WHERE   Item_Id = @Item_Id
                AND store_id = @Store_Id
                AND Year = @year
                AND ActionDate <= @DATE_To 

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
        SET     Average_Price = ( SELECT  TOP 1 PriceCome 
                                  FROM      dbo.Item_Card
                                  WHERE     Item_Id = @Item_Id 
                                            AND store_id = @Store_Id 
                                            AND Year = @year
                                            AND ActionDate = @Start_Date)
                             
                
        RETURN 

	 

    END
 