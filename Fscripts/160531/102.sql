 

ALTER  PROCEDURE [dbo].[Employee_Life]
    @From_Emp BIGINT ,
    @To_Emp BIGINT ,
    @FromYear BIGINT ,
    @ToYear BIGINT ,
    @FromMonth BIGINT ,
    @ToMonth BIGINT
AS
    CREATE TABLE #Excel
        (
          code BIGINT ,
          name NVARCHAR(100) ,
          others3 [DECIMAL](18, 2) ,
          hawafez [DECIMAL](18, 2) ,
          ed_sahar [DECIMAL](18, 2) ,
          b_ent [DECIMAL](18, 2) ,
          b_tab [DECIMAL](18, 2) ,
          b_malbas [DECIMAL](18, 2) ,
          b_food [DECIMAL](18, 2) ,
          totalm [DECIMAL](18, 2) ,
          takher [DECIMAL](18, 2) ,
          solfa_cut [DECIMAL](18, 2) ,
          gaza [DECIMAL](18, 2) ,
          ins [DECIMAL](18, 2) ,
          totalkh [DECIMAL](18, 2) ,
          safy [DECIMAL](18, 2) ,
          month BIGINT ,
          year BIGINT ,
          Day BIGINT ,
          moneytakher [DECIMAL](18, 2) ,
          moneygyab [DECIMAL](18, 2) ,
          ed_agaza [DECIMAL](18, 2) ,
          elawa [DECIMAL](18, 2) ,
          mobile [DECIMAL](18, 2) ,
          Tel [DECIMAL](18, 2) ,
          Take_Schole [DECIMAL](18, 2) ,
          Take_Percent [DECIMAL](18, 2) ,
          BarCode NVARCHAR(50) ,
          Nationality NVARCHAR(50) ,
          brnchs NVARCHAR(50) ,
          ksm NVARCHAR(50) ,
          jop NVARCHAR(50) ,
          KafeelName NVARCHAR(50) ,
          planName NVARCHAR(50) ,
          Reward [DECIMAL](18, 2)
        )



    INSERT  INTO #Excel
            SELECT  SalaryReport.code ,
                    SalaryReport.name ,
                    SalaryReport.others3 ,
                    SalaryReport.hawafez ,
                    SalaryReport.ed_sahar ,
                    SalaryReport.b_ent ,
                    SalaryReport.b_tab ,
                    SalaryReport.b_malbas ,
                    SalaryReport.b_food ,
                    SalaryReport.totalm ,
                    SalaryReport.takher ,
                    SalaryReport.solfa_cut ,
                    SalaryReport.gaza ,
                    SalaryReport.ins ,
                    SalaryReport.totalkh ,
                    SalaryReport.safy ,
                    SalaryReport.month ,
                    SalaryReport.year ,
                    SalaryReport.Day ,
                    SalaryReport.moneytakher ,
                    SalaryReport.moneygyab ,
                    SalaryReport.ed_agaza ,
                    SalaryReport.elawa ,
                    SalaryReport.mobile ,
                    SalaryReport.Tel ,
                    SalaryReport.Take_Schole ,
                    SalaryReport.Take_Percent ,
                    SalaryReport.BarCode ,
                    SalaryReport.Nationality ,
                    SalaryReport.brnchs ,
                    SalaryReport.ksm ,
                    SalaryReport.jop ,
                    VEmp.KafeelName ,
                    VEmp.planName ,
                    SUM(salary_plass.plassval) AS Reward
            FROM    SalaryReport
                    LEFT OUTER JOIN salary_plass ON SalaryReport.code = salary_plass.emp_id
                                                    AND SalaryReport.month = salary_plass.datemonth
                                                    AND SalaryReport.year = salary_plass.dateYear
                    LEFT OUTER JOIN VEmp ON SalaryReport.code = VEmp.emp_code
            GROUP BY SalaryReport.code ,
                    SalaryReport.name ,
                    SalaryReport.others3 ,
                    SalaryReport.hawafez ,
                    SalaryReport.ed_sahar ,
                    SalaryReport.b_ent ,
                    SalaryReport.b_tab ,
                    SalaryReport.b_malbas ,
                    SalaryReport.b_food ,
                    SalaryReport.totalm ,
                    SalaryReport.takher ,
                    SalaryReport.solfa_cut ,
                    SalaryReport.gaza ,
                    SalaryReport.ins ,
                    SalaryReport.totalkh ,
                    SalaryReport.safy ,
                    SalaryReport.month ,
                    SalaryReport.year ,
                    SalaryReport.Day ,
                    SalaryReport.moneytakher ,
                    SalaryReport.moneygyab ,
                    SalaryReport.ed_agaza ,
                    SalaryReport.elawa ,
                    SalaryReport.mobile ,
                    SalaryReport.Tel ,
                    SalaryReport.Take_Schole ,
                    SalaryReport.Take_Percent ,
                    SalaryReport.BarCode ,
                    SalaryReport.Nationality ,
                    SalaryReport.brnchs ,
                    SalaryReport.ksm ,
                    SalaryReport.jop ,
                    VEmp.KafeelName ,
                    VEmp.planName
            HAVING  ( SalaryReport.code BETWEEN @From_Emp AND @To_Emp )
                    AND ( SalaryReport.year BETWEEN @FromYear AND @ToYear )
                    AND ( SalaryReport.month BETWEEN @FromMonth
                                             AND     @ToMonth )
            ORDER BY SalaryReport.year ,
                    SalaryReport.month ,
                    SalaryReport.code







    SELECT  *
    FROM    #Excel
