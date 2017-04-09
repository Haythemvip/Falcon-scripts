
 
 
ALTER PROCEDURE Financial_Ratios_rates
    @Year INT ,
    @Val_1 FLOAT = 0 , 		   -- «·«’Ê· «·„ œ«Ê·…
    @Val_2 FLOAT = 0 ,		   -- 
    @Val_3 FLOAT = 0 ,		   -- 
    @Val_4 FLOAT = 0 ,		   -- 
    @Val_5 FLOAT = 0 ,		   -- 
    @Val_6 FLOAT = 0 ,		   -- 
    @Val_7 FLOAT = 0 ,		   -- 
    @Val_8 FLOAT = 0 ,		   -- 
    @Val_9 FLOAT = 0 ,		   -- 
    @Val_10 FLOAT = 0 ,		   -- 
    @Val_11 FLOAT = 0 ,		   -- 
    @Val_12 FLOAT = 0 ,		   -- 
    @Val_13 FLOAT = 0 ,		   -- 
    @Val_14 FLOAT = 0 ,		   -- 
    @Val_15 FLOAT = 0 ,		   -- 
    @Val_16 FLOAT = 0 ,		   -- 
    @Val_17 FLOAT = 0 ,		   -- 
    @Val_18 FLOAT = 0 ,		   -- 
    @Val_19 FLOAT = 0 ,		   -- 
    @Val_20 FLOAT = 0 ,
    @Val_21 FLOAT = 0 ,
    @Val_22 FLOAT = 0 ,
    @Val_23 FLOAT = 0,
	 @Val_24 FLOAT = 0

AS
    CREATE TABLE #Result
        (
          Category NVARCHAR(MAX) ,
          ItemName NVARCHAR(MAX) ,
          ItemValue FLOAT ,
          ItemPercent FLOAT ,
          Notes NVARCHAR(MAX) ,
          ID INT
        );
    BEGIN
	



	

        CREATE TABLE #Table1
            (
              Aaccount_GroupID INT ,
              MethodID INT ,
              ThisYear FLOAT ,
              ThisYearAdd FLOAT ,
              ThisYearMinus FLOAT ,
              FinalMenuID INT ,
              Switch_to_positive INT
            );




        INSERT  #Table1
                ( Aaccount_GroupID ,
                  MethodID ,
                  ThisYear ,
                  ThisYearAdd ,
                  ThisYearMinus ,
                  FinalMenuID ,
                  Switch_to_positive
	            )
                SELECT  Aaccount_GroupID , -- Aaccount_GroupID - int
                        MethodID , -- MethodID - int
                        0.00 AS 'ThisYear' ,
                        0.00 AS 'ThisYearadd' ,
                        0.00 AS 'ThisYearminus' ,
                        FinalMenuID ,
                        Switch_to_positive
                FROM    Final_Ratio_Setting;
           





		   
        UPDATE  #Table1
        SET     [ThisYearAdd] = ISNULL(( SELECT SUM(Maden)
                                         FROM   View_Mezn
                                         WHERE  View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                                AND year = @Year
                                       ), 0)
                - ISNULL(( SELECT   SUM(Daen)
                           FROM     View_Mezn
                           WHERE    View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                    AND year = @Year
                         ), 0)
        WHERE   #Table1.MethodID = 1;
 




        UPDATE  #Table1
        SET     [ThisYearMinus] = ISNULL(( SELECT   SUM(Maden)
                                           FROM     View_Mezn
                                           WHERE    View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                                    AND year = @Year
                                         ), 0)
                - ISNULL(( SELECT   SUM(Daen)
                           FROM     View_Mezn
                           WHERE    View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                    AND year = @Year
                         ), 0)
        WHERE   #Table1.MethodID = 0;



        UPDATE  #Table1
        SET     ThisYearAdd = ThisYearAdd * -1
        WHERE   Switch_to_positive = 1;


        UPDATE  #Table1
        SET     ThisYearMinus = ThisYearMinus * -1
        WHERE   Switch_to_positive = 1;




        UPDATE  #Table1
        SET     [ThisYear] = ThisYearAdd - ThisYearMinus;  
           


 


       






        SET @Val_1 = ISNULL(( SELECT    SUM(ThisYear)
                              FROM      #Table1
                              WHERE     FinalMenuID = 1
                            ), 0);

        SET @Val_2 = ISNULL(( SELECT    SUM(ThisYear)
                              FROM      #Table1
                              WHERE     FinalMenuID = 2
                            ), 0);



        SET @Val_3 = ISNULL(( SELECT    SUM(ThisYear)
                              FROM      #Table1
                              WHERE     FinalMenuID = 3
                            ), 0);



        SET @Val_4 = ISNULL(( SELECT    SUM(ThisYear)
                              FROM      #Table1
                              WHERE     FinalMenuID = 4
                            ), 0);


        SET @Val_5 = ISNULL(( SELECT    SUM(ThisYear)
                              FROM      #Table1
                              WHERE     FinalMenuID = 5
                            ), 0);


        SET @Val_6 = ISNULL(( SELECT    SUM(ThisYear)
                              FROM      #Table1
                              WHERE     FinalMenuID = 6
                            ), 0);


        SET @Val_7 = ISNULL(( SELECT    SUM(ThisYear)
                              FROM      #Table1
                              WHERE     FinalMenuID = 7
                            ), 0);


        SET @Val_8 = ISNULL(( SELECT    SUM(ThisYear)
                              FROM      #Table1
                              WHERE     FinalMenuID = 8
                            ), 0);


        SET @Val_9 = ISNULL(( SELECT    SUM(ThisYear)
                              FROM      #Table1
                              WHERE     FinalMenuID = 9
                            ), 0);


        SET @Val_10 = ISNULL(( SELECT   SUM(ThisYear)
                               FROM     #Table1
                               WHERE    FinalMenuID = 10
                             ), 0);


        SET @Val_11 = ISNULL(( SELECT   SUM(ThisYear)
                               FROM     #Table1
                               WHERE    FinalMenuID = 11
                             ), 0);


        SET @Val_12 = ISNULL(( SELECT   SUM(ThisYear)
                               FROM     #Table1
                               WHERE    FinalMenuID = 12
                             ), 0);



        SET @Val_13 = ISNULL(( SELECT   SUM(ThisYear)
                               FROM     #Table1
                               WHERE    FinalMenuID = 13
                             ), 0);




        SET @Val_14 = ISNULL(( SELECT   SUM(ThisYear)
                               FROM     #Table1
                               WHERE    FinalMenuID = 14
                             ), 0);




        SET @Val_15 = ISNULL(( SELECT   SUM(ThisYear)
                               FROM     #Table1
                               WHERE    FinalMenuID = 15
                             ), 0);





        SET @Val_16 = ISNULL(( SELECT   SUM(ThisYear)
                               FROM     #Table1
                               WHERE    FinalMenuID = 16
                             ), 0);




        SET @Val_17 = ISNULL(( SELECT   SUM(ThisYear)
                               FROM     #Table1
                               WHERE    FinalMenuID = 17
                             ), 0);



        SET @Val_18 = ISNULL(( SELECT   SUM(ThisYear)
                               FROM     #Table1
                               WHERE    FinalMenuID = 18
                             ), 0);




        SET @Val_19 = ISNULL(( SELECT   SUM(ThisYear)
                               FROM     #Table1
                               WHERE    FinalMenuID = 19
                             ), 0);



        SET @Val_20 = ISNULL(( SELECT   SUM(ThisYear)
                               FROM     #Table1
                               WHERE    FinalMenuID = 20
                             ), 0);



        SET @Val_21 = ISNULL(( SELECT   SUM(ThisYear)
                               FROM     #Table1
                               WHERE    FinalMenuID = 21
                             ), 0);






        SET @Val_22 = ISNULL(( SELECT   SUM(ThisYear)
                               FROM     #Table1
                               WHERE    FinalMenuID = 22
                             ), 0);




        SET @Val_23 = ISNULL(( SELECT   SUM(ThisYear)
                               FROM     #Table1
                               WHERE    FinalMenuID = 23
                             ), 0);



        SET @Val_24 = ISNULL(( SELECT   SUM(ThisYear)
                               FROM     #Table1
                               WHERE    FinalMenuID = 24
                             ), 0);






        INSERT  INTO #Result
                ( Category
                )
        VALUES  ( N'‰”» «·”ÌÊ·Â LIQUIDITY RATIOS'
                );
                 
                 
        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N'‰”»… «· œ«Ê· (Current Ratio)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N' «·√’Ê· «·„ œÊ«·… ˜ «·«· “«„«  «·„ œ«Ê·…' ,  -- Notes - nvarchar(max) 
                  1
                );




			 
       
	  



        UPDATE  #Result
        SET     ItemPercent = @Val_1 / CASE WHEN ( @Val_2 = 0 ) THEN ( 1 )
                                            ELSE @Val_2
                                       END
        WHERE   ID = 1; 
      












        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N'‰”»… «·”œ«œ «·”—Ì⁄ (Quick Ratio)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N'  («·√’Ê· «·„ œ«Ê·… ñ «·„Œ“Ê‰) ˜ «·«· “«„«  «·„ œ«Ê·…' ,  -- Notes - nvarchar(max) 
                  2
                );




 
        UPDATE  #Result
        SET     ItemPercent = ( ( @Val_1 ) - ( @Val_3 )
                                / CASE WHEN ( @Val_2 = 0 ) THEN ( 1 )
                                       ELSE @Val_2
                                  END )
        WHERE   ID = 2; 








        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N' ‰”»… «·‰ﬁœÌ… (Cash Ratio)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N' «·‰ﬁœÌ… Ê«·√’Ê· ‘»Â «·‰ﬁœÌ… ˜ «·«· “«„«  «·„ œ«Ê·…' ,  -- Notes - nvarchar(max) 
                  3
                );



        UPDATE  #Result
        SET     ItemPercent = ( @Val_4 / CASE WHEN ( @Val_2 = 0 ) THEN ( 1 )
                                              ELSE @Val_2
                                         END )
        WHERE   ID = 3; 




        INSERT  INTO #Result
                ( Category
                )
        VALUES  ( N'‰”» «·—»ÕÌ… PROFITABILITY RATIOS'
                );




        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N'Â«„‘ „Ã„· «·—»Õ (Gross Profit Margin)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N'„Ã„· «·—»Õ ˜ ’«›Ï «·„»Ì⁄« ' ,  -- Notes - nvarchar(max) 
                  4
                );




        UPDATE  #Result
        SET     ItemPercent = @Val_5 / CASE WHEN ( @Val_6 = 0 ) THEN ( 1 )
                                            ELSE @Val_6
                                       END
        WHERE   ID = 4; 
      




      

        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N'„⁄œ· «·⁄«∆œ ⁄·Ï «·„»Ì⁄«  (Â«„‘ ’«›Ï «·—»Õ) (Net Profit Margin)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N' ’«›Ï «·—»Õ ˜ ’«›Ï «·„»Ì⁄« ' ,  -- Notes - nvarchar(max) 
                  5
                );




				
        UPDATE  #Result
        SET     ItemPercent = @Val_7 / CASE WHEN ( @Val_6 = 0 ) THEN ( 1 )
                                            ELSE @Val_6
                                       END
        WHERE   ID = 5; 








        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N'„⁄œ· «·⁄«∆œ ⁄·Ï ÕﬁÊﬁ «·„·ﬂÌ… (Return on Equity)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N'’«›Ï «·—»Õ ˜ ÕﬁÊﬁ «·„·ﬂÌ…' ,  -- Notes - nvarchar(max) 
                  6
                );






        UPDATE  #Result
        SET     ItemPercent = @Val_7 / CASE WHEN ( @Val_20 = 0 ) THEN ( 1 )
                                            ELSE @Val_20
                                       END
        WHERE   ID = 6; 









        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N'„⁄œ· «·⁄«∆œ ⁄·Ï «·«” À„«— (Return on Investment)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N'’«›Ï «·—»Õ ˜ ≈Ã„«·Ï «·«” À„«—' ,  -- Notes - nvarchar(max) 
                  7
                );

 

 
        UPDATE  #Result
        SET     ItemPercent = @Val_7 / CASE WHEN ( @Val_8 = 0 ) THEN ( 1 )
                                            ELSE @Val_8
                                       END
        WHERE   ID = 7; 






        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N'„⁄œ· «·⁄«∆œ ⁄·Ï ≈Ã„«·Ï «·√’Ê· (Return on Total Assets)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N'’«›Ï «·—»Õ ˜ ≈Ã„«·Ï «·√’Ê·' ,  -- Notes - nvarchar(max) 
                  8
                );


				
        UPDATE  #Result
        SET     ItemPercent = @Val_7 / CASE WHEN ( @Val_11 = 0 ) THEN ( 1 )
                                            ELSE @Val_11
                                       END
        WHERE   ID = 8; 


				 
        INSERT  INTO #Result
                ( Category )
        VALUES  ( N'‰”» «·‰‘«ÿ ACTIVITY RATIOS' );






        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N'„⁄œ· œÊ—«‰ «·√’Ê· «·À«» … (Fixed Asset Turnover)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N' «·„»Ì⁄«  ˜ «·√’Ê· «·À«» …' ,  -- Notes - nvarchar(max) 
                  9
                );



					
        UPDATE  #Result
        SET     ItemPercent = @Val_6 / CASE WHEN ( @Val_23 = 0 ) THEN ( 1 )
                                            ELSE @Val_23
                                       END
        WHERE   ID = 9; 






        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N'„⁄œ· œÊ—«‰ «·„Œ“Ê‰ (Inventory Turnover)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N' ﬂ·›… «·„»Ì⁄«  ˜ „ Ê”ÿ «·„Œ“Ê‰' ,  -- Notes - nvarchar(max) 
                  10
                );


	 

        UPDATE  #Result
        SET     ItemPercent = @Val_12 / CASE WHEN ( @Val_13 = 0 ) THEN ( 1 )
                                             ELSE @Val_13
                                        END
        WHERE   ID = 10; 







        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N' „⁄œ· œÊ—«‰ ≈Ã„«·Ï «·√’Ê· (Total Assets Turnover)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N' «·„»Ì⁄«  ˜ „ Ê”ÿ ≈Ã„«·Ï «·√’Ê·' ,  -- Notes - nvarchar(max) 
                  11
                );






        UPDATE  #Result
        SET     ItemPercent = @Val_6 / CASE WHEN ( @Val_14 = 0 ) THEN ( 1 )
                                            ELSE @Val_14
                                       END
        WHERE   ID = 11; 







        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N'„⁄œ· œÊ—«‰ «·„œÌ‰Ì‰ (Accounts Receivable Turnover)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N' «·„»Ì⁄«  «·√Ã·… ˜ „ Ê”ÿ Õ”«»«  «·„œÌ‰Ì‰' ,  -- Notes - nvarchar(max) 
                  12
                );







				
        UPDATE  #Result
        SET     ItemPercent = @Val_5 / CASE WHEN ( @Val_16 = 0 ) THEN ( 1 )
                                            ELSE @Val_16
                                       END
        WHERE   ID = 12; 




        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N'„⁄œ· œÊ—«‰ «·œ«∆‰Ì‰ (Payables Turnover)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N' «·„‘ —Ì«  «·√Ã·… ˜ „ Ê”ÿ Õ”«»«  «·œ«∆‰Ì‰' ,  -- Notes - nvarchar(max) 
                  13
                );



				
        UPDATE  #Result
        SET     ItemPercent = @Val_18 / CASE WHEN ( @Val_19 = 0 ) THEN ( 1 )
                                             ELSE @Val_19
                                        END
        WHERE   ID = 13; 





        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N'„ Ê”ÿ › —… «· Õ’Ì· (Average Collection Period)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N' ≈Ã„«·Ï Õ”«»«  «·„œÌ‰Ì‰ ˜ „ Ê”ÿ «·„»Ì⁄«  «·ÌÊ„Ì…(’«›Ï «·„»Ì⁄«  «·”‰ÊÌ… ˜365)' ,  -- Notes - nvarchar(max) 
                  14
                );




				
        UPDATE  #Result
        SET     ItemPercent = @Val_16 / ( CASE WHEN ( @Val_14 = 0 ) THEN ( 1 )
                                               ELSE @Val_14 / 365
                                          END )
        WHERE   ID = 14; 







        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N'„ Ê”ÿ › —… «·”œ«œ (Average Payment Period)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N'365 ˜ „⁄œ· œÊ—«‰ «·„Œ“Ê‰' ,  -- Notes - nvarchar(max) 
                  15
                );


        UPDATE  #Result
        SET     ItemPercent = ( @Val_12 / CASE WHEN ( @Val_13 = 0 ) THEN ( 1 )
                                               ELSE @Val_13
                                          END ) / 365
        WHERE   ID = 15; 





        INSERT  INTO #Result
                ( Category
                )
        VALUES  ( N'‰”» «·—›⁄ «·„«·Ï LEVERAGE RATIOS'
                );


        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N' ≈Ã„«·Ï «·«· “«„«  ≈·Ï «·√’Ê· (Total Debts to Assets)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N' ≈Ã„«·Ï «·«· “«„«  ˜  ≈Ã„«·Ï «·√’Ê·' ,  -- Notes - nvarchar(max) 
                  16
                );

				 
				 

				   UPDATE  #Result
        SET     ItemPercent = ( @Val_24 / CASE WHEN ( @Val_11 = 0 ) THEN ( 1 )
                                               ELSE @Val_11
                                          END ) 
        WHERE   ID = 16; 




        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N' «·«· “«„«  ≈·Ï ÕﬁÊﬁ «·„·ﬂÌ… (Debt to Equity)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N' ≈Ã„«·Ï «·«· “«„«  ˜ ≈Ã„«·Ï ÕﬁÊﬁ «·„·ﬂÌ…' ,  -- Notes - nvarchar(max) 
                  17
                );


						   UPDATE  #Result
        SET     ItemPercent = ( @Val_24 / CASE WHEN ( @Val_20 = 0 ) THEN ( 1 )
                                               ELSE @Val_20
                                          END ) 
        WHERE   ID = 16; 













        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N'„⁄œ·  €ÿÌ… «·›Ê«∆œ (Interest Coverage Ratio)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N'’«›Ï «·—»Õ ﬁ»· «·›Ê«∆œ Ê«·÷—«∆» ˜ „’—Ê› «·›Ê«∆œ' ,  -- Notes - nvarchar(max) 
                  18
                );




				
					   UPDATE  #Result
        SET     ItemPercent = ( @Val_21 / CASE WHEN ( @Val_22 = 0 ) THEN ( 1 )
                                               ELSE @Val_22
                                          END ) 
        WHERE   ID = 18; 





        INSERT  INTO #Result
                ( ItemName ,
                  ItemValue ,
                  ItemPercent ,
                  Notes ,
                  ID
                )
        VALUES  ( N'«·ﬁ—Ê÷ ÿÊÌ·… «·√Ã· ≈·Ï —√” «·„«· «·⁄«„· (Long-term Debt to Net Working Capital)' , -- ItemName - nvarchar(max)
                  0.0 , -- ItemValue - float
                  0.0 , -- ItemPercent - float
                  N' «·ﬁ—Ê÷ ÿÊÌ·… «·√Ã· ˜ —√” «·„«· «·⁄«„·' ,  -- Notes - nvarchar(max) 
                  19
                );




		
					   UPDATE  #Result
        SET     ItemPercent = ( @Val_10/ CASE WHEN ( @Val_9 = 0 ) THEN ( 1 )
                                               ELSE @Val_9
                                          END ) 
        WHERE   ID = 19; 





        SELECT  *
        FROM    #Result; 

    END;
GO

