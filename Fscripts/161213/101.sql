 

 
ALTER PROCEDURE [dbo].[_Select_Sallery]
    @code BIGINT ,
    @code1 BIGINT ,
    @FPlan BIGINT ,
    @TPlan BIGINT ,
    @Fdepart BIGINT ,
    @Tdepart BIGINT ,
    @Fcomp BIGINT ,
    @Tcomp BIGINT ,
    @FBranch BIGINT ,
    @TBranch BIGINT ,
    @FBank NVARCHAR(100) ,
    @month AS INT ,
    @year AS INT
AS
    BEGIN

      

                SELECT *,
                        emp.IqamaID ,
                        emp.emp_add ,
                        emp.BankNo ,
                        ISNULL(SalaryReport.Take_Schole, 0) AS Take_Schole ,
                        ISNULL(SalaryReport.Take_Percent, 0) AS Take_Percent,
						dbo.emp.OrignalContry 
                FROM    SalaryReport
                        INNER JOIN emp ON SalaryReport.code = emp.emp_code
                WHERE   (@FBank = '0' OR  SalaryReport.SalaryType = @FBank )
                        AND (@FBranch = 0 OR  SalaryReport.brnchid >= @FBranch )
                        AND (@TBranch = 0 OR  SalaryReport.brnchid <= @TBranch )
                        AND (@FPlan = 0 OR  SalaryReport.planid >= @FPlan )
                        AND (@TPlan = 0 OR  SalaryReport.planid <= @TPlan )
                        AND (@Fdepart = 0 OR  SalaryReport.ksmid >= @Fdepart )
                        AND (@Tdepart = 0 OR  SalaryReport.ksmid <= @Tdepart )
                        AND (@month = 0 OR  SalaryReport.month= @month )
                       
                        AND (@year = 0 OR  SalaryReport.year = @year )
                      
                        AND (@code = 0 OR  SalaryReport.code >= @code )
                        AND (@code1 = 0 OR  SalaryReport.code <= @code1 )
                ORDER BY SalaryReport.code


           

      

    END
