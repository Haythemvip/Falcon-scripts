
ALTER  FUNCTION [dbo].[Item_Balance_AvG]
    (
      @Item_Id BIGINT ,
      @Store_Id BIGINT ,
      @DATE_To DATE ,
      @Filter VARCHAR(20) ,
      @Filter_Value VARCHAR(20)
    )
RETURNS @RESUIT TABLE
    (
      Item_Id BIGINT ,
      Store_Id BIGINT ,
      DATE_To DATE ,
      Exp_Date DATE ,
      Batch VARCHAR(20) ,
      Balance FLOAT ,
      Value FLOAT ,
      Average_Price FLOAT ,
      OnHand_Qty FLOAT ,
      Reserved_Qty FLOAT
    )
AS
    BEGIN
	
        DECLARE @DateFrom_D DATE
        --DECLARE @DateTo_D DATE
        DECLARE @ExpDate_D DATE
        DECLARE @Start_Date DATE
        DECLARE @Period_Id BIGINT
        DECLARE @Begin_CreditQty FLOAT
        DECLARE @Begin_creditValue FLOAT
        DECLARE @Trans_CreditQty FLOAT
        DECLARE @Trans_creditValue FLOAT
        DECLARE @Total_CreditQty FLOAT
        DECLARE @Total_CreditValue FLOAT	
        DECLARE @Debit_Qty FLOAT
        DECLARE @Debit_Value FLOAT
        DECLARE @Debit_Qty_For_Average FLOAT
        DECLARE @Debit_Value_For_Average FLOAT
        DECLARE @Reserved_Qty FLOAT
        DECLARE @Item_Balance FLOAT
        DECLARE @Item_Value FLOAT
        DECLARE @Average FLOAT
        DECLARE @OnHand_Qty FLOAT
        DECLARE @Qty_reserv FLOAT
        DECLARE @Qty_debit FLOAT
	
	
	--Now in DoubleClick balances is caculated according to date not datetime
	--i.e the time part in ignored while calculating the balance and there is assumption that
	--with in the same day Credits is done first even the time part of Debit is before Credit

	--Calculating Balance Stratigy
		--1 Calculatin Begin Credit Qty , Begin Credit Value
		
        --SELECT  @Start_Date = MAX(CONVERT(DATE, ActionDate))
        --FROM    dbo.Item_Card
        --WHERE   Item_Id = @Item_Id
        --        --AND store_id = @Store_Id
        --        --AND trans_id = 0
        --        AND CONVERT(DATE, ActionDate) <= CONVERT(DATE, @DATE_To)
			

        --IF @Start_Date IS NULL
        --    OR @Start_Date = CONVERT(DATE, '01/01/1900')
        --    BEGIN
        --        SELECT  @Start_Date = MIN(CONVERT(DATE, ActionDate))
        --        FROM    Item_Card
        --        WHERE   Item_Id = @Item_Id
        --                --AND store_id = @Store_Id
        --                AND CONVERT(DATE, ActionDate) <= CONVERT(DATE, @DATE_To)
        --    END
			
      
	
	
        --IF @Start_Date IS NULL
        --    OR @Start_Date = CONVERT(DATE, '01/01/1900')
        --    RETURN
					
        --SELECT  @Begin_CreditQty = SUM(ISNULL(QCome, 0.0000)) ,
        --        @Begin_creditValue = SUM(ISNULL(QCome, 0.0000)
        --                                 * ISNULL(PriceCome, 0.0000))
        --FROM    Item_Card
        --WHERE   Item_Id = @Item_Id
        --        --AND store_id = @Store_Id
                --AND CONVERT(DATE, ActionDate) = @Start_Date
	



	--2 Calculatin TransActions Credit Balance , TransActions Credit Value
        SELECT  @Trans_CreditQty = SUM(ISNULL(QCome, 0.0000)) ,
                @Trans_creditValue = SUM(ISNULL(QCome, 0.0000)
                                         * ISNULL(PriceCome, 0.0000))
        FROM    Item_Card
        WHERE   Item_Id = @Item_Id
                --AND store_id = @Store_Id
                --AND CONVERT(DATE, ActionDate) > @Start_Date
                AND CONVERT(DATE, ActionDate) <= CONVERT(DATE, @DATE_To)
                --AND trans_id <> 0 
			





	--3 Total Credit Balance And Value
        SET @Total_CreditQty = ISNULL(@Begin_CreditQty, 0)
            + ISNULL(@Trans_CreditQty, 0) 
        SET @Total_CreditValue = ISNULL(@Begin_creditValue, 0)
            + ISNULL(@Trans_creditValue, 0) 
		
		
		
		
			
	--4 Calcualte Debit Qty AND Debit Value
        SELECT  @Debit_Qty = SUM(ISNULL(Qout, 0.0000)) ,
                @Debit_Value = SUM(ISNULL(Qout, 0.0000) * ISNULL(PriceCome,
                                                              0.0000))
        FROM    Item_Card
        WHERE   Item_Id = @Item_Id
                --AND store_id = @Store_Id
                AND CONVERT(DATE, ActionDate) >= @Start_Date
                AND CONVERT(DATE, ActionDate) <= CONVERT(DATE, @DATE_To)
				
				

        SELECT  @Debit_Qty_For_Average = SUM(ISNULL(Qout, 0.0000)) ,
                @Debit_Value_For_Average = SUM(ISNULL(Qout, 0.0000)
                                               * ISNULL(PriceCome, 0.0000))
        FROM    Item_Card
        WHERE   Item_Id = @Item_Id
                --AND store_id = @Store_Id
                AND CONVERT(DATE, ActionDate) >= @Start_Date
                AND CONVERT(DATE, ActionDate) < CONVERT(DATE, @DATE_To)
						


	--Calculate Reserved Qty

	


        --SELECT  @Reserved_Qty = ISNULL(SUM(Remainder), 0)
        --FROM    ( SELECT    SUM(ISNULL(QCome, 0.0000))
        --          FROM      Item_Card
        --          WHERE     ( CONVERT(DATE, ActionDate) BETWEEN @Start_Date
        --                                                AND   CONVERT(DATE, @DATE_To) )
        --                    AND ( store_id = @Store_Id )
        --                    AND ( Item_Id = @Item_Id )
        --          GROUP BY  QCome
        --        ) ReservationRemainder ( Remainder )
                




        SET @OnHand_Qty = ISNULL(@Begin_CreditQty, 0)
            + ISNULL(@Trans_CreditQty, 0) - ISNULL(@Debit_Qty, 0)


        SET @Item_Balance = ISNULL(@Begin_CreditQty, 0)
            + ISNULL(@Trans_CreditQty, 0) - ISNULL(@Debit_Qty, 0)
            - ISNULL(@Reserved_Qty, 0)



        SET @Item_Value = 0
        SET @Item_Value = ( ISNULL(@Begin_creditValue, 0)
                            + ISNULL(@Trans_creditValue, 0)
                            - ISNULL(@Debit_Value, 0) )




        SET @Average = 0


        IF ( ISNULL(@Begin_CreditQty, 0) + ISNULL(@Trans_CreditQty, 0)
             - ISNULL(@Debit_Qty_For_Average, 0) ) > 0
            SET @Average = ( ISNULL(@Begin_creditValue, 0)
                             + ISNULL(@Trans_creditValue, 0)
                             - ISNULL(@Debit_Value_For_Average, 0) )
                / ( ISNULL(@Begin_CreditQty, 0) + ISNULL(@Trans_CreditQty, 0)
                    - ISNULL(@Debit_Qty_For_Average, 0) )
	


 
	
        INSERT  INTO @RESUIT
                ( Item_Id ,
                  Store_Id ,
                  DATE_To ,
                  Exp_Date ,
                  Batch ,
                  Balance ,
                  Value ,
                  Average_Price ,
                  OnHand_Qty ,
                  Reserved_Qty
                )
        VALUES  ( @Item_Id ,
                  @Store_Id ,
                  @DATE_To ,
                  NULL ,
                  NULL ,
                  ISNULL(@Item_Balance, 0) ,
                  ISNULL(@Item_Value, 0) ,
                  CASE WHEN (ISNULL(@Average, 0) < = 0)
                       THEN ( (SELECT  PriceCome
                               FROM     dbo.items
                               WHERE    Item_Id = @Item_Id
                                       )
                            )
                       ELSE ( 555 )
                  END ,
                  ISNULL(@OnHand_Qty, 0) ,
                  ISNULL(@Reserved_Qty, 0)
                )
        RETURN 
    END


