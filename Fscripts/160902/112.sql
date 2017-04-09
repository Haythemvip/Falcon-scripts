


ALTER PROCEDURE [dbo].[Acc_Mezanya]
    @Cur_ID INT ,
    @Year CHAR(4) ,
    @PastYear CHAR(4) ,
    @CmbMyznya_ID INT ,
    @DT1 DATE ,
    @DT2 DATE ,
    @DT3 DATE ,
    @DT4 DATE,
	@GroupID INT ,
	@CostID BIGINT = 0
AS
    DELETE  FROM AccMezanya; 



    CREATE TABLE #Table1
        (
          Aaccount_GroupID INT ,
          MethodID INT ,
          ThisYear FLOAT ,
          PastYear FLOAT ,
          ThisYearAdd FLOAT ,
          PastYearAdd FLOAT ,
          ThisYearMinus FLOAT ,
          PastYearMinus FLOAT ,
          FinalMenuID INT -- ﬂÊœ »‰œ «·„Ì“«‰Ì…
	
	
	    );


    INSERT  #Table1
            ( Aaccount_GroupID ,
              MethodID ,
              ThisYear ,
              PastYear ,
			  ThisYearAdd ,
              PastYearAdd ,
			  ThisYearMinus ,
              PastYearMinus ,

              FinalMenuID
	        )
            SELECT  Aaccount_GroupID , -- Aaccount_GroupID - int
                    MethodID , -- MethodID - int
                    0.00 AS 'ThisYear' ,
                    0.00 AS 'PastYear' ,
                    0.00 AS 'ThisYearadd' ,
                    0.00 AS 'PastYearadd' ,
                    0.00 AS 'ThisYearminus' ,
                    0.00 AS 'PastYearminus' ,
                    FinalMenuID
            FROM    FinalBalanceForms
            WHERE   MezaniaID = @CmbMyznya_ID
                    AND GroupId = @GroupId;

    INSERT  INTO AccMezanya
            SELECT  ID ,
                    '' ,
                    '' ,
                    '' ,
                    Name_Ar ,
                    0.00 AS 'ThisYear' ,
                    0.00 AS 'PastYear' ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    isTitle
            FROM    FinalMenuSittings
            WHERE   FainalMenuID = @CmbMyznya_ID AND GroupId = @GroupId 
            ORDER BY SortID;

 
 
 
    UPDATE  #Table1
    SET     [ThisYearAdd] = ISNULL(( SELECT    SUM(Maden)
                                  FROM      View_Mezn
                                  WHERE     View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                            AND aDate BETWEEN @DT1 AND @DT2  AND (@CostID = 0 OR costid = @CostID )
                                ), 0)
            - ISNULL(( SELECT   SUM(Daen)
                       FROM     View_Mezn
                       WHERE    View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                AND aDate BETWEEN @DT1 AND @DT2  AND (@CostID = 0 OR costid = @CostID )
                     ), 0)WHERE  #Table1 .MethodID = 1;
 




    UPDATE  #Table1
    SET     [PastYearAdd] = ISNULL(( SELECT    SUM(Maden)
                                  FROM      View_Mezn
                                  WHERE     View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                            AND aDate BETWEEN @DT3 AND @DT4  AND (@CostID = 0 OR costid = @CostID )
                                ), 0)
            - ISNULL(( SELECT   SUM(Daen)
                       FROM     View_Mezn
                       WHERE    View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                AND aDate BETWEEN @DT3 AND @DT4  AND (@CostID = 0 OR costid = @CostID )
                     ), 0)WHERE  #Table1 .MethodID = 1;





 UPDATE  #Table1
    SET     [ThisYearMinus] = ISNULL(( SELECT    SUM(Maden)
                                  FROM      View_Mezn
                                  WHERE     View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                            AND aDate BETWEEN @DT1 AND @DT2 AND (@CostID = 0 OR costid = @CostID )
                                ), 0)
            - ISNULL(( SELECT   SUM(Daen)
                       FROM     View_Mezn
                       WHERE    View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                AND aDate BETWEEN @DT1 AND @DT2  AND (@CostID = 0 OR costid = @CostID )
                     ), 0) WHERE  #Table1 .MethodID = 0;
 




    UPDATE  #Table1
    SET     [PastYearMinus] = ISNULL(( SELECT    SUM(Maden)
                                  FROM      View_Mezn
                                  WHERE     View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                            AND aDate BETWEEN @DT3 AND @DT4 AND (@CostID = 0 OR costid = @CostID )
                                ), 0)
            - ISNULL(( SELECT   SUM(Daen)
                       FROM     View_Mezn
                       WHERE    View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                AND aDate BETWEEN @DT3 AND @DT4  AND (@CostID = 0 OR costid = @CostID )
                     ), 0) WHERE  #Table1 .MethodID = 0;




    UPDATE  #Table1
    SET     [ThisYear] = ThisYearAdd - ThisYearMinus ,
            PastYear = PastYearAdd - PastYearMinus; 









    UPDATE  AccMezanya
    SET     [ThisYear] = ISNULL(( SELECT    SUM(ThisYear)
                                  FROM      #Table1
                                  WHERE     AccMezanya.AccCode = #Table1.FinalMenuID
                                ), 0);
                                            
        
    UPDATE  AccMezanya
    SET     [PastYear] = ISNULL(( SELECT    SUM(PastYear)
                                  FROM      #Table1
                                  WHERE     #Table1.FinalMenuID = AccMezanya.AccCode
                                ), 0);


 
    SELECT  *
    FROM    AccMezanya;  
  
    

 

