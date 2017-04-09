
 

ALTER PROCEDURE [dbo].[_Select_Sallery_Costs]
    @code CHAR(20) = '0' ,
    @code1 CHAR(20) = '999999999' ,
    @FPlan CHAR(20) = '0' ,
    @TPlan CHAR(20) = '999' ,
    @Fdepart CHAR(20) = '0' ,
    @Tdepart CHAR(20) = '999' ,
    @Fcomp CHAR(20) = '0' ,
    @Tcomp CHAR(20) = '999' ,
    @FBranch CHAR(20) = '0' ,
    @TBranch CHAR(20) = '999' ,
    @FBank NVARCHAR(100) ,
    @month AS INT ,
    @year AS INT ,
    @Lang CHAR(3) = 'AR'
AS
    BEGIN
 
        CREATE TABLE #Render
            (
              [code] BIGINT NOT NULL ,
              [name] NVARCHAR(100) COLLATE Arabic_CI_AS
                                   NOT NULL ,
              [jop] NVARCHAR(100) COLLATE Arabic_CI_AS
                                  NOT NULL ,
              [brnchs] NVARCHAR(100) COLLATE Arabic_CI_AS
                                     NOT NULL ,
              [ksm] NVARCHAR(100) COLLATE Arabic_CI_AS
                                  NULL ,
              [oth_sal] [NUMERIC](18, 2) NOT NULL ,
              [others3] [NUMERIC](18, 2) NULL ,
              [hawafez] [NUMERIC](18, 2) NULL ,
              [Salary] [NUMERIC](18, 2) NOT NULL ,
              [m_sal] [NUMERIC](18, 2) NOT NULL ,
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
              [ed_agaza] [NUMERIC](18, 2) NULL ,-- ÇáÇÖÇÝì
              [ed_sahar] [NUMERIC](18, 2) NULL ,
              [other_add] [NUMERIC](18, 2) NULL ,
              [elawa] [NUMERIC](18, 2) NULL ,
              [mobile] [NUMERIC](18, 2) NULL ,
              [Tel] [NUMERIC](18, 2) NULL ,
              [nafaa] [NUMERIC](18, 2) NULL ,
              [SalaryType] [NVARCHAR](50) NOT NULL ,
              AccCode BIGINT NULL ,
              AccName [NVARCHAR](50) NULL ,
              ShortCode [NVARCHAR](50) NULL ,
              [Take_Schole] [NUMERIC](18, 2) NULL ,
              [Take_Percent] FLOAT NULL ,
              BarCode [NVARCHAR](50) NOT NULL ,
              Nationality [NVARCHAR](50) COLLATE Arabic_CI_AS
                                         NOT NULL ,
              Emp_Time_Extra FLOAT -- ÚÏÏ ÓÇÚÇÊ ÇáÇÖÇÝì,
              ,
              Kafeel NVARCHAR(100) ,
              WorkPlan NVARCHAR(100)
            )
        ON  [PRIMARY]

        INSERT  INTO #Render
                SELECT  SalaryReport.code ,
                        SalaryReport.name ,
                        SalaryReport.jop ,
                        SalaryReport.brnchs ,
						CASE WHEN (@Lang ='AR')THEN (SalaryReport.ksm) ELSE (SalaryReport.Depart_EnglishName)  END AS ksm
                         ,
                        SalaryReport.oth_sal ,
                        SalaryReport.others3 ,--ØÚÇã
                        SalaryReport.hawafez ,-- ÈÏá Óßä
                        SalaryReport.Salary ,
                        SalaryReport.m_sal ,
                        SalaryReport.b_ent ,--ÇäÊÞÇá
                        SalaryReport.b_tab ,--ÈÏá ÊáíÝæä
                        SalaryReport.b_malbas ,--ÈÏáÇÊ ÇÎÑì
                        SalaryReport.b_food ,-- ÈÏá ãæÞÚ
                        SalaryReport.totalm ,--ÇÌãÇáì ÇáãÓÊÍÞÇÊ ÇáÑÇÊÈ æÇáÈÏáÇÊ ÍÓÈ ÇíÇã ÇáÏæÇã
                        SalaryReport.takher ,--ÇáÍæÇÝÒ
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
                        SalaryReport.houraddagaza ,--ÇáÇÌÇÒÉ ÇáÑÓãíÉ
                        SalaryReport.daygazaa ,--ÇáÇÌÇÒÉ
                        SalaryReport.daytakher ,
                        SalaryReport.daygyab ,
                        SalaryReport.moneygazaa ,
                        SalaryReport.moneytakher ,
                        SalaryReport.moneygyab ,
                        SalaryReport.planid ,
                        SalaryReport.NationalityID ,
                        0 AS Extra_Hours_Values , --ÇáÇÖÇÝì
                        ROUND(SalaryReport.ed_sahar / 30, 0) , -- ÍÓÇÈ ãÌãæÚ ÇáÑÇÊÈ ÇáÇÓÇÓì
                        SalaryReport.other_add ,-- ÇáãÃãæÑíÇÊ
                        ROUND(SalaryReport.elawa / 30, 0) ,-- ãÌãæÚ ÇáÈÏáÇÊ
                        ROUND(SalaryReport.mobile / 30, 0) , -- ÇÌãÇáì ÇáÑÇÊÈ ãÚ ÇáÈÏáÇÊ
                        ROUND(( SalaryReport.ed_sahar / 30 )
                              * COUNT(SalaryReport.nafaa), 0) ,  --  ÇáÑÇÊÈ ÇáÇÓÇÓì ÍÓÈ ÇíÇã ÇáÏæÇã
                        COUNT(SalaryReport.nafaa) AS nafaa ,
                         0 AS SalaryType ,
                        TblCostTree.AccCode ,
						CASE WHEN (@Lang ='AR')THEN ( TblCostTree.AccName ) ELSE ( TblCostTree.AccName_EN ) END 
                       ,
                        TblCostTree.ShortCode ,
                        SalaryReport.Take_Schole ,--ÈÏá ãÏÇÑÓ
                        0 AS Take_Percent ,--ÈÏá äÓÈÉ
                        SalaryReport.BarCode ,
                        SalaryReport.Nationality ,
                        0 AS Emp_Time_Extra ,
                        SalaryReport.Kafeel ,
                        SalaryReport.WorkPlan
                FROM    SalaryReport
                        INNER JOIN Emp_Comming ON SalaryReport.code = Emp_Comming.Emp_Code
                        INNER JOIN TblCostTree ON Emp_Comming.CostID = TblCostTree.AccCode
                        inner join emp on emp.emp_code = SalaryReport.code 
                WHERE   ( Emp_Comming.comming = 1 )
                        AND DATEPART(MONTH, dbo.Emp_Comming.emp_datecomming) = dbo.SalaryReport.month
                        AND DATEPART(YEAR, dbo.Emp_Comming.emp_datecomming) = dbo.SalaryReport.year
                         AND emp_datecomming >= emp.StatusDate
                GROUP BY SalaryReport.code ,
                        SalaryReport.name ,
                        SalaryReport.jop ,
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
                        SalaryReport.Kafeel ,Depart_EnglishName,TblCostTree.AccName_EN,
                        SalaryReport.WorkPlan
                HAVING  ( SalaryReport.brnchid >= @FBranch )
                        AND ( SalaryReport.brnchid <= @TBranch )
                        AND ( SalaryReport.planid >= @FPlan )
                        AND ( SalaryReport.planid <= @TPlan )
                        AND ( SalaryReport.ksmid >= @Fdepart )
                        AND ( SalaryReport.ksmid <= @Tdepart )
                        AND ( SalaryReport.month = @month )
                        AND ( SalaryReport.month <= @month )
                        AND ( SalaryReport.year >= @year )
                        AND ( SalaryReport.year <= @year )
                        AND ( SalaryReport.code >= CAST(@code AS INT) )
                        AND ( SalaryReport.code <= CAST(@code1 AS INT) )
                ORDER BY SalaryReport.code
    END

 
   


--ÎÕã ÇíÇã ÇáÇÌÇÒÇÊ ãä ÇáÇíÇã ÇáãÓÊÍÞÉ áÖÈØ ÊæÒíÚ ÇáÑæÇÊÈ Úáì ÇíÇã ÇáÚãá ÇáÝÚáíÉ
    UPDATE  #Render
    SET     #Render.Day = #Render.Day - ( houraddagaza + daygazaa + other_add )
-------------------------------------------------------------------------------
    UPDATE  #Render
    SET     #Render.Day = CASE WHEN #Render.Day = 0 THEN ( 1 )
                               ELSE ( #Render.Day )
                          END




    --ÈÏá ØÚÇã
							 
    UPDATE  #Render
    SET     #Render.others3 = ROUND(#Render.others3 / #Render.Day
                                    * #Render.nafaa, 0)
										 

	--ÈÏá Óßä
 
    UPDATE  #Render
    SET     #Render.hawafez = ROUND(#Render.hawafez / #Render.Day
                                    * #Render.nafaa, 0)


	 --ÇäÊÞÇá

    UPDATE  #Render
    SET     #Render.b_ent = ROUND(#Render.b_ent / #Render.Day * #Render.nafaa,
                                  0)


	--ÈÏá ÊáíÝæä
	
    UPDATE  #Render
    SET     #Render.b_tab = ROUND(#Render.b_tab / #Render.Day * #Render.nafaa,
                                  0)
	--ÈÏáÇÊ ÇÎÑì
  
    UPDATE  #Render
    SET     #Render.b_malbas = ROUND(#Render.b_malbas / #Render.Day
                                     * #Render.nafaa, 0)

	-- ÈÏá ãæÞÚ
  
    UPDATE  #Render
    SET     #Render.b_food = ROUND(#Render.b_food / #Render.Day
                                   * #Render.nafaa, 0)

    --ÈÏá ãÏÇÑÓ
    UPDATE  #Render
    SET     #Render.Take_Schole = ROUND(#Render.Take_Schole / #Render.Day
                                        * #Render.nafaa, 0)


	----ÈÏá äÓÈÉ

    
  
    UPDATE  #Render
    SET     #Render.Take_Percent = ( SELECT SUM(ISNULL(Emp_Comming.Take_Percent,
                                                       0))
                                     FROM   dbo.Emp_Comming
                                     WHERE  dbo.Emp_Comming.CostID = #Render.AccCode
                                            AND Emp_Comming.Emp_Code = #Render.code
                                            AND DATEPART(MONTH,
                                                         emp_datecomming) = @month
                                            AND DATEPART(YEAR, emp_datecomming) = @year
                                            AND Emp_Comming.comming = 1
                                            AND svacation = 0
                                   )


    UPDATE  #Render
    SET     #Render.Take_Percent = ROUND(Take_Percent, 0)


	 --ÇáÇÖÇÝì

    UPDATE  #Render
    SET     #Render.ed_agaza = ( SELECT SUM(ISNULL(Emp_Comming.Extra_Hours_Values,
                                                   0))
                                 FROM   dbo.Emp_Comming
                                 WHERE  dbo.Emp_Comming.CostID = #Render.AccCode
                                        AND Emp_Comming.Emp_Code = #Render.code
                                        AND DATEPART(MONTH, emp_datecomming) = @month
                                        AND DATEPART(YEAR, emp_datecomming) = @year
                                        AND Emp_Comming.comming = 1
                                        AND svacation = 0
                               )


    UPDATE  #Render
    SET     #Render.ed_agaza = ROUND(ed_agaza, 0)




    UPDATE  #Render
    SET     #Render.Emp_Time_Extra = ( SELECT   SUM(ISNULL(Emp_Comming.Emp_Time_Extra,
                                                           0))
                                       FROM     dbo.Emp_Comming
                                       WHERE    dbo.Emp_Comming.CostID = #Render.AccCode
                                                AND Emp_Comming.Emp_Code = #Render.code
                                                AND DATEPART(MONTH,
                                                             emp_datecomming) = @month
                                                AND DATEPART(YEAR,
                                                             emp_datecomming) = @year
                                                AND Emp_Comming.comming = 1
                                                AND svacation = 0
                                     )



     

	 --ÇáÍæÇÝÒ
    UPDATE  #Render
    SET     #Render.takher = ROUND(( #Render.takher / #Render.Day )
                                   * #Render.nafaa, 0)
---------------------------------------------------------------------------------------------------

--ÇáÎÕæãÇÊ

	 --ÇáÓáÝÉ
    UPDATE  #Render
    SET     #Render.solfa_cut = ROUND(( #Render.solfa_cut / #Render.Day )
                                      * #Render.nafaa, 0)



   --ÇáÌÒÇÁÇÊ

    UPDATE  #Render
    SET     #Render.gaza = ROUND(( #Render.gaza / #Render.Day )
                                 * #Render.nafaa, 0) 

   --ÇáÊÇãíäÇÊ

    UPDATE  #Render
    SET     #Render.ins = ROUND(( #Render.ins / #Render.Day ) * #Render.nafaa,
                                0)

	 --ÎÕã ÇáÊÇÎíÑ
    UPDATE  #Render
    SET     #Render.moneytakher = ROUND(( #Render.moneytakher / #Render.Day )
                                        * #Render.nafaa, 0)

	 --ÎÕã ÛíÇÈ 
    UPDATE  #Render
    SET     #Render.moneygyab = ROUND(( #Render.moneygyab / #Render.Day )
                                      * #Render.nafaa, 0)


 ----------------------------------------------------------------------------------------------------

		--ÇÌãÇáì ÇáÑÇÊÈ ÍÓÈ ÇíÇã ÇáÏæÇã
    UPDATE  #Render
    SET     #Render.Tel = ROUND(( SalaryReport.Tel / #Render.Day )
                                * #Render.nafaa, 0)
    FROM    #Render
            INNER JOIN dbo.SalaryReport ON SalaryReport.code = #Render.code
    WHERE   #Render.month = dbo.SalaryReport.month
            AND #Render.year = dbo.SalaryReport.year 
			 
  
	   --ÇÌãÇáì ÇáÑÇÊÈ ÈÇáÈÏáÇÊ
	
    UPDATE  #Render
    SET     totalm = ISNULL(Tel, 0) + ISNULL(b_food, 0) + ISNULL(ed_agaza, 0)
            + ISNULL(b_tab, 0) + ISNULL(hawafez, 0) + ISNULL(b_malbas, 0)
            + ISNULL(others3, 0) + ISNULL(b_ent, 0) + ISNULL(takher, 0)
            + ISNULL(Take_Percent, 0) + ISNULL(Take_Schole, 0)

    UPDATE  #Render
    SET     totalm = ROUND(totalm, 0)



	 --ÇÌãÇáì ÇáÎÕã
  
    UPDATE  #Render
    SET     totalkh = ISNULL(moneytakher, 0) + ISNULL(solfa_cut, 0)
            + ISNULL(moneygyab, 0) + ISNULL(gaza, 0) + ISNULL(ins, 0)
            + CASE WHEN ( tax < 0 ) THEN 0
                   ELSE ISNULL(tax, 0)
              END 

    UPDATE  #Render
    SET     totalkh = ROUND(totalkh, 0)




			--ÇáÕÇÝì
    UPDATE  #Render
    SET     #Render.safy = #Render.totalm - #Render.totalkh



    SELECT  *
    FROM    #Render 
