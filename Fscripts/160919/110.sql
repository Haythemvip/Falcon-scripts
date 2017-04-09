

CREATE PROCEDURE Select_EmpData_To_Vacation @EmpCode BIGINT = 0
AS
    BEGIN
	
        SELECT  Mohafzet_Badal ,
                jname ,
                contract_period ,
                BarCode ,
                emp_tamensallery ,
                Nationality ,
                KafeelName ,
                YearlyTiket ,
                (emp_Take_Food) AS Allawonce ,
                StatusDate
        FROM    VEmp
        WHERE   ( @EmpCode = 0
                  OR emp_code = @EmpCode
                )

    END
GO


