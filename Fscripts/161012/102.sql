 

ALTER PROC [dbo].[_salary_plass]
    @code CHAR(20) = '0' ,
    @code1 CHAR(20) = '999999' ,
    @Fdates DATE ,
    @Tdates DATE ,
    @Fcomp CHAR(20) = '0' ,
    @Tcomp CHAR(20) ,
    @FPlan CHAR(20) = '0' ,
    @TPlan CHAR(20) = '999' ,
    @Fdepart CHAR(20) = '0' ,
    @Tdepart CHAR(20) = '999' ,
    @FBranch CHAR(20) = '0' ,
    @TBranch CHAR(20) = '999' ,
    @state BIT = 0 ,
    @username NVARCHAR(100) = NULL ,
    @ComputerName NVARCHAR(100) = NULL
AS
    DECLARE @month_id NUMERIC
    DECLARE @year_id NUMERIC







    CREATE TABLE #Vacations
        (
          [code]  BIGINT  NULL ,
          [date] DATE NULL ,
          [name] [NVARCHAR](100) NOT NULL ,
          [EmpVac1] [INT] NULL ,
          [EmpVac2] [INT] NULL ,
          [EmpVac3] [INT] NULL ,
          [Holiday] [NVARCHAR](100) NULL ,
          [Flage] [INT] NULL ,
          val NUMERIC(18, 2)
        ) 

    CREATE TABLE #Codes
        (
          empcode BIGINT  NULL,
        )



    INSERT  INTO #Codes
            SELECT  emp.emp_code
            FROM    emp
                    --INNER JOIN Emp_Vacation ON emp.emp_code = Emp_Vacation.Emp_Code
            WHERE   --emp.COMP_ID>=@Fcomp and emp.COMP_ID<=@Tcomp and
                    emp.Sec_id >= @FBranch
                    AND emp.Sec_id <= @TBranch
                    AND emp.Planid >= @FPlan
                    AND emp.Planid <= @TPlan
                    AND emp.depart_id >= @Fdepart
                    AND emp.depart_id <= @Tdepart
                    AND emp.emp_code >= CAST(@code AS INT)
                    AND emp.emp_code <= CAST(@code1 AS INT)





    INSERT  INTO #Vacations
            SELECT DISTINCT
                    salary_plass.emp_id ,
                    dbo.DateVal(YEAR(plassdate), MONTH(plassdate),
                                DAY(plassdate)) ,
                    emp.emp_name ,
                    16 ,
                    0 ,
                    0 ,
                    salary_plass.Notes ,
                    16 ,
                    salary_plass.plassval
            FROM    salary_plass
                    INNER  JOIN emp ON salary_plass.emp_id = emp.emp_code
           WHERE   plassdate BETWEEN @Fdates AND @Tdates


		    
 

    SELECT  #Vacations.* ,
            Company_name.COM_ID AS CompCode ,
            Company_name.COM_name AS CompName ,
            jobs.jobid AS jobcode ,
            jobs.jname AS jobname ,
            departments.depart_id AS DepCode ,
            departments.depart_name AS depname ,
            Sections.Sec_id AS BranchCode ,
            Sections.Sec_name AS BranchName ,
            @username AS UserName ,
            @ComputerName AS ComputerName
    FROM    #Vacations
            INNER JOIN emp ON #Vacations.code = emp.emp_code
            INNER JOIN jobs ON emp.jobid = jobs.jobid
            LEFT JOIN Company_name ON emp.COMP_ID = Company_name.COM_ID
            INNER JOIN departments ON emp.depart_id = departments.depart_id
            INNER JOIN Sections ON Sections.Sec_id = emp.Sec_id
    WHERE   date <> ''
            AND emp.emp_code IN ( SELECT    empcode
                                  FROM      #Codes )