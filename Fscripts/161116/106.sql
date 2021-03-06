
 
ALTER PROCEDURE [dbo].[YearlySales]
    @year INT ,
    @IsQuntity INT ,
    @GroupID BIGINT ,
    @SupGroupID BIGINT ,
    @ItemID BIGINT ,
    @FromStore BIGINT ,
    @ToStore BIGINT
AS
    BEGIN
	

        CREATE TABLE #Result
            (
              Item_Id BIGINT ,
              Item_Name NVARCHAR(MAX) ,
              Group_Name NVARCHAR(250) ,
              Groups_Sub NVARCHAR(250) ,
              January FLOAT ,
              Febraury FLOAT ,
              March FLOAT ,
              April FLOAT ,
              May FLOAT ,
              June FLOAT ,
              July FLOAT ,
              August FLOAT ,
              September FLOAT ,
              October FLOAT ,
              November FLOAT ,
              December FLOAT ,
              Total FLOAT
            );





			       INSERT  INTO #Result
                        ( Item_Id ,
                          Item_Name ,
                          Group_Name ,
                          Groups_Sub ,
                          January ,
                          Febraury ,
                          March ,
                          April ,
                          May ,
                          June ,
                          July ,
                          August ,
                          September ,
                          October ,
                          November ,
                          December ,
                          Total
	                    )
                        SELECT  Item_Id , -- Item_Id - bigint
                                Items.Item_Name , -- Item_Name - nvarchar(max)
                                Groups.groupname , -- Group_Name - nvarchar(250)
                                Groups_Sub.subname , -- Groups_Sub - nvarchar(250)
                                0.0 , -- January - float
                                0.0 , -- Febraury - float
                                0.0 , -- March - float
                                0.0 , -- April - float
                                0.0 , -- May - float
                                0.0 , -- June - float
                                0.0 , -- July - float
                                0.0 , -- August - float
                                0.0 , -- September - float
                                0.0 , -- October - float
                                0.0 , -- November - float
                                0.0 , -- December - float
                                0.0  -- Total - float
                        FROM    dbo.Items
                                INNER JOIN Groups ON Items.Item_Gro_Id = Groups.groupid
                                INNER JOIN Groups_Sub ON Items.Item_Gro_Sub_Id = Groups_Sub.subid
                        WHERE   ( @GroupID = 0
                                  OR Item_Gro_Id = @GroupID
                                )
                                AND ( @SupGroupID = 0
                                      OR Item_Gro_Sub_Id = @SupGroupID
                                    )
                                AND ( @ItemID = 0
                                      OR Item_Id = @ItemID
                                    )
                        ORDER BY Item_Id; 


        IF @IsQuntity = 1
            BEGIN


         


                UPDATE  #Result
                SET     January = ( SELECT  SUM(Qout)
                                    FROM    Item_Card
                                    WHERE   DATEPART(MONTH, ActionDate) = 1
                                            AND Item_Id = #Result.Item_Id
                                            AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                  );



                UPDATE  #Result
                SET     Febraury = ( SELECT SUM(Qout)
                                     FROM   Item_Card
                                     WHERE  DATEPART(MONTH, ActionDate) = 2
                                            AND Item_Id = #Result.Item_Id
											AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                   );



                UPDATE  #Result
                SET     March = ( SELECT    SUM(Qout)
                                  FROM      Item_Card
                                  WHERE     DATEPART(MONTH, ActionDate) = 3
                                            AND Item_Id = #Result.Item_Id
											AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                );





                UPDATE  #Result
                SET     April = ( SELECT    SUM(Qout)
                                  FROM      Item_Card
                                  WHERE     DATEPART(MONTH, ActionDate) = 4
                                            AND Item_Id = #Result.Item_Id
											AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                );





                UPDATE  #Result
                SET     May = ( SELECT  SUM(Qout)
                                FROM    Item_Card
                                WHERE   DATEPART(MONTH, ActionDate) = 5
                                        AND Item_Id = #Result.Item_Id
										AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                              );



                UPDATE  #Result
                SET     June = ( SELECT SUM(Qout)
                                 FROM   Item_Card
                                 WHERE  DATEPART(MONTH, ActionDate) = 6
                                        AND Item_Id = #Result.Item_Id
										AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                               );




                UPDATE  #Result
                SET     July = ( SELECT SUM(Qout)
                                 FROM   Item_Card
                                 WHERE  DATEPART(MONTH, ActionDate) = 7
                                        AND Item_Id = #Result.Item_Id
										AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                               );




                UPDATE  #Result
                SET     August = ( SELECT   SUM(Qout)
                                   FROM     Item_Card
                                   WHERE    DATEPART(MONTH, ActionDate) = 8
                                            AND Item_Id = #Result.Item_Id
											AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                 );




                UPDATE  #Result
                SET     September = ( SELECT    SUM(Qout)
                                      FROM      Item_Card
                                      WHERE     DATEPART(MONTH, ActionDate) = 9
                                                AND Item_Id = #Result.Item_Id
												AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                    );




                UPDATE  #Result
                SET     October = ( SELECT  SUM(Qout)
                                    FROM    Item_Card
                                    WHERE   DATEPART(MONTH, ActionDate) = 10
                                            AND Item_Id = #Result.Item_Id
											AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                  );





                UPDATE  #Result
                SET     November = ( SELECT SUM(Qout)
                                     FROM   Item_Card
                                     WHERE  DATEPART(MONTH, ActionDate) = 11
                                            AND Item_Id = #Result.Item_Id
											AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                   );



                UPDATE  #Result
                SET     December = ( SELECT SUM(Qout)
                                     FROM   Item_Card
                                     WHERE  DATEPART(MONTH, ActionDate) = 12
                                            AND Item_Id = #Result.Item_Id
											AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                   );





             
            END;



        IF @IsQuntity = 0
            BEGIN

			 

              UPDATE  #Result
                SET     January = ( SELECT  SUM(AllPriceOut)
                                    FROM    Item_Card
                                    WHERE   DATEPART(MONTH, ActionDate) = 1
                                            AND Item_Id = #Result.Item_Id
                                            AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                  );



                UPDATE  #Result
                SET     Febraury = ( SELECT SUM(AllPriceOut)
                                     FROM   Item_Card
                                     WHERE  DATEPART(MONTH, ActionDate) = 2
                                            AND Item_Id = #Result.Item_Id
											AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                   );



                UPDATE  #Result
                SET     March = ( SELECT    SUM(AllPriceOut)
                                  FROM      Item_Card
                                  WHERE     DATEPART(MONTH, ActionDate) = 3
                                            AND Item_Id = #Result.Item_Id
											AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                );





                UPDATE  #Result
                SET     April = ( SELECT    SUM(AllPriceOut)
                                  FROM      Item_Card
                                  WHERE     DATEPART(MONTH, ActionDate) = 4
                                            AND Item_Id = #Result.Item_Id
											AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                );





                UPDATE  #Result
                SET     May = ( SELECT  SUM(AllPriceOut)
                                FROM    Item_Card
                                WHERE   DATEPART(MONTH, ActionDate) = 5
                                        AND Item_Id = #Result.Item_Id
										AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                              );



                UPDATE  #Result
                SET     June = ( SELECT SUM(AllPriceOut)
                                 FROM   Item_Card
                                 WHERE  DATEPART(MONTH, ActionDate) = 6
                                        AND Item_Id = #Result.Item_Id
										AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                               );




                UPDATE  #Result
                SET     July = ( SELECT SUM(AllPriceOut)
                                 FROM   Item_Card
                                 WHERE  DATEPART(MONTH, ActionDate) = 7
                                        AND Item_Id = #Result.Item_Id
										AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                               );




                UPDATE  #Result
                SET     August = ( SELECT   SUM(AllPriceOut)
                                   FROM     Item_Card
                                   WHERE    DATEPART(MONTH, ActionDate) = 8
                                            AND Item_Id = #Result.Item_Id
											AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                 );




                UPDATE  #Result
                SET     September = ( SELECT    SUM(AllPriceOut)
                                      FROM      Item_Card
                                      WHERE     DATEPART(MONTH, ActionDate) = 9
                                                AND Item_Id = #Result.Item_Id
												AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                    );




                UPDATE  #Result
                SET     October = ( SELECT  SUM(AllPriceOut)
                                    FROM    Item_Card
                                    WHERE   DATEPART(MONTH, ActionDate) = 10
                                            AND Item_Id = #Result.Item_Id
											AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                  );





                UPDATE  #Result
                SET     November = ( SELECT SUM(AllPriceOut)
                                     FROM   Item_Card
                                     WHERE  DATEPART(MONTH, ActionDate) = 11
                                            AND Item_Id = #Result.Item_Id
											AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                   );



                UPDATE  #Result
                SET     December = ( SELECT SUM(AllPriceOut)
                                     FROM   Item_Card
                                     WHERE  DATEPART(MONTH, ActionDate) = 12
                                            AND Item_Id = #Result.Item_Id
											AND ( @FromStore = 0
                                                  OR store_id >= @FromStore
                                                )
                                            AND ( @ToStore = 0
                                                  OR store_id <= @ToStore
                                                )
                                   );




 
              
            END;


        UPDATE  #Result
        SET     Total = ISNULL(January, 0) + ISNULL(Febraury, 0)
                + ISNULL(March, 0) + ISNULL(April, 0) + ISNULL(May, 0)
                + ISNULL(June, 0) + ISNULL(July, 0) + ISNULL(August, 0)
                + ISNULL(September, 0) + ISNULL(October, 0) + ISNULL(November,
                                                              0)
                + ISNULL(December, 0); 

        SELECT  *
        FROM    #Result; 



    END;
