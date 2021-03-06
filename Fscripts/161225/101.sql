
ALTER PROC [dbo].[_CalculateMonth]
   
    @Fdates DATE ,
    @Tdates DATE ,
    @Fcomp CHAR(20) = 0 ,
   
    @state BIT = 0 ,
    @username NVARCHAR(100) = NULL ,
    @ComputerName NVARCHAR(100) = NULL,
 @List AS dbo.MyParam READONLY

--@Yearto int
AS
    DECLARE @Fdates1 DATE
    DECLARE @Tdates1 DATE

    SET @Fdates1 = @Fdates;  --dbo.DateVal(@Year,@month,@day)
    SET @Tdates1 = @Tdates;  --dbo.DateVal(@Yearto,@monthto,@dayto)

    --DECLARE @startmonth INT
    --DECLARE @month_id NUMERIC
    --DECLARE @year_id NUMERIC


    --CREATE TABLE #Codes ( empcode BIGINT NULL, )

		

    --INSERT  INTO #Codes
    --        SELECT  emp_code
    --        FROM    emp
    --        WHERE   emp.flag = 1

    --                AND emp.Sec_id BETWEEN CAST(@FBranch AS INT)
    --                               AND     CAST(@TBranch AS INT)
    --                AND emp.Planid BETWEEN CAST(@FPlan AS INT)
    --                               AND     CAST(@TPlan AS INT)
    --                AND emp.depart_id BETWEEN CAST(@Fdepart AS INT)
    --                                  AND     CAST(@Tdepart AS INT)
    --                AND emp.emp_code BETWEEN @code AND @code1 
                    
    CREATE TABLE #tempz
        (
          [code] [NUMERIC](8) NULL ,
          [name] [NVARCHAR](100) COLLATE Arabic_CI_Ai
                                 NULL ,
          [Date] DATE ,
          [DayCode] [CHAR](1) COLLATE Arabic_CI_Ai
                              NULL ,
          [timeIn] [NVARCHAR](5) COLLATE Arabic_CI_Ai
                                 NULL ,
          [timeOut] [NVARCHAR](5) COLLATE Arabic_CI_Ai
                                  NULL ,
          [timeInCase] [NVARCHAR](30) COLLATE Arabic_CI_Ai
                                      NULL ,
          [timeOutCase] [NVARCHAR](30) COLLATE Arabic_CI_Ai
                                       NULL ,
          Explain NVARCHAR(100) ,
          [Late] DECIMAL(18, 4) NULL ,
          LateIntime CHAR(5) ,
          [Late1] DECIMAL(18, 4) NULL ,
          [totalLate] [NUMERIC](5, 4) NULL ,
          LateOuttime CHAR(5) ,
          [EmpWorkTime] [VARCHAR](7) COLLATE Arabic_CI_Ai
                                     NULL ,
          [WorkTime] [VARCHAR](7) COLLATE Arabic_CI_Ai
                                  NULL ,
          Flage INT NULL ,
          cut NUMERIC(5, 4) ,
          shfitid CHAR(4) ,
          absent NUMERIC(5, 4) ,
          [OverTime] CHAR(5) ,
          [Brakeout] CHAR(5) ,
          [brakein] CHAR(5),

		  [AccCode] BIGINT ,
          [AccName] NVARCHAR(150) ,
          [ShortCode] NVARCHAR(50)

        )



    CREATE TABLE #OverTime
        (
          [code] [NUMERIC](8, 0) NULL ,
          [date] DATE ,
          [time] CHAR(5)
        )

    CREATE TABLE #AttendanceVacation
        (
          [code] [NUMERIC](8, 0) NULL ,
          [timeIn] [NVARCHAR](5) NULL ,
          [timeOut] [NVARCHAR](5) NULL ,
          [Date] DATE ,
          flage INT NULL ,
          Explain [NVARCHAR](50) NULL
        ) 

    CREATE TABLE #WorkTimesHoliday
        (
          date CHAR(8) COLLATE Arabic_CI_Ai
                       NULL ,
          Explain NVARCHAR(100)
        )

    
 
    CREATE TABLE #Empabsent
        (
          [code] [NUMERIC](8, 0) NULL ,
          [date] CHAR(8) COLLATE Arabic_CI_Ai
                         NULL ,
          Cut [NUMERIC](5, 4) ,
          flage INT
        )

    DELETE  FROM #tempz
 
    DELETE  FROM #AttendanceVacation
    DELETE  FROM #WorkTimesHoliday



    --WHILE @Fdates1 <= @Tdates1
    --    BEGIN

            INSERT  INTO #tempz
                    SELECT 
                            ( emp_code ) AS code ,
                            ( emp_name ) AS name ,
                             emp_datecomming ,
                            DATEPART(dw, emp_datecomming) AS DayCode ,
                            ISNULL(vEmp_Comming.Emp_Time_Comming, 0) AS timeIn ,
                            ISNULL(vEmp_Comming.Emp_Time_Out, 0) AS timeOut ,
                            0 AS timeincase ,
                            0 AS timeoutcase ,
                            '' ,
                            0 ,
                            0 ,
                            ISNULL(vEmp_Comming.Emp_Time_Late, 0) ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            LTRIM(RTRIM(STR(0))) AS shift ,
                            0 ,
                            0 ,
                            ISNULL(vEmp_Comming.brakeOut, 0) AS brakeOut ,
                            ISNULL(vEmp_Comming.brakein, 0) AS brakein,AccCode,AccName,ShortCode
                    FROM    vEmp_Comming
                            
                    WHERE   flag = 1
                            
                            AND  
							( ( SELECT  ISNULL(COUNT(*), 0)
                            FROM    @List
                          ) = 0
                          OR emp_code IN ( SELECT   *
                                               FROM     @List )
                        )
                            AND dbo.vEmp_Comming.emp_datecomming BETWEEN @Fdates AND @Tdates
												  


            --SET @Fdates1 = DATEADD(DAY, 1, @Fdates1)
        --END

	 
    INSERT  INTO #AttendanceVacation
            SELECT DISTINCT
                    Emp_Vacation.Emp_Code ,
                    'ج' ,
                    'ج' ,
                    dbo.DateVal(YEAR(emp_datecomming), MONTH(emp_datecomming),
                                DAY(emp_datecomming)) ,
                    vacation_code.vacation_id ,
                    'اجازة '
            FROM    Emp_Vacation
                    INNER JOIN vacation_code ON Emp_Vacation.vacation_id = vacation_code.vacation_id
                    INNER JOIN Emp_Comming ON Emp_Vacation.Emp_Code = Emp_Comming.Emp_Code
					INNER JOIN #tempz ON #tempz.code = Emp_Vacation.Emp_Code
            WHERE   Emp_Vacation.Emp_Vac_Date BETWEEN @Fdates AND @Tdates
                                                       
                    AND comming = 0
                    AND vacation = 1
            ORDER BY vacation_code.vacation_id 


    INSERT  INTO #AttendanceVacation
            SELECT DISTINCT
                    Emp_Code ,
                    'جـ ر' ,
                    'جـ ر' ,
                    dbo.DateVal(YEAR(emp_datecomming), MONTH(emp_datecomming),
                                DAY(emp_datecomming)) ,
                    0 ,
                    'اجازة رسميه'
            FROM    Emp_Comming
			INNER JOIN #tempz ON #tempz.code = Emp_Comming.Emp_Code
            WHERE   svacation = 1
                    AND emp_datecomming BETWEEN @Fdates AND @Tdates
 
    INSERT  INTO #AttendanceVacation
            SELECT DISTINCT
                    Emp_Code ,
                    'م' ,
                    'م' ,
                    dbo.DateVal(YEAR(emp_datecomming), MONTH(emp_datecomming),
                                DAY(emp_datecomming)) ,
                    0 ,
                    'ماموريه'
            FROM    Emp_Comming
			INNER JOIN #tempz ON #tempz.code = Emp_Comming.Emp_Code
            WHERE   Emp_Comming.maamorya = 1
                    AND emp_datecomming BETWEEN @Fdates AND @Tdates
 
    INSERT  INTO #AttendanceVacation
            SELECT DISTINCT
                    Emp_Code ,
                    'ات' ,
                    'ات' ,
                    dbo.DateVal(YEAR(emp_datecomming), MONTH(emp_datecomming),
                                DAY(emp_datecomming)) ,
                    0 ,
                    'اذن تأخير'
            FROM    Emp_Comming
			INNER JOIN #tempz ON #tempz.code = Emp_Comming.Emp_Code
            WHERE   Emp_Comming.ezn = 1
                    AND emp_datecomming BETWEEN @Fdates AND @Tdates
	


    INSERT  INTO #AttendanceVacation
            SELECT DISTINCT
                    Emp_Code ,
                    'غ' ,
                    'غ' ,
                    dbo.DateVal(YEAR(emp_datecomming), MONTH(emp_datecomming),
                                DAY(emp_datecomming)) ,
                    0 ,
                    'غياب'
            FROM    Emp_Comming
			INNER JOIN #tempz ON #tempz.code = Emp_Comming.Emp_Code
            WHERE   Emp_Comming.comming = 0
                    AND Emp_Comming.svacation = 0
                    AND Emp_Comming.vacation = 0
                    AND Emp_Comming.maamorya = 0
                    AND emp_datecomming BETWEEN @Fdates AND @Tdates
 
  

    INSERT  INTO #Empabsent
            SELECT  Emp_Code ,
                    dbo.DateVal(YEAR(emp_datecomming), MONTH(emp_datecomming),
                                DAY(emp_datecomming)) ,
                    CASE WHEN ( Emp_Comming.ghyab_bezn = 1 )
                         THEN ( ApsentPERM )
                         ELSE ( Apsent )
                    END ,
                    CASE WHEN ( Emp_Comming.ghyab_bezn = 1 ) THEN ( 0 )
                         ELSE ( 7 )
                    END
            FROM    Emp_Comming
			INNER JOIN #tempz ON #tempz.code = Emp_Comming.Emp_Code
                    INNER JOIN WorkPlanEdite ON WorkPlanEdite.Planid = Emp_Comming.planid
                                                AND WorkPlanEdite.ShiftID = Emp_Comming.ShiftID
            WHERE   Emp_Comming.comming = 0
                    AND vacation = 0
                    AND svacation = 0
                    AND maamorya = 0
 



 
  

    

    UPDATE  #tempz
    SET     [EmpWorkTime] = dbo.TimeDiff(timeOut, timeIn)
    WHERE   timeOut != '0'
            AND timeIn != '0'



  

  


 
    UPDATE  #tempz
    SET     #tempz.timeInCase = LTRIM(RTRIM(#tempz.timeInCase))
            + #AttendanceVacation.timeIn ,
            #tempz.timeOutCase = LTRIM(RTRIM(#tempz.timeOutCase))
            + #AttendanceVacation.timeOut ,
            #tempz.Late = 0 ,
            #tempz.Late1 = 0 ,
            #tempz.Flage = #AttendanceVacation.flage ,
            #tempz.Explain = #AttendanceVacation.Explain
    FROM    #tempz
            INNER JOIN #AttendanceVacation ON #tempz.code = #AttendanceVacation.code
                                              AND #tempz.Date = #AttendanceVacation.Date
    WHERE   absent = 0 
	 

    

    UPDATE  #tempz
    SET     #tempz.absent = #Empabsent.Cut ,
            #tempz.Flage = #Empabsent.flage
    FROM    #tempz
            INNER JOIN #Empabsent ON #tempz.code = #Empabsent.code
                                     AND #tempz.Date = #Empabsent.date

 
	--عشان التجميع فى نهاية ام التقرير
    UPDATE  #tempz
    SET     totalLate = CASE WHEN ( ISNULL(Late, 0) > 0
                                    AND ISNULL(Late1, 0) > 0
                                  ) THEN ISNULL(Late, 0) + ISNULL(Late1, 0)
                             ELSE ( 0 )
                        END


    SELECT  #tempz.* ,
            Company_name.COM_ID AS CompCode ,
            Company_name.COM_name AS CompName ,
            jobs.jobid AS jobcode ,
            jobs.jname AS jobname ,
            departments.depart_id AS DepCode ,
            departments.depart_name AS depname ,
            Sections.Sec_id AS BranchCode ,
            Sections.Sec_name AS BranchName ,
            @username AS UserName ,
            @ComputerName AS ComputerName ,
            '' AS fileno
    FROM    #tempz
            LEFT JOIN emp ON #tempz.code = emp.emp_code
            LEFT JOIN jobs ON emp.jobid = jobs.jobid
            LEFT JOIN Company_name ON emp.COMP_ID = Company_name.COM_ID
            LEFT JOIN departments ON emp.depart_id = departments.depart_id
            LEFT JOIN Sections ON Sections.Sec_id = emp.Sec_id
 


