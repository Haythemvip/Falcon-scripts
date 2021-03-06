 

ALTER  PROCEDURE [dbo].[Employee_Life]
    @From_Emp BIGINT ,
    @To_Emp BIGINT ,
    @FromYear BIGINT ,
    @ToYear BIGINT ,
    @FromMonth BIGINT ,
    @ToMonth BIGINT
AS
 


 
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
                    SUM(salary_plass.plassval) AS Reward,Delivered
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
                    VEmp.planName,Delivered
            HAVING  ( SalaryReport.code BETWEEN @From_Emp AND @To_Emp )
                    AND ( SalaryReport.year BETWEEN @FromYear AND @ToYear )
                    AND ( SalaryReport.month BETWEEN @FromMonth
                                             AND     @ToMonth )
            ORDER BY SalaryReport.year ,
                    SalaryReport.month ,
                    SalaryReport.code







 