

ALTER PROC [dbo].[_ezn]
    @code CHAR(20) ,
    @code1 CHAR(20) ,
    @Fdates DATE ,
    @Tdates DATE ,
    @Fcomp CHAR(20) ,
    @Tcomp CHAR(20) ,
    @FPlan CHAR(20) ,
    @TPlan CHAR(20) ,
    @Fdepart CHAR(20) ,
    @Tdepart CHAR(20) ,
    @FBranch CHAR(20) = '0' ,
    @TBranch CHAR(20) = '999' ,
    @state BIT = 0 ,
    @username NVARCHAR(100) = NULL ,
    @ComputerName NVARCHAR(100) = NULL
AS
    DECLARE @month_id NUMERIC;
    DECLARE @year_id NUMERIC;







    CREATE TABLE #Vacations
        (
          [code] BIGINT NULL ,
          [date] [CHAR](8) NULL ,
          [name] [NVARCHAR](100) NOT NULL ,
          [EmpVac1] [INT] NULL ,
          [EmpVac2] [INT] NULL ,
          [EmpVac3] [INT] NULL ,
          [Holiday] [NVARCHAR](100) NULL ,
          [Flage] [INT] NULL ,
          val NUMERIC(18, 2)
        ); 

    CREATE TABLE #Codes ( empcode BIGINT NULL, );



    INSERT  INTO #Codes
            SELECT  emp.emp_code
            FROM    emp
                    INNER JOIN Emp_Vacation ON emp.emp_code = Emp_Vacation.Emp_Code
            WHERE   --emp.COMP_ID>=@Fcomp and emp.COMP_ID<=@Tcomp and
                    emp.Sec_id >= @FBranch
                    AND emp.Sec_id <= @TBranch
                    AND emp.Planid >= @FPlan
                    AND emp.Planid <= @TPlan
                    AND emp.depart_id >= @Fdepart
                    AND emp.depart_id <= @Tdepart
                    AND emp.emp_code BETWEEN   @code  
                    AND  @code1  


 
  
 
    INSERT  INTO #Vacations
            SELECT DISTINCT
                    Emp_Comming.Emp_Code ,
                    emp_datecomming,
                    emp.emp_name ,
                    6 ,
                    0 ,
                    0 ,
                    'اذن تأخير' ,
                    6 ,
                    0
            FROM    Emp_Comming
                    INNER  JOIN emp ON Emp_Comming.Emp_Code = emp.emp_code
            WHERE   Emp_Comming.ezn = 1
                    AND emp_datecomming BETWEEN @Fdates AND @Tdates;

 



  INSERT  INTO #Vacations
            SELECT DISTINCT
                    Emp_Comming.Emp_Code ,
                    emp_datecomming,
                    emp.emp_name ,
                    6 ,
                    0 ,
                    0 ,
                    'اذن غياب' ,
                    6 ,
                    0
            FROM    Emp_Comming
                    INNER  JOIN emp ON Emp_Comming.Emp_Code = emp.emp_code
            WHERE   Emp_Comming.ghyab_bezn = 1
                    AND emp_datecomming BETWEEN @Fdates AND @Tdates;



    DECLARE @Repeated INT;
    SET @Repeated = 0;
    WHILE @Repeated < 10
        BEGIN
            SET @Repeated = @Repeated + 1;
            INSERT  INTO #Vacations
                    SELECT  emp.emp_code ,
                            '' ,
                            emp.emp_name ,
                            0 ,
                            0 ,
                            0 ,
                            '' ,
                            @Repeated ,
                            0
                    FROM    emp
                    WHERE   emp.emp_code IN ( SELECT    empcode
                                              FROM      #Codes );


        END;

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
                                  FROM      #Codes );