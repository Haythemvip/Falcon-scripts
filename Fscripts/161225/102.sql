 
 

ALTER PROC [dbo].[_cutting]
    @Fdates DATE ,
    @Tdates DATE ,
    @Fcomp CHAR(20) = 0 ,
    @state BIT = 0 ,
    @username NVARCHAR(100) = NULL ,
    @ComputerName NVARCHAR(100) = NULL ,
    @List AS dbo.MyParam READONLY
AS
    CREATE TABLE #Vacations
        (
          [code] BIGINT NULL ,
          [date] DATE NULL ,
          [name] [NVARCHAR](MAX) NOT NULL ,
          [EmpVac1] [INT] NULL ,
          [EmpVac2] [INT] NULL ,
          [EmpVac3] [INT] NULL ,
          [Holiday] [NVARCHAR](MAX) NULL ,
          [Flage] [INT] NULL ,
          val NUMERIC(18, 2)
        ); 

  

    INSERT  INTO #Vacations
            SELECT DISTINCT
                    cutting.emp_id ,
                    cut_date ,
                    emp.emp_name ,
                    15 ,
                    0 ,
                    0 ,
                    cutting.Notes ,
                    15 ,
                    cutting.cut_val
            FROM    cutting
                    INNER  JOIN emp ON cutting.emp_id = emp.emp_code
            WHERE   cut_date BETWEEN @Fdates AND @Tdates
                    AND ( ( SELECT  ISNULL(COUNT(*), 0)
                            FROM    @List
                          ) = 0
                          OR emp.emp_code IN ( SELECT   *
                                               FROM     @List )
                        );






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
    WHERE   date <> '';
          