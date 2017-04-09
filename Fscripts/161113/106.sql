 
CREATE PROCEDURE YearlySales
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



        IF @IsQuntity = 1
            BEGIN


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
                        SELECT  Item_Card_1.Item_Id , -- Item_Id - bigint
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
                        FROM    Item_Card AS Item_Card_1
                                INNER JOIN Items ON Item_Card_1.Item_Id = Items.Item_Id
                                INNER JOIN Groups ON Items.Item_Gro_Id = Groups.groupid
                                INNER JOIN Groups_Sub ON Items.Item_Gro_Sub_Id = Groups_Sub.subid
                        WHERE   ( @GroupID = 0
                                  OR Item_Gro_Id = @GroupID
                                )
                                AND ( @SupGroupID = 0
                                      OR Item_Gro_Sub_Id = @SupGroupID
                                    )
                                AND ( @ItemID = 0
                                      OR Item_Card_1.Item_Id = @ItemID
                                    )
                                AND ( Item_Card_1.store_id BETWEEN @FromStore
                                                           AND
                                                              @ToStore );


                UPDATE  #Result
                SET     January = ( SELECT  SUM(Qout)
                                    FROM    Item_Card
                                    WHERE   ActionDate BETWEEN '' + @year
                                                              + '''-01-01'
                                                       AND    '' + @year
                                                              + '''-01-31'
                                            AND Item_Id = #Result.Item_Id
                                  );



                UPDATE  #Result
                SET     Febraury = ( SELECT SUM(Qout)
                                     FROM   Item_Card
                                     WHERE  ActionDate BETWEEN '' + @year
                                                              + '''-02-01'
                                                       AND    '' + @year
                                                              + '''-02-28'
                                            AND Item_Id = #Result.Item_Id
                                   );



                UPDATE  #Result
                SET     March = ( SELECT    SUM(Qout)
                                  FROM      Item_Card
                                  WHERE     ActionDate BETWEEN '' + @year
                                                              + '''-03-01'
                                                       AND    '' + @year
                                                              + '''-03-31'
                                            AND Item_Id = #Result.Item_Id
                                );





                UPDATE  #Result
                SET     April = ( SELECT    SUM(Qout)
                                  FROM      Item_Card
                                  WHERE     ActionDate BETWEEN '' + @year
                                                              + '''-04-01'
                                                       AND    '' + @year
                                                              + '''-04-30'
                                            AND Item_Id = #Result.Item_Id
                                );





                UPDATE  #Result
                SET     May = ( SELECT  SUM(Qout)
                                FROM    Item_Card
                                WHERE   ActionDate BETWEEN '' + @year
                                                           + '''-05-01'
                                                   AND     '' + @year
                                                           + '''-05-31'
                                        AND Item_Id = #Result.Item_Id
                              );



                UPDATE  #Result
                SET     June = ( SELECT SUM(Qout)
                                 FROM   Item_Card
                                 WHERE  ActionDate BETWEEN '' + @year
                                                           + '''-06-01'
                                                   AND     '' + @year
                                                           + '''-06-30'
                                        AND Item_Id = #Result.Item_Id
                               );




                UPDATE  #Result
                SET     July = ( SELECT SUM(Qout)
                                 FROM   Item_Card
                                 WHERE  ActionDate BETWEEN '' + @year
                                                           + '''-07-01'
                                                   AND     '' + @year
                                                           + '''-07-31'
                                        AND Item_Id = #Result.Item_Id
                               );




                UPDATE  #Result
                SET     August = ( SELECT   SUM(Qout)
                                   FROM     Item_Card
                                   WHERE    ActionDate BETWEEN '' + @year
                                                              + '''-08-01'
                                                       AND    '' + @year
                                                              + '''-08-31'
                                            AND Item_Id = #Result.Item_Id
                                 );




                UPDATE  #Result
                SET     September = ( SELECT    SUM(Qout)
                                      FROM      Item_Card
                                      WHERE     ActionDate BETWEEN '' + @year
                                                              + '''-09-01'
                                                           AND
                                                              '' + @year
                                                              + '''-09-30'
                                                AND Item_Id = #Result.Item_Id
                                    );




                UPDATE  #Result
                SET     October = ( SELECT  SUM(Qout)
                                    FROM    Item_Card
                                    WHERE   ActionDate BETWEEN '' + @year
                                                              + '''-10-01'
                                                       AND    '' + @year
                                                              + '''-10-31'
                                            AND Item_Id = #Result.Item_Id
                                  );





                UPDATE  #Result
                SET     November = ( SELECT SUM(Qout)
                                     FROM   Item_Card
                                     WHERE  ActionDate BETWEEN '' + @year
                                                              + '''-11-01'
                                                       AND    '' + @year
                                                              + '''-11-30'
                                            AND Item_Id = #Result.Item_Id
                                   );



                UPDATE  #Result
                SET     December = ( SELECT SUM(Qout)
                                     FROM   Item_Card
                                     WHERE  ActionDate BETWEEN '' + @year
                                                              + '''-12-01'
                                                       AND    '' + @year
                                                              + '''-12-31'
                                            AND Item_Id = #Result.Item_Id
                                   );





                UPDATE  #Result
                SET     Total = January + Febraury + March + April + May
                        + June + July + August + September + October
                        + November + December; 
            END;



			   IF @IsQuntity = 0
            BEGIN


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
                        SELECT  Item_Card_1.Item_Id , -- Item_Id - bigint
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
                        FROM    Item_Card AS Item_Card_1
                                INNER JOIN Items ON Item_Card_1.Item_Id = Items.Item_Id
                                INNER JOIN Groups ON Items.Item_Gro_Id = Groups.groupid
                                INNER JOIN Groups_Sub ON Items.Item_Gro_Sub_Id = Groups_Sub.subid
                        WHERE   ( @GroupID = 0
                                  OR Item_Gro_Id = @GroupID
                                )
                                AND ( @SupGroupID = 0
                                      OR Item_Gro_Sub_Id = @SupGroupID
                                    )
                                AND ( @ItemID = 0
                                      OR Item_Card_1.Item_Id = @ItemID
                                    )
                                AND ( Item_Card_1.store_id BETWEEN @FromStore
                                                           AND
                                                              @ToStore );


                UPDATE  #Result
                SET     January = ( SELECT  SUM(AllPriceOut)
                                    FROM    Item_Card
                                    WHERE   ActionDate BETWEEN '' + @year
                                                              + '''-01-01'
                                                       AND    '' + @year
                                                              + '''-01-31'
                                            AND Item_Id = #Result.Item_Id
                                  );



                UPDATE  #Result
                SET     Febraury = ( SELECT SUM(AllPriceOut)
                                     FROM   Item_Card
                                     WHERE  ActionDate BETWEEN '' + @year
                                                              + '''-02-01'
                                                       AND    '' + @year
                                                              + '''-02-28'
                                            AND Item_Id = #Result.Item_Id
                                   );



                UPDATE  #Result
                SET     March = ( SELECT    SUM(AllPriceOut)
                                  FROM      Item_Card
                                  WHERE     ActionDate BETWEEN '' + @year
                                                              + '''-03-01'
                                                       AND    '' + @year
                                                              + '''-03-31'
                                            AND Item_Id = #Result.Item_Id
                                );





                UPDATE  #Result
                SET     April = ( SELECT    SUM(AllPriceOut)
                                  FROM      Item_Card
                                  WHERE     ActionDate BETWEEN '' + @year
                                                              + '''-04-01'
                                                       AND    '' + @year
                                                              + '''-04-30'
                                            AND Item_Id = #Result.Item_Id
                                );





                UPDATE  #Result
                SET     May = ( SELECT  SUM(AllPriceOut)
                                FROM    Item_Card
                                WHERE   ActionDate BETWEEN '' + @year
                                                           + '''-05-01'
                                                   AND     '' + @year
                                                           + '''-05-31'
                                        AND Item_Id = #Result.Item_Id
                              );



                UPDATE  #Result
                SET     June = ( SELECT SUM(AllPriceOut)
                                 FROM   Item_Card
                                 WHERE  ActionDate BETWEEN '' + @year
                                                           + '''-06-01'
                                                   AND     '' + @year
                                                           + '''-06-30'
                                        AND Item_Id = #Result.Item_Id
                               );




                UPDATE  #Result
                SET     July = ( SELECT SUM(AllPriceOut)
                                 FROM   Item_Card
                                 WHERE  ActionDate BETWEEN '' + @year
                                                           + '''-07-01'
                                                   AND     '' + @year
                                                           + '''-07-31'
                                        AND Item_Id = #Result.Item_Id
                               );




                UPDATE  #Result
                SET     August = ( SELECT   SUM(AllPriceOut)
                                   FROM     Item_Card
                                   WHERE    ActionDate BETWEEN '' + @year
                                                              + '''-08-01'
                                                       AND    '' + @year
                                                              + '''-08-31'
                                            AND Item_Id = #Result.Item_Id
                                 );




                UPDATE  #Result
                SET     September = ( SELECT    SUM(AllPriceOut)
                                      FROM      Item_Card
                                      WHERE     ActionDate BETWEEN '' + @year
                                                              + '''-09-01'
                                                           AND
                                                              '' + @year
                                                              + '''-09-30'
                                                AND Item_Id = #Result.Item_Id
                                    );




                UPDATE  #Result
                SET     October = ( SELECT  SUM(AllPriceOut)
                                    FROM    Item_Card
                                    WHERE   ActionDate BETWEEN '' + @year
                                                              + '''-10-01'
                                                       AND    '' + @year
                                                              + '''-10-31'
                                            AND Item_Id = #Result.Item_Id
                                  );





                UPDATE  #Result
                SET     November = ( SELECT SUM(AllPriceOut)
                                     FROM   Item_Card
                                     WHERE  ActionDate BETWEEN '' + @year
                                                              + '''-11-01'
                                                       AND    '' + @year
                                                              + '''-11-30'
                                            AND Item_Id = #Result.Item_Id
                                   );



                UPDATE  #Result
                SET     December = ( SELECT SUM(AllPriceOut)
                                     FROM   Item_Card
                                     WHERE  ActionDate BETWEEN '' + @year
                                                              + '''-12-01'
                                                       AND    '' + @year
                                                              + '''-12-31'
                                            AND Item_Id = #Result.Item_Id
                                   );





                UPDATE  #Result
                SET     Total = January + Febraury + March + April + May
                        + June + July + August + September + October
                        + November + December; 
            END;




        SELECT  *
        FROM    #Result; 



    END;
GO
