 

  
CREATE PROC [dbo].[Insurances_dues]
    @code BIGINT ,
    @Date DATE ,
    @Date2 DATE = @Date ,
    @Time CHAR(5) ,
    @VerifyMode CHAR(4) ,
    @InOutMode CHAR(4) ,
    @MachineNumber CHAR(4) ,
    @CostID BIGINT = 0
AS
    CREATE TABLE #Result
        (
          emp_code BIGINT ,
          emp_name NVARCHAR(200) ,
          jname NVARCHAR(100) ,
          depart_name NVARCHAR(150) ,
          emp_tamensallery FLOAT ,
          emp_tamensalleryCanged FLOAT ,
          EmpVlue FLOAT ,
          OwnerValue FLOAT ,
          Sumary FLOAT ,
          empFix FLOAT ,
          EmpChanged FLOAT ,
          ComFix FLOAT ,
          ComChanged FLOAT ,
          planID INT
        )
     

    INSERT  INTO #Result
            SELECT  emp.emp_code ,
                    emp.emp_name ,
                    jobs.jname ,
                    departments.depart_name ,
                    emp.emp_tamensallery ,
                    emp.emp_tamensalleryCanged ,
                    0.00 AS EmpVlue ,
                    0.00 AS OwnerValue ,
                    0.00 AS Sumary ,
                    EmpTamen.EmpFix ,
                    EmpTamen.EmpChanged ,
                    EmpTamen.ComFix ,
                    EmpTamen.ComChanged
            FROM    emp
                    INNER JOIN jobs ON jobs.jobid = emp.jobid
                    INNER JOIN departments ON departments.depart_id = emp.depart_id
                    INNER JOIN EmpTamen ON emp.NationalityID = EmpTamen.ID



					UPDATE #Result SET EmpVlue = (ISNULL( emp_tamensallery,0) * ISNULL( empFix,0) / 100) + (ISNULL( emp_tamensalleryCanged,0) * ISNULL( EmpChanged,0) / 100)

					UPDATE #Result SET OwnerValue = (ISNULL( ComFix,0) * ISNULL( empFix,0) / 100) + (ISNULL( emp_tamensalleryCanged,0) * ISNULL( ComChanged,0) / 100)

					UPDATE #Result SET Sumary = (EmpVlue) + (OwnerValue)




					SELECT * FROM #Result WHERE Sumary > 0




