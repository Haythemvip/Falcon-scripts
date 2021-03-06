 

ALTER PROC [dbo].[_SalaryShit]
    @code BIGINT ,
    @code1 BIGINT ,
    @Fdates DATE ,
    @Tdates DATE ,
    @FPlan BIGINT ,
    @TPlan BIGINT ,
    @Fdepart BIGINT ,
    @Tdepart BIGINT ,
    @Fcomp BIGINT ,
    @Tcomp BIGINT ,
    @FBranch BIGINT ,
    @TBranch BIGINT ,
    @FBank NVARCHAR(100) ,
    @state BIT = 0 ,
    @gettingdaycount INT = 0,
	@year INT 
AS --DECLARE @FDate1 SMALLDATETIME
 

    DECLARE @MonthDayCount AS INT

    DECLARE @month AS INT
    

    SET @month = DATEPART(MONTH, @Fdates)
    

	
     --SET @MonthDayCount = dbo.MonthDays(@month, @year)

    SET @MonthDayCount = CASE WHEN dbo.MonthDays(@month, @year) = 29
                              THEN ( 29 )
                              ELSE CASE WHEN dbo.MonthDays(@month, @year) = 28
                                        THEN ( 28 )
                                        ELSE CASE WHEN dbo.MonthDays(@month,
                                                              @year) >= 30
                                                  THEN ( 30 )
                                             END
                                   END
                         END

    CREATE TABLE #Codes ( empcode BIGINT NULL, )



    CREATE TABLE #Badalat
        (
          Badal_Ta3am BIT ,
          Badal_Sakan BIT ,
          Badal_thabet BIT ,
          Badal_Entekal BIT ,
          Badal_Tabe3a BIT ,
          Badal_Other BIT ,
          Badal_tel BIT ,
          Take_Schole BIT
        )


    INSERT  INTO #Badalat
            SELECT  Badal_Ta3am ,
                    Badal_Sakan ,
                    Badal_thabet ,
                    Badal_Entekal ,
                    Badal_Tabe3a ,
                    Badal_Other ,
                    Badal_tel ,
                    Take_Schole
            FROM    Falcon_Sitting
            WHERE   Falcon_Sitting.SitingID = 1


    CREATE TABLE #excel
        (
          [code] BIGINT NOT NULL ,
          [name] NVARCHAR(150) COLLATE Arabic_CI_AS
                               NOT NULL ,
          [jop] NVARCHAR(100) COLLATE Arabic_CI_AS
                              NULL ,
          [brnchs] NVARCHAR(50) COLLATE Arabic_CI_AS
                                NULL ,
          [ksm] NVARCHAR(50) COLLATE Arabic_CI_AS
                             NULL ,
          oth_sal NUMERIC(18, 4) NOT NULL ,
          others3 [NUMERIC](18, 4) ,
          hawafez [NUMERIC](18, 4) ,
          [Salary] [NUMERIC](18, 4) NOT NULL ,
          [m_sal] [NUMERIC](18, 4) NOT NULL ,
          [b_ent] [NUMERIC](18, 4) NULL ,
          [b_tab] [NUMERIC](18, 4) NULL ,
          [b_malbas] [NUMERIC](18, 4) NULL ,
          [b_food] [NUMERIC](18, 4) NULL ,
          [totalm] [NUMERIC](13, 4) NULL ,
          [takher] [DECIMAL](18, 2) NULL ,
          [solfa_cut] [DECIMAL](18, 4) NULL ,
          [gyab] [NUMERIC](18, 2) NULL ,
          [gaza] [NUMERIC](18, 2) NULL ,
          [ins] [NUMERIC](18, 2) NULL ,
          [tax] [NUMERIC](18, 2) NULL ,
          [totalkh] [NUMERIC](14, 2) NULL ,
          [safy] [NUMERIC](15, 2) NULL ,
          [brnchid] [CHAR](2) NULL ,
          [ksmid] [CHAR](3) NULL ,
          [month] [INT] NULL ,
          [year] [INT] NULL ,
          [Day] [INT] NULL ,
          [a_ins] [NUMERIC](18, 2) NULL ,
          [d_ins] [NUMERIC](18, 2) NULL ,
          [w_a_ins] [NUMERIC](18, 2) NULL ,
          [w_d_ins] [NUMERIC](18, 2) NULL ,
          [accno] [CHAR](50) NULL ,
          compcode NVARCHAR(25) ,
          compName NVARCHAR(200) ,
          houraddagaza [NUMERIC](18, 2) ,
          daygazaa [NUMERIC](18, 2) ,
          daytakher [NUMERIC](18, 2) ,
          daygyab [NUMERIC](18, 2) ,
          moneygazaa [NUMERIC](18, 4) ,
          moneytakher [NUMERIC](18, 4) ,
          moneygyab [NUMERIC](18, 4) ,
          planid INT ,
          NationalityID INT ,
          ed_agaza [NUMERIC](18, 0) ,
          ed_sahar [NUMERIC](18, 2) ,
          other_add [NUMERIC](18, 2) ,
          elawa [NUMERIC](18, 2) ,
          mobile [NUMERIC](18, 2) ,
          Tel [NUMERIC](18, 4) ,
          nafaa [NUMERIC](18, 0) ,
          [SalaryType] [NVARCHAR](50) COLLATE Arabic_CI_AS
                                      NOT NULL ,
          Lokked BIT ,
          Take_Schole FLOAT DEFAULT 0 ,
          Take_Percent FLOAT DEFAULT 0 ,
          BarCode [NVARCHAR](50) NOT NULL ,
          Nationality [NVARCHAR](50) COLLATE Arabic_CI_AS
                                     NOT NULL ,
 
        )


    IF @FBank <> '0'
        BEGIN
            INSERT  INTO #Codes
                    SELECT  emp_code
                    FROM    emp
                    WHERE   emp.flag = 1
                            AND emp.SalaryType = @FBank
                            AND emp.Sec_id >= @FBranch
                            AND emp.Sec_id <= @TBranch
                            AND emp.Planid >= @FPlan
                            AND emp.Planid <= @TPlan
                            AND emp.depart_id >= @Fdepart
                            AND emp.depart_id <= @Tdepart
                            AND emp.emp_code >= @code
                            AND emp.emp_code <= @code1

        END

    IF @FBank = '0'
        BEGIN
            INSERT  INTO #Codes
                    SELECT  emp_code
                    FROM    emp
                    WHERE   emp.flag = 1
                            AND emp.Sec_id >= @FBranch
                            AND emp.Sec_id <= @TBranch
                            AND emp.Planid >= @FPlan
                            AND emp.Planid <= @TPlan
                            AND emp.depart_id >= @Fdepart
                            AND emp.depart_id <= @Tdepart
                            AND emp.emp_code >= @code
                            AND emp.emp_code <= @code1 

        END


    INSERT  INTO #excel
            SELECT  *
            FROM    EmpSalary
            WHERE   EmpSalary.emp_code IN ( SELECT  empcode
                                            FROM    #Codes )

 



 -- لضبط مخرجات التقرير فقط بدون التاثير على الحسابات

	-- حساب الراتب الاساسى
    UPDATE  #excel
    SET     ed_sahar = Salary + oth_sal + m_sal

	-- حساب البدلات 

    UPDATE  #excel
    SET     elawa = ISNULL(b_ent, 0) + ISNULL(others3, 0) + ISNULL(hawafez, 0)
            + ISNULL(b_malbas, 0) + ISNULL(b_food, 0) + ISNULL(b_tab, 0) 
 
 -- اجمالى الراتب مع البدلات

    UPDATE  #excel
    SET     mobile = elawa + ed_sahar

--=============================================================


 
 --[Salary]  بدل ثابت

--b_ent  بدل انتقال
--others3 بدل طعام
--b_tab بدل تليفون
--hawafez بدل سكن
--b_malbas بل ملبس
--b_food بدل موقع
--ed_agaza  اضافى
-- takher  الحوافز

 
 

    IF @gettingdaycount = 0
        BEGIN

		--عدد الايام ال حضرها فعلا

            UPDATE  #excel
            SET     #excel.nafaa = ISNULL(( SELECT  COUNT(Emp_Code)
                                            FROM    dbo.Emp_Comming
                                            WHERE   Emp_Comming.comming = 1
                                                    AND svacation = 0
                                                    AND Emp_Code = #excel.code
                                                    AND emp_datecomming BETWEEN @Fdates AND @Tdates
                                          ), 0)

        END


		

		-- الاجازات الرسمية

    UPDATE  #excel
    SET     #excel.houraddagaza = ISNULL(( SELECT   COUNT(Emp_Code)
                                           FROM     dbo.Emp_Comming
                                           WHERE    Emp_Comming.svacation = 1
                                                    AND Emp_Code = #excel.code
                                                    AND emp_datecomming BETWEEN @Fdates AND @Tdates
                                         ), 0)




-- ايام الاجازة 

    UPDATE  #excel
    SET     #excel.daygazaa = ISNULL(( SELECT   COUNT(Emp_Code)
                                       FROM     dbo.Emp_Comming
                                       WHERE    Emp_Comming.vacation = 1
                                                AND Emp_Code = #excel.code
                                                AND emp_datecomming BETWEEN @Fdates AND @Tdates
                                     ), 0)




-- المأموريات 


    UPDATE  #excel
    SET     #excel.other_add = ISNULL(( SELECT  COUNT(Emp_Code)
                                        FROM    dbo.Emp_Comming
                                        WHERE   Emp_Comming.maamorya = 1
                                                AND Emp_Code = #excel.code
                                                AND emp_datecomming BETWEEN @Fdates AND @Tdates
                                      ), 0)





    IF @gettingdaycount = 1
        BEGIN


            UPDATE  #excel
            SET     #excel.nafaa = ( CASE WHEN ( SELECT ISNULL(Last_Month_DayCount,
                                                              0)
                                                 FROM   dbo.emp
                                                 WHERE  emp.emp_code = #excel.code
                                               ) > ( @MonthDayCount
                                                     - other_add - daygazaa
                                                     - houraddagaza )
                                          THEN ( @MonthDayCount - other_add
                                                 - daygazaa - houraddagaza )
                                          ELSE ( SELECT ISNULL(Last_Month_DayCount,
                                                              0)
                                                 FROM   dbo.emp
                                                 WHERE  emp.emp_code = #excel.code
                                               )
                                     END )
	 

        END




    UPDATE  #excel
    SET     #excel.Day = CASE WHEN ( other_add + daygazaa + houraddagaza
                                     + nafaa ) > @MonthDayCount
                              THEN ( @MonthDayCount )
                              ELSE ( other_add + daygazaa + houraddagaza
                                     + nafaa )
                         END



    UPDATE  #excel
    SET     #excel.nafaa = CASE WHEN ( other_add + daygazaa + houraddagaza
                                       + nafaa ) > @MonthDayCount
                                THEN ( @MonthDayCount )
                                ELSE ( other_add + daygazaa + houraddagaza
                                       + nafaa )
                           END


-- بدل مدارس


    UPDATE  #excel
    SET     Take_Schole = CASE WHEN ( ( SELECT TOP 1
                                                Take_Schole
                                        FROM    #Badalat
                                      ) = 1 )
                               THEN CASE WHEN nafaa = 0 THEN ( 0 )
                                         WHEN ( @MonthDayCount - Day = 0 )
                                         THEN ( Take_Schole )
                                         WHEN ( @MonthDayCount - Day > 0 )
                                         THEN Take_Schole - ( ( Take_Schole
                                                              / 30 )
                                                              * ( @MonthDayCount
                                                              - Day ) )
                                    END
                               ELSE CASE WHEN nafaa = 0 THEN ( 0 )
                                         ELSE ( Take_Schole )
                                    END
                          END 


    UPDATE  #excel
    SET     Take_Schole = ROUND(Take_Schole, 0)



--b_tab بدل تليفون
    


    UPDATE  #excel
    SET     b_tab = CASE WHEN ( ( SELECT TOP 1
                                            Badal_tel
                                  FROM      #Badalat
                                ) = 1 )
                         THEN CASE WHEN nafaa = 0 THEN ( 0 )
                                   WHEN ( @MonthDayCount - Day = 0 )
                                   THEN ( b_tab )
                                   WHEN ( @MonthDayCount - Day > 0 )
                                   THEN b_tab - ( ( b_tab / 30 )
                                                  * ( @MonthDayCount - Day ) )
                              END
                         ELSE CASE WHEN nafaa = 0 THEN ( 0 )
                                   ELSE ( b_tab )
                              END
                    END 


    UPDATE  #excel
    SET     b_tab = ROUND(b_tab, 0)




--hawafez بدل سكن
    

    UPDATE  #excel
    SET     hawafez = CASE WHEN ( SELECT    ShowIn_Badal_Sakan
                                  FROM      dbo.emp
                                  WHERE     emp_code = #excel.code
                                ) = '0'
                           THEN ( CASE WHEN ( ( SELECT TOP 1
                                                        Badal_Sakan
                                                FROM    #Badalat
                                              ) = 1 )
                                       THEN CASE WHEN nafaa = 0 THEN ( 0 )
                                                 WHEN ( @MonthDayCount - Day = 0 )
                                                 THEN ( hawafez )
                                                 WHEN ( @MonthDayCount - Day > 0 )
                                                 THEN hawafez - ( ( hawafez
                                                              / 30 )
                                                              * ( @MonthDayCount
                                                              - Day ) )
                                            END
                                       ELSE CASE WHEN nafaa = 0 THEN ( 0 )
                                                 ELSE ( hawafez )
                                            END
                                  END )
                           ELSE ( 0 )
                      END
   


    UPDATE  #excel
    SET     hawafez = ROUND(hawafez, 0)

--b_malbas بل ملبس

   

    UPDATE  #excel
    SET     b_malbas = CASE WHEN ( ( SELECT TOP 1
                                            Badal_Other
                                     FROM   #Badalat
                                   ) = 1 )
                            THEN CASE WHEN nafaa = 0 THEN ( 0 )
                                      WHEN ( @MonthDayCount - Day = 0 )
                                      THEN ( b_malbas )
                                      WHEN ( @MonthDayCount - Day > 0 )
                                      THEN b_malbas - ( ( b_malbas / 30 )
                                                        * ( @MonthDayCount
                                                            - Day ) )
                                 END
                            ELSE CASE WHEN nafaa = 0 THEN ( 0 )
                                      ELSE ( b_malbas )
                                 END
                       END 



    UPDATE  #excel
    SET     b_malbas = ROUND(b_malbas, 0)

--b_food بدل موقع

    UPDATE  #excel
    SET     b_food = CASE WHEN ( ( SELECT TOP 1
                                            Badal_Tabe3a
                                   FROM     #Badalat
                                 ) = 1 )
                          THEN CASE WHEN nafaa = 0 THEN ( 0 )
                                    WHEN ( @MonthDayCount - Day = 0 )
                                    THEN ( b_food )
                                    WHEN ( @MonthDayCount - Day > 0 )
                                    THEN b_food - ( ( b_food / 30 )
                                                    * ( @MonthDayCount - Day ) )
                               END
                          ELSE CASE WHEN nafaa = 0 THEN ( 0 )
                                    ELSE ( b_food )
                               END
                     END 

    UPDATE  #excel
    SET     b_food = ROUND(b_food, 0)

--ed_agaza  اضافى

 

 

--بدل انتقال


    UPDATE  #excel
    SET     b_ent = CASE WHEN ( ( SELECT TOP 1
                                            Badal_Entekal
                                  FROM      #Badalat
                                ) = 1 )
                         THEN CASE WHEN nafaa = 0 THEN ( 0 )
                                   WHEN ( @MonthDayCount - Day = 0 )
                                   THEN ( b_ent )
                                   WHEN ( @MonthDayCount - Day > 0 )
                                   THEN b_ent - ( ( b_ent / 30 )
                                                  * ( @MonthDayCount - Day ) )
                              END
                         ELSE CASE WHEN nafaa = 0 THEN ( 0 )
                                   ELSE ( b_ent )
                              END
                    END 


   
    UPDATE  #excel
    SET     b_ent = ROUND(b_ent, 0)


    --UPDATE  #excel
    --SET     b_ent = CASE WHEN nafaa = 0 THEN ( 0 )
    --                     WHEN ( Day < @MonthDayCount )
    --                     THEN ( ( b_ent / 30 ) * Day )
    --                     WHEN ( Day >= @MonthDayCount ) THEN ( b_ent )
    --                END
 
--بدل طعام

 

    UPDATE  #excel
    SET     others3 = CASE WHEN ( ( SELECT TOP 1
                                            Badal_Ta3am
                                    FROM    #Badalat
                                  ) = 1 )
                           THEN CASE WHEN nafaa = 0 THEN ( 0 )
                                     WHEN ( @MonthDayCount - Day = 0 )
                                     THEN ( others3 )
                                     WHEN ( @MonthDayCount - Day > 0 )
                                     THEN others3 - ( ( others3 / 30 )
                                                      * ( @MonthDayCount - Day ) )
                                END
                           ELSE CASE WHEN nafaa = 0 THEN ( 0 )
                                     ELSE ( others3 )
                                END
                      END 

    UPDATE  #excel
    SET     others3 = ROUND(others3, 0)

    --UPDATE  #excel
    --SET     others3 = CASE WHEN nafaa = 0 THEN ( 0 )
    --                       WHEN ( Day < @MonthDayCount )
    --                       THEN ( ( others3 / 30 ) * Day )
    --                       WHEN ( Day >= @MonthDayCount ) THEN ( others3 )
    --                  END
    

--@MonthDayCount


--الحوافز 



    UPDATE  #excel
    SET     takher = ( SELECT   SUM(Hafez.plassval)
                       FROM     dbo.Hafez
                       WHERE    dbo.Hafez.emp_id = #excel.code
                                AND Hafez.plassdate BETWEEN @Fdates AND @Tdates
                       GROUP BY emp_id
                     )
    
	
    UPDATE  #excel
    SET     takher = 0
    WHERE   takher IS NULL 


    UPDATE  #excel

	 -- اجمالى الراتب بعد خصم ايام الغياب
    SET     Tel = CASE WHEN ( @MonthDayCount - Day = 0 )
                       THEN ( oth_sal + m_sal + Salary )
                       WHEN ( @MonthDayCount - Day > 0 )
                       THEN ( oth_sal + m_sal + Salary ) - ( ( @MonthDayCount
                                                              - Day )
                                                             * ( ( oth_sal
                                                              + [m_sal]
                                                              + [Salary] )
                                                              / 30 ) )
                  END
    WHERE   nafaa > 0
            OR daygazaa > 0
            OR other_add > 0
			 

    UPDATE  #excel
    SET     Tel = ROUND(Tel, 0)

 
 -- بدل نسبة 

    UPDATE  #excel
    SET     Take_Percent = Tel * ISNULL(emp.Take_Percent, 0) / 100
    FROM    #excel
            INNER JOIN dbo.emp ON emp.emp_code = #excel.code 

    UPDATE  #excel
    SET     Take_Percent = ROUND(Take_Percent, 0)

    UPDATE  #excel
    SET     tax = 0


    CREATE TABLE #EmpCut
        (
          [code] BIGINT NULL ,
          [date] CHAR(8) COLLATE Arabic_CI_Ai
                         NULL ,
          Cut [NUMERIC](8, 4)
        )
 

    CREATE TABLE #Empabsent
        (
          [code] BIGINT NULL ,
          [date] CHAR(8) COLLATE Arabic_CI_Ai
                         NULL ,
          Cut [NUMERIC](8, 4)
        )

 
    CREATE TABLE #Gaza
        (
          [code] BIGINT NULL ,
          [date] CHAR(8) COLLATE Arabic_CI_Ai
                         NULL ,
          Cut [NUMERIC](8, 4)
        )


    INSERT  INTO #EmpCut
            SELECT  Emp_Code ,
                    dbo.DateVal(YEAR(emp_datecomming), MONTH(emp_datecomming),
                                DAY(emp_datecomming)) ,
                    ( Emp_Time_Late / dayhour ) AS Emp_Time_Late
            FROM    Emp_Comming
                    INNER JOIN CountDayHour ON Emp_Comming.planid = CountDayHour.planID
            WHERE   Emp_Time_Late > 0
                    AND maamorya = 0
                    AND svacation = 0
                    AND vacation = 0
                    AND emp_datecomming BETWEEN @Fdates AND @Tdates 
    INSERT  INTO #Empabsent
            SELECT  Emp_Code ,
                    dbo.DateVal(YEAR(emp_datecomming), MONTH(emp_datecomming),
                                DAY(emp_datecomming)) ,
                    CASE WHEN ( Emp_Comming.ghyab_bezn = 1 )
                         THEN ( ApsentPERM )
                         ELSE ( Apsent )
                    END
            FROM    Emp_Comming
                    INNER JOIN WorkPlanEdite ON WorkPlanEdite.Planid = Emp_Comming.planid
                                                AND WorkPlanEdite.ShiftID = Emp_Comming.ShiftID
            WHERE   Emp_Comming.comming = 0
                    AND vacation = 0
                    AND svacation = 0
                    AND maamorya = 0
                    AND emp_datecomming BETWEEN @Fdates AND @Tdates 
 
    INSERT  INTO #Gaza
            SELECT  emp_id ,
                    dbo.DateVal(YEAR(cut_date), MONTH(cut_date), DAY(cut_date)) ,
                    ISNULL(cut_val, 0) AS cut_val
            FROM    cutting


    CREATE TABLE #EmpCutMonth
        (
          code BIGINT ,
          Gazaval NUMERIC(18, 4) ,
          [absent] NUMERIC(18, 4) ,
          late NUMERIC(18, 4)
        )

    CREATE TABLE #EmpCutMonthFinal
        (
          code BIGINT ,
          Gazaval NUMERIC(18, 4) ,
          [absent] NUMERIC(18, 4) ,
          late NUMERIC(18, 4)
        )

    INSERT  INTO #EmpCutMonth
            SELECT  code ,
                    Cut ,
                    0 ,
                    0
            FROM    #Gaza
            WHERE   code IN ( SELECT    code
                              FROM      #Codes )
                    AND date BETWEEN @Fdates AND @Tdates 
                    


    INSERT  INTO #EmpCutMonth
            SELECT  code ,
                    0 ,
                    Cut ,
                    0
            FROM    #Empabsent
            WHERE   code IN ( SELECT    code
                              FROM      #Codes )
                    AND date BETWEEN @Fdates AND @Tdates 
                  



    INSERT  INTO #EmpCutMonth
            SELECT  code ,
                    0 ,
                    0 ,
                    Cut
            FROM    #EmpCut
            WHERE   code IN ( SELECT    code
                              FROM      #Codes )
                    AND date BETWEEN @Fdates AND @Tdates 
                   


    INSERT  INTO #EmpCutMonthFinal
            SELECT  code ,
                    SUM(Gazaval) ,
                    SUM(absent) ,
                    SUM(late)
            FROM    #EmpCutMonth
            GROUP BY code 


  -- جزاء الغياب صفر لان مش هاينفع نحسبه هنا مين الغياب ال باذن وال من غير اذن
    IF @gettingdaycount = 1
        BEGIN

            UPDATE  #EmpCutMonthFinal
            SET     #EmpCutMonthFinal.absent = 0

        END





--select * from WorkPlanEdite
--select * from CountDayHour
--select * from cutting


	--حساب الخصومات
    UPDATE  #excel
    SET     gaza = Gazaval
    FROM    #excel
            INNER JOIN #EmpCutMonthFinal ON #excel.code = #EmpCutMonthFinal.code
            
--حساب الفيابات


--[Salary]  بدل ثابت

--b_ent  بدل انتقال
--others3 بدل طعام
--b_tab بدل تليفون
--hawafez بدل سكن
--b_malbas بل ملبس
--b_food بدل موقع
--ed_agaza  اضافى
--oth_sal   متغير .



    UPDATE  #excel
    SET     moneygyab = CASE WHEN nafaa > 0
                             THEN ( [absent] * ( ( [Salary] + [m_sal]
                                                   + [oth_sal] )
                                                 / CountDayHour.daymonth ) )
                             ELSE ( 0 )
                        END
    FROM    #excel
            INNER JOIN #EmpCutMonthFinal ON #excel.code = #EmpCutMonthFinal.code
            INNER JOIN CountDayHour ON CountDayHour.planID = #excel.planid
 



 --حساب التاخير
    UPDATE  #excel
    SET     moneytakher = ( [late] * ( ( [Salary] + [m_sal] + [oth_sal] )
                                       / CountDayHour.daymonth ) )
    FROM    #excel
            INNER JOIN #EmpCutMonthFinal ON #excel.code = #EmpCutMonthFinal.code
            INNER JOIN CountDayHour ON CountDayHour.planID = #excel.planid





    --UPDATE  #excel
    --SET     gaza = Gazaval + ( [absent] * ( ( [Salary] + [b_tab] + [m_sal]
    --                                          + [b_ent] + [b_malbas]
    --                                          + [b_food] )
    --                                        / CountDayHour.daymonth ) )
    --        + ( ( [late] ) * ( ( [Salary] + [m_sal] + [b_tab] + [b_ent]
    --                             + [b_malbas] + [b_food] )
    --                           / CountDayHour.daymonth ) )


    --FROM    #excel
    --        INNER JOIN #EmpCutMonthFinal ON #excel.code = #EmpCutMonthFinal.code
    --        INNER JOIN CountDayHour ON CountDayHour.planID = #excel.planid







	-- التأمينات





    UPDATE  #excel
    SET     [w_a_ins] = CASE WHEN ( Badal_Sakan ) = 1
                             THEN ( ( EmpTamen.ComFix * ( #excel.m_sal
                                                          + hawafez ) ) / 100 )
                             ELSE ( ( EmpTamen.EmpFix * #excel.m_sal ) / 100 )
                        END ,
            [w_d_ins] = CASE WHEN ( Badal_Sakan ) = 1
                             THEN ( ( EmpTamen.ComChanged * ( #excel.oth_sal
                                                              + hawafez ) )
                                    / 100 )
                             ELSE ( ( EmpTamen.ComChanged * #excel.oth_sal )
                                    / 100 )
                        END ,
            ins = CASE WHEN ( Badal_Sakan ) = 1
                       THEN ( ( ( EmpTamen.EmpFix * ( #excel.m_sal + hawafez ) )
                                / 100 ) + ( ( EmpTamen.EmpChanged
                                            * ( #excel.oth_sal + hawafez )
                                            / 100 ) ) )
                       ELSE ( ( ( EmpTamen.EmpFix * #excel.m_sal ) / 100 )
                              + ( ( EmpTamen.EmpChanged * #excel.oth_sal )
                                  / 100 ) )
                  END
    FROM    #excel
            INNER JOIN EmpTamen ON #excel.NationalityID = EmpTamen.ID 
   


   UPDATE  #excel
    SET     [w_a_ins] = ROUND([w_a_ins], 0)

   UPDATE  #excel
    SET     [w_d_ins] = ROUND([w_d_ins], 0)

    UPDATE  #excel
    SET     ins = ROUND(ins, 0)




   --حساب الاضافى


    --CREATE TABLE #overtime
    --    (
    --      code BIGINT ,
    --      overval NUMERIC(18, 2)
    --    )
    --INSERT  INTO #overtime
    --        SELECT  emp_id ,
    --                SUM(emp_edafy.addvalue)
    --        FROM    emp_edafy
    --        WHERE   dbo.DateVal(YEAR(emp_edafy.edafy_date), MONTH(edafy_date),
    --                            DAY(edafy_date)) >= @Fdates
    --                AND dbo.DateVal(YEAR(emp_edafy.edafy_date),
    --                                MONTH(edafy_date), DAY(edafy_date)) <= @Tdates
    --        GROUP BY emp_id




    UPDATE  #excel
    SET     #excel.ed_agaza = ( SELECT  ISNULL(SUM(emp_edafy.addvalue), 0.00) AS Expr1
                                FROM    emp_edafy
                                WHERE   emp_edafy.edafy_date BETWEEN @Fdates AND @Tdates
                                        AND emp_id = code
                              )
 
    UPDATE  #excel
    SET     ed_agaza = [ed_agaza] * ( ( [Salary] + [m_sal] + [oth_sal] )
                                      / ( CountDayHour.daymonth
                                          * CountDayHour.dayhour ) )
    FROM    #excel
            INNER JOIN CountDayHour ON CountDayHour.planID = #excel.planid


    UPDATE  #excel
    SET     ed_agaza = ROUND(ed_agaza, 0)








--اجمالى المستحقات الراتب
    --UPDATE  #excel
    --SET     totalm = oth_sal + others3 + hawafez + [Salary] + [m_sal]
    --        + [b_ent] + [b_tab] + [b_malbas] + [b_food] 

	
    UPDATE  #excel
    SET     totalm = Tel + b_food + ed_agaza + b_tab + hawafez + b_malbas
            + others3 + b_ent + takher + Take_Percent + Take_Schole


    CREATE TABLE #solaf
        (
          code BIGINT ,
          val NUMERIC(18, 2)
        )
    INSERT  INTO #solaf
            SELECT  empcode ,
                    solafpercent
            FROM    solafaccount
            WHERE   id IN ( SELECT  MAX(id)
                            FROM    solafaccount
                            GROUP BY empcode )


-- سلفه 


    UPDATE  #excel
    SET     #excel.solfa_cut = CASE WHEN ( SELECT   SUM(maden) - SUM(daen)
                                           FROM     dbo.Emp_Account
                                           WHERE    venderid = #excel.code
                                                    AND CaseID = 16
                                                    AND year = @year
                                         ) > #solaf.val THEN ( #solaf.val )
                                    ELSE ( CASE WHEN ( SELECT SUM(maden)
                                                              - SUM(daen)
                                                       FROM   dbo.Emp_Account
                                                       WHERE  venderid = #excel.code
                                                              AND CaseID = 16
                                                              AND year = @year
                                                     ) < 0 THEN ( 0 )
                                                ELSE ( SELECT SUM(maden)
                                                              - SUM(daen)
                                                       FROM   dbo.Emp_Account
                                                       WHERE  venderid = #excel.code
                                                              AND CaseID = 16
                                                              AND year = @year
                                                     )
                                           END )
                               END
    FROM    #excel
            INNER JOIN #solaf ON #excel.code = #solaf.code
 



    UPDATE  #excel
    SET     [year] = @year ,
            [month] = @month


    UPDATE  #excel
    SET     totalkh = ISNULL(moneytakher, 0) + ISNULL(solfa_cut, 0)
            + ISNULL(moneygyab, 0) + ISNULL(gaza, 0) + 0 + ISNULL(ins, 0) + 0
            + 0 + 0 + CASE WHEN ( tax < 0 ) THEN 0
                           ELSE ISNULL(tax, 0)
                      END 



    UPDATE  #excel
    SET     safy = ( ROUND(totalm, 0) ) - ( ROUND(totalkh, 0) )




	


    UPDATE  #excel
    SET     tax = 0
    WHERE   tax < 0


    UPDATE  #excel
    SET     nafaa = 0
    WHERE   nafaa < 0





    SELECT  *
    FROM    #excel
    ORDER BY code


