 


ALTER PROC [dbo].[_Mamoryat]
     @Fdates DATE ,
    @Tdates DATE ,
    @Fcomp int = 0 ,
   
    @state BIT = 0 ,
    @username NVARCHAR(100) = NULL ,
    @ComputerName NVARCHAR(100) = NULL,
    @List AS dbo.MyParam READONLY
AS
    DECLARE @month_id NUMERIC
    DECLARE @year_id NUMERIC







    CREATE TABLE #Vacations
        (
          [code]  BIGINT  NULL ,
          [date] [CHAR](8) NULL ,
          [name] [NVARCHAR](100) NOT NULL ,
          [EmpVac1] [INT] NULL ,
          [EmpVac2] [INT] NULL ,
          [EmpVac3] [INT] NULL ,
          [Holiday] [NVARCHAR](100) NULL ,
          [Flage] [INT] NULL ,
          val NUMERIC(18, 2)
        ) 

 



 

 

    INSERT  INTO #Vacations
            SELECT  emp_mamoryat.Emp_Code ,
                    dbo.DateVal(YEAR(mfrom), MONTH(mfrom), DAY(mfrom)) ,
                    emp.emp_name ,
                    5 ,
                    0 ,
                    0 ,
                    emp_mamoryat.notes ,
                    5 ,
                    0
            FROM    emp_mamoryat
                    INNER  JOIN emp ON emp_mamoryat.Emp_Code = emp.emp_code
            WHERE   mfrom BETWEEN  @Fdates 
                          AND     @Tdates 
AND ( ( SELECT  ISNULL(COUNT(*), 0)
                            FROM    @List
                          ) = 0
                          OR emp.emp_code IN ( SELECT   *
                                               FROM     @List )
                        ) 
  

    --DECLARE @Repeated INT
    --SET @Repeated = 0
    --WHILE @Repeated < 10
    --    BEGIN
    --        SET @Repeated = @Repeated + 1
    --        INSERT  INTO #Vacations
    --                SELECT  emp.emp_code ,
    --                        '' ,
    --                        emp.emp_name ,
    --                        0 ,
    --                        0 ,
    --                        0 ,
    --                        '' ,
    --                        @Repeated ,
    --                        0
    --                FROM    emp
    --                WHERE   emp.emp_code IN ( SELECT    empcode
    --                                          FROM      #Codes )


    --    END

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
            