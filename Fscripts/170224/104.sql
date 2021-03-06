 
CREATE  PROCEDURE GetImeCard
    @Date1 DATE ,
    @Date2 DATE ,
    @Item_Id BIGINT ,
    @StoreID INT = 0 ,
    @Year INT
AS
    BEGIN


        CREATE TABLE #Result
            (
              ItemID BIGINT ,
              VenderOrCustomer NVARCHAR(MAX) ,
              ActionDate DATE ,
              EznNO BIGINT ,
              InvNO BIGINT ,
              store_name NVARCHAR(250) ,
              QCome FLOAT ,
              Qout FLOAT ,
              Rassed FLOAT ,
              ActionName NVARCHAR(100) ,
              MoveType NVARCHAR(100) ,
              groupname NVARCHAR(100) ,
              subname NVARCHAR(100) ,
              fraseed FLOAT ,
              Unit NVARCHAR(50) ,
              UnitMedum NVARCHAR(50) ,
              RateUnitmedum FLOAT ,
              ValUnitMedum FLOAT ,
              UnitSmall NVARCHAR(50) ,
              RateUnitSmall FLOAT ,
              ValUnitSmall FLOAT ,
              unitmedcode INT ,
              unitsmallcode INT
			  ,Balancemid FLOAT ,
			  BalanceSmall FLOAT   
            );



        INSERT  INTO #Result
                ( ItemID ,
                  VenderOrCustomer ,
                  ActionDate ,
                  EznNO ,
                  InvNO ,
                  store_name ,
                  QCome ,
                  Qout ,
                  Rassed ,
                  ActionName ,
                  MoveType ,
                  groupname ,
                  subname ,
                  fraseed ,
                  Unit ,
                  UnitMedum ,
                  RateUnitmedum ,
                  ValUnitMedum ,
                  UnitSmall ,
                  RateUnitSmall ,
                  ValUnitSmall ,
                  unitmedcode ,
                  unitsmallcode ,
				  Balancemid ,
				  BalanceSmall  
		        )
                SELECT  Item_Id ,
                        VenderOrCustomer ,
                        ActionDate ,
                        EznNO ,
                        InvNO ,
                        store_name ,
                        QCome ,
                        Qout ,
                        0.00 AS Rassed ,
                        ActionName ,
                        MoveType ,
                        groupname ,
                        subname ,
                        0 AS fraseed ,
                        unitname ,
                        UnitMedum ,
                        EqulUnit AS RateUnitmedum ,
                        0 AS ValUnitMedum ,
                        UnitSmall ,
                        EqulUnit2 AS RateUnitSmall ,
                        0 AS ValUnitSmall ,
                        Item_unit2 ,
                        Item_unit3,
						0,0
                FROM    V_Item_Card
                WHERE   ActionDate BETWEEN @Date1 AND @Date2
                        AND Item_Id = @Item_Id
                        AND ( @StoreID = 0
                              OR store_id = @StoreID
                            )
                        AND Year = @Year
                ORDER BY ActionDate;
    END;

    UPDATE  #Result
    SET     fraseed = ( SELECT  ISNULL(SUM(QCome) - SUM(Qout), 0.0000) AS fraseed
                        FROM    Item_Card
                        WHERE   Year = @Year
                                AND store_id = @StoreID
                                AND Item_Id = #Result.ItemID
                                AND ActionDate < @Date1
                      );

    BEGIN TRY

        UPDATE  #Result
        SET     ValUnitMedum = ( QCome + Qout ) * RateUnitmedum;

    END TRY

    BEGIN CATCH

    END CATCH;

    BEGIN TRY 

        UPDATE  #Result
        SET     ValUnitSmall = ( QCome + Qout ) * RateUnitSmall;

    END TRY

    BEGIN CATCH

    END CATCH


	



	



    SELECT  *
    FROM    #Result; 