 

ALTER PROCEDURE [dbo].[_TimeShiteOut]
    @Fdates DATE ,
    @Tdates DATE ,
    @Fcomp INT = 0 ,
    @state BIT = 0 ,
    @username NVARCHAR(100) = NULL ,
    @ComputerName NVARCHAR(100) = NULL ,
    @List AS dbo.MyParam READONLY
AS
    DECLARE @FMonthID INT; 
    DECLARE @TMonthID INT; 

    SET @FMonthID = DATEPART(MONTH, @Fdates);
    SET @TMonthID = DATEPART(MONTH, @Tdates);



    CREATE TABLE #Codes
        (
          emp_code BIGINT NULL ,
          emp_name [NVARCHAR](100) COLLATE Arabic_CI_AI
                                   NULL,
        );


    INSERT  INTO #Codes
            SELECT  emp_code ,
                    emp_name
            FROM    emp
            WHERE   ( ( SELECT  ISNULL(COUNT(*), 0)
                        FROM    @List
                      ) = 0
                      OR emp.emp_code IN ( SELECT   *
                                           FROM     @List )
                    )
                    AND flag = 1;

    CREATE TABLE #TimeSheet
        (
          emp_code BIGINT ,
          emp_name [NVARCHAR](100) COLLATE Arabic_CI_AI
                                   NULL ,
          p25 CHAR(5) NULL ,
          p26 CHAR(5) NULL ,
          p27 CHAR(5) NULL ,
          p28 CHAR(5) NULL ,
          p29 CHAR(5) NULL ,
          p30 CHAR(5) NULL ,
          p31 CHAR(5) NULL ,
          d1 CHAR(5) NULL ,
          d2 CHAR(5) NULL ,
          d3 CHAR(5) NULL ,
          d4 CHAR(5) NULL ,
          d5 CHAR(5) NULL ,
          d6 CHAR(5) NULL ,
          d7 CHAR(5) NULL ,
          d8 CHAR(5) NULL ,
          d9 CHAR(5) NULL ,
          d10 CHAR(5) NULL ,
          d11 CHAR(5) NULL ,
          d12 CHAR(5) NULL ,
          d13 CHAR(5) NULL ,
          d14 CHAR(5) NULL ,
          d15 CHAR(5) NULL ,
          d16 CHAR(5) NULL ,
          d17 CHAR(5) NULL ,
          d18 CHAR(5) NULL ,
          d19 CHAR(5) NULL ,
          d20 CHAR(5) NULL ,
          d21 CHAR(5) NULL ,
          d22 CHAR(5) NULL ,
          d23 CHAR(5) NULL ,
          d24 CHAR(5) NULL ,
          d25 CHAR(5) NULL ,
          d26 CHAR(5) NULL ,
          d27 CHAR(5) NULL ,
          d28 CHAR(5) NULL ,
          d29 CHAR(5) NULL ,
          d30 CHAR(5) NULL ,
          d31 CHAR(5) NULL ,
          ContCom BIGINT NULL ,
          CountApsent BIGINT NULL
        );


    INSERT  INTO #TimeSheet
            SELECT  emp_code ,
                    emp_name ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    '' ,
                    0 ,
                    0
            FROM    #Codes; 
 




    UPDATE  #TimeSheet
    SET     #TimeSheet.p25 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Fdates),
                                                              MONTH(@Fdates),
                                                              25)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.p26 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Fdates),
                                                              MONTH(@Fdates),
                                                              26)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.p27 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Fdates),
                                                              MONTH(@Fdates),
                                                              27)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.p28 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Fdates),
                                                              MONTH(@Fdates),
                                                              28)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 

    IF @FMonthID = 1
        OR @FMonthID = 3
        OR @FMonthID = 4
        OR @FMonthID = 5
        OR @FMonthID = 6
        OR @FMonthID = 7
        OR @FMonthID = 8
        OR @FMonthID = 9
        OR @FMonthID = 10
        OR @FMonthID = 11
        OR @FMonthID = 12
        BEGIN
            UPDATE  #TimeSheet
            SET     #TimeSheet.p29 = g.timecom
            FROM    #TimeSheet
                    INNER JOIN ( SELECT Emp_Code ,
                                        timecom = ISNULL(Emp_Time_Out, 0)
                                 FROM   Emp_Comming
                                 WHERE  emp_datecomming = dbo.DateVal(YEAR(@Fdates),
                                                              MONTH(@Fdates),
                                                              29)
                               ) g ON #TimeSheet.emp_code = g.emp_code; 

        END;

    IF @FMonthID = 1
        OR @FMonthID = 3
        OR @FMonthID = 4
        OR @FMonthID = 5
        OR @FMonthID = 6
        OR @FMonthID = 7
        OR @FMonthID = 8
        OR @FMonthID = 9
        OR @FMonthID = 10
        OR @FMonthID = 11
        OR @FMonthID = 12
        BEGIN

            UPDATE  #TimeSheet
            SET     #TimeSheet.p30 = g.timecom
            FROM    #TimeSheet
                    INNER JOIN ( SELECT Emp_Code ,
                                        timecom = ISNULL(Emp_Time_Out, 0)
                                 FROM   Emp_Comming
                                 WHERE  emp_datecomming = dbo.DateVal(YEAR(@Fdates),
                                                              MONTH(@Fdates),
                                                              30)
                               ) g ON #TimeSheet.emp_code = g.emp_code; 

        END;

    IF @FMonthID = 1
        OR @FMonthID = 3
        OR @FMonthID = 5
        OR @FMonthID = 7
        OR @FMonthID = 8
        OR @FMonthID = 10
        OR @FMonthID = 12
        BEGIN

            UPDATE  #TimeSheet
            SET     #TimeSheet.p31 = g.timecom
            FROM    #TimeSheet
                    INNER JOIN ( SELECT Emp_Code ,
                                        timecom = ISNULL(Emp_Time_Out, 0)
                                 FROM   Emp_Comming
                                 WHERE  emp_datecomming = dbo.DateVal(YEAR(@Fdates),
                                                              MONTH(@Fdates),
                                                              31)
                               ) g ON #TimeSheet.emp_code = g.emp_code; 

        END;





    UPDATE  #TimeSheet
    SET     #TimeSheet.d1 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              1)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 

    UPDATE  #TimeSheet
    SET     #TimeSheet.d2 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              2)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d3 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              3)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d4 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              4)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d5 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              5)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 



    UPDATE  #TimeSheet
    SET     #TimeSheet.d6 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              6)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 



    UPDATE  #TimeSheet
    SET     #TimeSheet.d7 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              7)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 



    UPDATE  #TimeSheet
    SET     #TimeSheet.d8 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              8)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d9 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              9)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d10 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              10)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d11 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              11)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d12 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              12)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d13 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              13)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d14 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              14)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 



    UPDATE  #TimeSheet
    SET     #TimeSheet.d15 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              15)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d16 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              16)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d17 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              17)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 



    UPDATE  #TimeSheet
    SET     #TimeSheet.d18 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              18)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d19 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              19)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 



    UPDATE  #TimeSheet
    SET     #TimeSheet.d20 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              20)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 



    UPDATE  #TimeSheet
    SET     #TimeSheet.d21 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              21)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 



    UPDATE  #TimeSheet
    SET     #TimeSheet.d22 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              22)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d23 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              23)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d24 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              24)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d25 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              25)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.d26 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              26)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 



    UPDATE  #TimeSheet
    SET     #TimeSheet.d27 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              27)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 



    UPDATE  #TimeSheet
    SET     #TimeSheet.d28 = g.timecom
    FROM    #TimeSheet
            INNER JOIN ( SELECT Emp_Code ,
                                timecom = ISNULL(Emp_Time_Out, 0)
                         FROM   Emp_Comming
                         WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              28)
                       ) g ON #TimeSheet.emp_code = g.emp_code; 

    IF @TMonthID = 1
        OR @TMonthID = 3
        OR @TMonthID = 4
        OR @TMonthID = 5
        OR @TMonthID = 6
        OR @TMonthID = 7
        OR @TMonthID = 8
        OR @TMonthID = 9
        OR @TMonthID = 10
        OR @TMonthID = 11
        OR @TMonthID = 12
        BEGIN 

            UPDATE  #TimeSheet
            SET     #TimeSheet.d29 = g.timecom
            FROM    #TimeSheet
                    INNER JOIN ( SELECT Emp_Code ,
                                        timecom = ISNULL(Emp_Time_Out, 0)
                                 FROM   Emp_Comming
                                 WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              29)
                               ) g ON #TimeSheet.emp_code = g.emp_code; 

        END;

    IF @TMonthID = 1
        OR @TMonthID = 3
        OR @TMonthID = 4
        OR @TMonthID = 5
        OR @TMonthID = 6
        OR @TMonthID = 7
        OR @TMonthID = 8
        OR @TMonthID = 9
        OR @TMonthID = 10
        OR @TMonthID = 11
        OR @TMonthID = 12
        BEGIN 

            UPDATE  #TimeSheet
            SET     #TimeSheet.d30 = g.timecom
            FROM    #TimeSheet
                    INNER JOIN ( SELECT Emp_Code ,
                                        timecom = ISNULL(Emp_Time_Out, 0)
                                 FROM   Emp_Comming
                                 WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              30)
                               ) g ON #TimeSheet.emp_code = g.emp_code; 

        END;

    IF @TMonthID = 1
        OR @TMonthID = 3
        OR @TMonthID = 5
        OR @TMonthID = 7
        OR @TMonthID = 8
        OR @TMonthID = 10
        OR @TMonthID = 12
        BEGIN
            UPDATE  #TimeSheet
            SET     #TimeSheet.d31 = g.timecom
            FROM    #TimeSheet
                    INNER JOIN ( SELECT Emp_Code ,
                                        timecom = ISNULL(Emp_Time_Out, 0)
                                 FROM   Emp_Comming
                                 WHERE  emp_datecomming = dbo.DateVal(YEAR(@Tdates),
                                                              MONTH(@Tdates),
                                                              31)
                               ) g ON #TimeSheet.emp_code = g.emp_code; 

        END;
 
 
    UPDATE  #TimeSheet
    SET     #TimeSheet.ContCom = g.countcomm
    FROM    #TimeSheet
            INNER JOIN ( SELECT countcomm = COUNT(comming) ,
                                Emp_Code
                         FROM   Emp_Comming
                         WHERE  comming = 1
                                AND emp_datecomming >= @Fdates
                                AND emp_datecomming <= @Tdates
                         GROUP BY Emp_Code
                       ) g ON #TimeSheet.emp_code = g.emp_code; 


    UPDATE  #TimeSheet
    SET     #TimeSheet.CountApsent = g.countaps
    FROM    #TimeSheet
            INNER JOIN ( SELECT countaps = COUNT(comming) ,
                                Emp_Code
                         FROM   Emp_Comming
                         WHERE  comming = 0
                                AND svacation = 0
                                AND ghyab_bezn = 0
                                AND vacation = 0
                                AND maamorya = 0
                                AND emp_datecomming >= @Fdates
                                AND emp_datecomming <= @Tdates
                         GROUP BY Emp_Code
                       ) g ON #TimeSheet.emp_code = g.emp_code; 

    SELECT  *
    FROM    #TimeSheet;
 
