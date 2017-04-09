
ALTER   PROCEDURE [dbo].[Sallery_Cost_Jobs]
    @FromDate DATE ,
    @ToDate DATE ,
    @GroupID INT ,
    @Lang CHAR(3) = 'AR'
AS
    BEGIN
	 
        CREATE TABLE #Result
            (
              CostID BIGINT ,
              Cost_Name NVARCHAR(MAX)  COLLATE Arabic_CI_AS,
              Job_ID INT ,
              Job_Name NVARCHAR(50) COLLATE Arabic_CI_AS ,
              Amount FLOAT ,
              CostGroup_ID INT ,
              Cost_Group NVARCHAR(MAX) COLLATE Arabic_CI_AS
            );

    

        CREATE TABLE #Costs
            (
              CostID BIGINT ,
              CostName NVARCHAR(MAX) COLLATE Arabic_CI_AS ,
              CostGroup_ID BIGINT ,
              Cost_Group NVARCHAR(MAX) COLLATE Arabic_CI_AS
            );



        CREATE TABLE #Title
            (
              Job_ID BIGINT ,
              Job_Name NVARCHAR(50) COLLATE Arabic_CI_AS
            );


			 
        INSERT  INTO #Title
                ( Job_ID, Job_Name )
                SELECT  jobid ,
                        jname
                FROM    dbo.jobs; 





        INSERT  INTO #Costs
                ( CostID ,
                  CostName ,
                  CostGroup_ID ,
                  Cost_Group
                )
                SELECT  TblCostTree.AccCode ,
                        TblCostTree.AccName ,
                        TblCostTree.ClassificationId ,
                        CostGroups.ClassificationName
                FROM    TblCostTree
                        LEFT OUTER JOIN CostGroups ON TblCostTree.ClassificationId = CostGroups.ClassificationId
                WHERE   AccCode IN ( SELECT DISTINCT
                                            costid
                                     FROM  dbo.Emp_Comming WHERE emp_datecomming BETWEEN @FromDate AND @ToDate )
                        AND ISmain = 0
                        AND ( @GroupID = 0
                              OR TblCostTree.ClassificationId = @GroupID
                            );

				 


      

     

        INSERT  INTO #Result
                ( CostID ,
                  Cost_Name ,
                  Job_ID ,
                  Job_Name ,
                  Amount ,
                  CostGroup_ID ,
                  Cost_Group
	            )
                SELECT  #Costs.CostID ,
                        #Costs.CostName ,
                        #Title.Job_ID ,
                        #Title.Job_Name ,
                        0 ,
                        CostGroup_ID ,
                        Cost_Group
                FROM    #Costs
                        CROSS JOIN #Title;
                      


					  




        BEGIN
 
            CREATE TABLE #Render
                (
                  [code] BIGINT NOT NULL ,
                  [name] NVARCHAR(100) COLLATE Arabic_CI_AS
                                       NOT NULL ,
                  [jopID] BIGINT NULL ,
                  [brnchs] NVARCHAR(100) COLLATE Arabic_CI_AS
                                         NULL ,
                  [ksm] NVARCHAR(100) COLLATE Arabic_CI_AS
                                      NULL ,
                  [oth_sal] [NUMERIC](18, 2) NULL ,
                  [others3] [NUMERIC](18, 2) NULL ,
                  [hawafez] [NUMERIC](18, 2) NULL ,
                  [Salary] [NUMERIC](18, 2) NULL ,
                  [m_sal] [NUMERIC](18, 2) NULL ,
                  [b_ent] [NUMERIC](18, 2) NULL ,
                  [b_tab] [NUMERIC](18, 2) NULL ,
                  [b_malbas] [NUMERIC](18, 2) NULL ,
                  [b_food] [NUMERIC](18, 2) NULL ,
                  [totalm] [NUMERIC](13, 2) NULL ,
                  [takher] [DECIMAL](18, 2) NULL ,
                  [solfa_cut] [DECIMAL](18, 2) NULL ,
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
                  [compcode] [NVARCHAR](25) NULL ,
                  [compName] [NVARCHAR](200) NULL ,
                  [houraddagaza] [NUMERIC](18, 2) NULL ,
                  [daygazaa] [NUMERIC](18, 2) NULL ,
                  [daytakher] [NUMERIC](18, 2) NULL ,
                  [daygyab] [NUMERIC](18, 2) NULL ,
                  [moneygazaa] [NUMERIC](18, 2) NULL ,
                  [moneytakher] [NUMERIC](18, 2) NULL ,
                  [moneygyab] [NUMERIC](18, 2) NULL ,
                  [planid] [INT] NULL ,
                  [NationalityID] [INT] NULL ,
                  [ed_agaza] [NUMERIC](18, 2) NULL ,-- «·«÷«›Ï
                  [ed_sahar] [NUMERIC](18, 2) NULL ,
                  [other_add] [NUMERIC](18, 2) NULL ,
                  [elawa] [NUMERIC](18, 2) NULL ,
                  [mobile] [NUMERIC](18, 2) NULL ,
                  [Tel] [NUMERIC](18, 2) NULL ,
                  [nafaa] [NUMERIC](18, 2) NULL ,
                  [SalaryType] [NVARCHAR](50) NULL ,
                  AccCode BIGINT NULL ,
                  AccName [NVARCHAR](50) NULL ,
                  ShortCode [NVARCHAR](50) NULL ,
                  [Take_Schole] [NUMERIC](18, 2) NULL ,
                  [Take_Percent] FLOAT NULL ,
                  BarCode [NVARCHAR](50) NULL ,
                  Nationality [NVARCHAR](50) COLLATE Arabic_CI_AS
                                             NULL ,
                  Emp_Time_Extra FLOAT -- ⁄œœ ”«⁄«  «·«÷«›Ï,
                  ,
                  Kafeel NVARCHAR(100) ,
                  WorkPlan NVARCHAR(100)
                )
            ON  [PRIMARY];

            INSERT  INTO #Render
                    SELECT  SalaryReport.code ,
                            SalaryReport.name ,
                            dbo.emp.jobid ,
                            SalaryReport.brnchs ,
                            CASE WHEN ( @Lang = 'AR' )
                                 THEN ( SalaryReport.ksm )
                                 ELSE ( SalaryReport.Depart_EnglishName )
                            END AS ksm ,
                            SalaryReport.oth_sal ,
                            SalaryReport.others3 ,--ÿ⁄«„
                            SalaryReport.hawafez ,-- »œ· ”ﬂ‰
                            SalaryReport.Salary ,
                            SalaryReport.m_sal ,
                            SalaryReport.b_ent ,--«‰ ﬁ«·
                            SalaryReport.b_tab ,--»œ·  ·Ì›Ê‰
                            SalaryReport.b_malbas ,--»œ·«  «Œ—Ï
                            SalaryReport.b_food ,-- »œ· „Êﬁ⁄
                            SalaryReport.totalm ,--«Ã„«·Ï «·„” Õﬁ«  «·—« » Ê«·»œ·«  Õ”» «Ì«„ «·œÊ«„
                            SalaryReport.takher ,--«·ÕÊ«›“
                            ISNULL(SalaryReport.solfa_cut, 0) AS solfa_cut ,
                            SalaryReport.gyab ,
                            SalaryReport.gaza ,
                            SalaryReport.ins ,
                            SalaryReport.tax ,
                            SalaryReport.totalkh ,
                            SalaryReport.safy ,
                            SalaryReport.brnchid ,
                            SalaryReport.ksmid ,
                            SalaryReport.month ,
                            SalaryReport.year ,
                            SalaryReport.Day ,
                            SalaryReport.a_ins ,
                            SalaryReport.d_ins ,
                            SalaryReport.w_a_ins ,
                            SalaryReport.w_d_ins ,
                            SalaryReport.accno ,
                            SalaryReport.compcode ,
                            SalaryReport.compName ,
                            SalaryReport.houraddagaza ,--«·«Ã«“… «·—”„Ì…
                            SalaryReport.daygazaa ,--«·«Ã«“…
                            SalaryReport.daytakher ,
                            SalaryReport.daygyab ,
                            SalaryReport.moneygazaa ,
                            SalaryReport.moneytakher ,
                            SalaryReport.moneygyab ,
                            SalaryReport.planid ,
                            SalaryReport.NationalityID ,
                            0 AS Extra_Hours_Values , --«·«÷«›Ï
                            ROUND(SalaryReport.ed_sahar / 30, 0) , -- Õ”«» „Ã„Ê⁄ «·—« » «·«”«”Ï
                            SalaryReport.other_add ,-- «·„√„Ê—Ì« 
                            ROUND(SalaryReport.elawa / 30, 0) ,-- „Ã„Ê⁄ «·»œ·« 
                            ROUND(SalaryReport.mobile / 30, 0) , -- «Ã„«·Ï «·—« » „⁄ «·»œ·« 
                            ROUND(( SalaryReport.ed_sahar / 30 )
                                  * COUNT(SalaryReport.nafaa), 0) ,  --  «·—« » «·«”«”Ï Õ”» «Ì«„ «·œÊ«„
                            COUNT(SalaryReport.nafaa) AS nafaa ,
                            0 AS SalaryType ,
                            TblCostTree.AccCode ,
                            CASE WHEN ( @Lang = 'AR' )
                                 THEN ( TblCostTree.AccName )
                                 ELSE ( TblCostTree.AccName_EN )
                            END ,
                            TblCostTree.ShortCode ,
                            SalaryReport.Take_Schole ,--»œ· „œ«—”
                            0 AS Take_Percent ,--»œ· ‰”»…
                            SalaryReport.BarCode ,
                            SalaryReport.Nationality ,
                            0 AS Emp_Time_Extra ,
                            SalaryReport.Kafeel ,
                            SalaryReport.WorkPlan
                    FROM    SalaryReport
                            INNER JOIN Emp_Comming ON SalaryReport.code = Emp_Comming.Emp_Code
                            LEFT JOIN TblCostTree ON Emp_Comming.CostID = TblCostTree.AccCode
                            INNER JOIN emp ON emp.emp_code = SalaryReport.code
                    WHERE   ( Emp_Comming.comming = 1 )
                            AND DATEPART(MONTH,
                                         dbo.Emp_Comming.emp_datecomming) = dbo.SalaryReport.month
                            AND DATEPART(YEAR, dbo.Emp_Comming.emp_datecomming) = dbo.SalaryReport.year
                            AND emp_datecomming >= emp.StatusDate
                    GROUP BY SalaryReport.code ,
                            SalaryReport.name ,
                            dbo.emp.jobid ,
                            SalaryReport.brnchs ,
                            SalaryReport.ksm ,
                            SalaryReport.oth_sal ,
                            SalaryReport.others3 ,
                            SalaryReport.hawafez ,
                            SalaryReport.Salary ,
                            SalaryReport.m_sal ,
                            SalaryReport.b_ent ,
                            SalaryReport.b_tab ,
                            SalaryReport.b_malbas ,
                            SalaryReport.b_food ,
                            SalaryReport.totalm ,
                            SalaryReport.takher ,
                            SalaryReport.solfa_cut ,
                            SalaryReport.gyab ,
                            SalaryReport.gaza ,
                            SalaryReport.ins ,
                            SalaryReport.tax ,
                            SalaryReport.totalkh ,
                            SalaryReport.safy ,
                            SalaryReport.brnchid ,
                            SalaryReport.ksmid ,
                            SalaryReport.month ,
                            SalaryReport.year ,
                            SalaryReport.Day ,
                            SalaryReport.a_ins ,
                            SalaryReport.d_ins ,
                            SalaryReport.w_a_ins ,
                            SalaryReport.w_d_ins ,
                            SalaryReport.accno ,
                            SalaryReport.compcode ,
                            SalaryReport.compName ,
                            SalaryReport.houraddagaza ,
                            SalaryReport.daygazaa ,
                            SalaryReport.daytakher ,
                            SalaryReport.daygyab ,
                            SalaryReport.moneygazaa ,
                            SalaryReport.moneytakher ,
                            SalaryReport.moneygyab ,
                            SalaryReport.planid ,
                            SalaryReport.NationalityID ,
                            SalaryReport.ed_agaza ,
                            SalaryReport.ed_sahar ,
                            SalaryReport.other_add ,
                            SalaryReport.elawa ,
                            SalaryReport.mobile ,
                            SalaryReport.Tel ,
                            TblCostTree.AccCode ,
                            TblCostTree.AccName ,
                            TblCostTree.ShortCode ,
                            SalaryReport.Take_Schole ,
                            SalaryReport.Take_Percent ,
                            SalaryReport.BarCode ,
                            SalaryReport.Nationality ,
                            SalaryReport.Kafeel ,
                            Depart_EnglishName ,
                            TblCostTree.AccName_EN ,
                            SalaryReport.WorkPlan
                    HAVING  SalaryReport.month BETWEEN DATEPART(MONTH,
                                                              @FromDate)
                                               AND     DATEPART(MONTH, @ToDate)
                            AND SalaryReport.year BETWEEN DATEPART(YEAR,
                                                              @FromDate)
                                                  AND     DATEPART(YEAR,
                                                              @ToDate)
                    ORDER BY SalaryReport.code;
        END;

 
   


--Œ’„ «Ì«„ «·«Ã«“«  „‰ «·«Ì«„ «·„” Õﬁ… ·÷»ÿ  Ê“Ì⁄ «·—Ê« » ⁄·Ï «Ì«„ «·⁄„· «·›⁄·Ì…
        UPDATE  #Render
        SET     #Render.Day = #Render.Day - ( houraddagaza + daygazaa
                                              + other_add );
-------------------------------------------------------------------------------
        UPDATE  #Render
        SET     #Render.Day = CASE WHEN #Render.Day = 0 THEN ( 1 )
                                   ELSE ( #Render.Day )
                              END;




    --»œ· ÿ⁄«„
							 
        UPDATE  #Render
        SET     #Render.others3 = ROUND(#Render.others3 / #Render.Day
                                        * #Render.nafaa, 0);
										 

	--»œ· ”ﬂ‰
 
        UPDATE  #Render
        SET     #Render.hawafez = ROUND(#Render.hawafez / #Render.Day
                                        * #Render.nafaa, 0);


	 --«‰ ﬁ«·

        UPDATE  #Render
        SET     #Render.b_ent = ROUND(#Render.b_ent / #Render.Day
                                      * #Render.nafaa, 0);


	--»œ·  ·Ì›Ê‰
	
        UPDATE  #Render
        SET     #Render.b_tab = ROUND(#Render.b_tab / #Render.Day
                                      * #Render.nafaa, 0);
	--»œ·«  «Œ—Ï
  
        UPDATE  #Render
        SET     #Render.b_malbas = ROUND(#Render.b_malbas / #Render.Day
                                         * #Render.nafaa, 0);

	-- »œ· „Êﬁ⁄
  
        UPDATE  #Render
        SET     #Render.b_food = ROUND(#Render.b_food / #Render.Day
                                       * #Render.nafaa, 0);

    --»œ· „œ«—”
        UPDATE  #Render
        SET     #Render.Take_Schole = ROUND(#Render.Take_Schole / #Render.Day
                                            * #Render.nafaa, 0);


	----»œ· ‰”»…

    
  
        UPDATE  #Render
        SET     #Render.Take_Percent = ( SELECT SUM(ISNULL(Emp_Comming.Take_Percent,
                                                           0))
                                         FROM   dbo.Emp_Comming
                                         WHERE  dbo.Emp_Comming.CostID = #Render.AccCode
                                                AND Emp_Comming.Emp_Code = #Render.code
                                                AND DATEPART(MONTH,
                                                             emp_datecomming) BETWEEN DATEPART(MONTH,
                                                              @FromDate)
                                                              AND
                                                              DATEPART(MONTH,
                                                              @ToDate)
                                                AND DATEPART(YEAR,
                                                             emp_datecomming) BETWEEN DATEPART(YEAR,
                                                              @FromDate)
                                                              AND
                                                              DATEPART(YEAR,
                                                              @ToDate)
                                                AND Emp_Comming.comming = 1
                                                AND svacation = 0
                                       );


        UPDATE  #Render
        SET     #Render.Take_Percent = ROUND(Take_Percent, 0);


	 --«·«÷«›Ï

        UPDATE  #Render
        SET     #Render.ed_agaza = ( SELECT SUM(ISNULL(Emp_Comming.Extra_Hours_Values,
                                                       0))
                                     FROM   dbo.Emp_Comming
                                     WHERE  dbo.Emp_Comming.CostID = #Render.AccCode
                                            AND Emp_Comming.Emp_Code = #Render.code
                                            AND DATEPART(MONTH,
                                                         emp_datecomming) BETWEEN DATEPART(MONTH,
                                                              @FromDate)
                                                              AND
                                                              DATEPART(MONTH,
                                                              @ToDate)
                                            AND DATEPART(YEAR, emp_datecomming) BETWEEN DATEPART(YEAR,
                                                              @FromDate)
                                                              AND
                                                              DATEPART(YEAR,
                                                              @ToDate)
                                            AND Emp_Comming.comming = 1
                                            AND svacation = 0
                                   );


        UPDATE  #Render
        SET     #Render.ed_agaza = ROUND(ed_agaza, 0);




        UPDATE  #Render
        SET     #Render.Emp_Time_Extra = ( SELECT   SUM(ISNULL(Emp_Comming.Emp_Time_Extra,
                                                              0))
                                           FROM     dbo.Emp_Comming
                                           WHERE    dbo.Emp_Comming.CostID = #Render.AccCode
                                                    AND Emp_Comming.Emp_Code = #Render.code
                                                    AND DATEPART(MONTH,
                                                              emp_datecomming) BETWEEN DATEPART(MONTH,
                                                              @FromDate)
                                                              AND
                                                              DATEPART(MONTH,
                                                              @ToDate)
                                                    AND DATEPART(YEAR,
                                                              emp_datecomming) BETWEEN DATEPART(YEAR,
                                                              @FromDate)
                                                              AND
                                                              DATEPART(YEAR,
                                                              @ToDate)
                                                    AND Emp_Comming.comming = 1
                                                    AND svacation = 0
                                         );



     

	 --«·ÕÊ«›“
        UPDATE  #Render
        SET     #Render.takher = ROUND(( #Render.takher / #Render.Day )
                                       * #Render.nafaa, 0);
---------------------------------------------------------------------------------------------------

--«·Œ’Ê„« 

	 --«·”·›…
        UPDATE  #Render
        SET     #Render.solfa_cut = ROUND(( #Render.solfa_cut / #Render.Day )
                                          * #Render.nafaa, 0);



   --«·Ã“«¡« 

        UPDATE  #Render
        SET     #Render.gaza = ROUND(( #Render.gaza / #Render.Day )
                                     * #Render.nafaa, 0); 

   --«· «„Ì‰« 

        UPDATE  #Render
        SET     #Render.ins = ROUND(( #Render.ins / #Render.Day )
                                    * #Render.nafaa, 0);

	 --Œ’„ «· «ŒÌ—
        UPDATE  #Render
        SET     #Render.moneytakher = ROUND(( #Render.moneytakher
                                              / #Render.Day ) * #Render.nafaa,
                                            0);

	 --Œ’„ €Ì«» 
        UPDATE  #Render
        SET     #Render.moneygyab = ROUND(( #Render.moneygyab / #Render.Day )
                                          * #Render.nafaa, 0);


 ----------------------------------------------------------------------------------------------------

		--«Ã„«·Ï «·—« » Õ”» «Ì«„ «·œÊ«„
        UPDATE  #Render
        SET     #Render.Tel = ROUND(( SalaryReport.Tel / #Render.Day )
                                    * #Render.nafaa, 0)
        FROM    #Render
                INNER JOIN dbo.SalaryReport ON SalaryReport.code = #Render.code
        WHERE   #Render.month = dbo.SalaryReport.month
                AND #Render.year = dbo.SalaryReport.year; 
			 
  
	   --«Ã„«·Ï «·—« » »«·»œ·« 
	
        UPDATE  #Render
        SET     totalm = ISNULL(Tel, 0) + ISNULL(b_food, 0) + ISNULL(ed_agaza,
                                                              0)
                + ISNULL(b_tab, 0) + ISNULL(hawafez, 0) + ISNULL(b_malbas, 0)
                + ISNULL(others3, 0) + ISNULL(b_ent, 0) + ISNULL(takher, 0)
                + ISNULL(Take_Percent, 0) + ISNULL(Take_Schole, 0);

        UPDATE  #Render
        SET     totalm = ROUND(totalm, 0);



	 --«Ã„«·Ï «·Œ’„
  
        UPDATE  #Render
        SET     totalkh = ISNULL(moneytakher, 0) + ISNULL(solfa_cut, 0)
                + ISNULL(moneygyab, 0) + ISNULL(gaza, 0) + ISNULL(ins, 0)
                + CASE WHEN ( tax < 0 ) THEN 0
                       ELSE ISNULL(tax, 0)
                  END; 

        UPDATE  #Render
        SET     totalkh = ROUND(totalkh, 0);




			--«·’«›Ï
        UPDATE  #Render
        SET     #Render.safy = #Render.totalm - #Render.totalkh;



		 




        UPDATE  #Result
        SET     Amount = ( SELECT   SUM(safy)
                           FROM     #Render
                                    WHERE  CostID = #Render.AccCode
                                                          AND Job_ID = #Render.jopID
														  
                         );
                                    
                   

	 
        SELECT  *
        FROM    #Result; 

	




    END;

