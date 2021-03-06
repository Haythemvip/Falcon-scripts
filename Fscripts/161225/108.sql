
ALTER PROC [dbo].[_OverTime]
    @Fdates DATE ,
    @Tdates DATE ,
    @Fcomp int = 0 ,
   
    @state BIT = 0 ,
    @username NVARCHAR(100) = NULL ,
    @ComputerName NVARCHAR(100) = NULL,
    @List AS dbo.MyParam READONLY
AS
    BEGIN


     



        CREATE TABLE #OverTime
            (
              [code] BIGINT NULL ,
              emp_name [NVARCHAR](MAX) COLLATE Arabic_CI_AI
                                       NULL ,
              [date] DATE NULL ,
              [OverTime] CHAR(5) 
            );



     

 
        INSERT  INTO #OverTime
                SELECT  emp_code ,
                        emp_name ,
                        edafy_date ,
                        ISNULL(edafy_time, 0)
                FROM    dbo.emp
                        INNER JOIN emp_edafy ON emp_id = emp.emp_code
                WHERE   edafy_date BETWEEN @Fdates AND @Tdates 
				   AND ( ( SELECT  ISNULL(COUNT(*), 0)
                            FROM    @List
                          ) = 0
                          OR emp.emp_code IN ( SELECT   *
                                               FROM     @List )
                        )
					 
   


 
 

        SELECT  *
        FROM    #OverTime
        WHERE   #OverTime.OverTime IS NOT NULL
       

    END; 