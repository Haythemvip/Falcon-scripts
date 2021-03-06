
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

        IF @FBank <> '0'
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
                WHERE   ( SalaryReport.SalaryType = @FBank )
                        AND ( SalaryReport.brnchid >= @FBranch )
                        AND ( SalaryReport.brnchid <= @TBranch )
                        AND ( SalaryReport.planid >= @FPlan )
                        AND ( SalaryReport.planid <= @TPlan )
                        AND ( SalaryReport.ksmid >= @Fdepart )
                        AND ( SalaryReport.ksmid <= @Tdepart )
                        AND ( SalaryReport.month >= @month )
                        AND ( SalaryReport.month <= @month )
                        AND ( SalaryReport.year >= @year )
                        AND ( SalaryReport.year <= @year )
                        AND ( SalaryReport.code >= @code )
                        AND ( SalaryReport.code <= @code1 )
                ORDER BY SalaryReport.code


            END

        IF @FBank = '0'
            BEGIN
                SELECT  * ,
                        emp.IqamaID ,
                        emp.emp_add ,
                        emp.BankNo ,
                        ISNULL(SalaryReport.Take_Schole, 0) AS Take_Schole ,
                        ISNULL(SalaryReport.Take_Percent, 0) AS Take_Percent,
						dbo.emp.OrignalContry 
                FROM    SalaryReport
                        INNER JOIN emp ON SalaryReport.code = emp.emp_code
                WHERE   ( SalaryReport.brnchid >= @FBranch )
                        AND ( SalaryReport.brnchid <= @TBranch )
                        AND ( SalaryReport.planid >= @FPlan )
                        AND ( SalaryReport.planid <= @TPlan )
                        AND ( SalaryReport.ksmid >= @Fdepart )
                        AND ( SalaryReport.ksmid <= @Tdepart )
                        AND ( SalaryReport.month >= @month )
                        AND ( SalaryReport.month <= @month )
                        AND ( SalaryReport.year >= @year )
                        AND ( SalaryReport.year <= @year )
                        AND ( SalaryReport.code >= @code )
                        AND ( SalaryReport.code <= @code1 )
                ORDER BY SalaryReport.code
            END

    END
