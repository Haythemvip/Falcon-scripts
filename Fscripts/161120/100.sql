 

ALTER PROC [dbo].[_OverTime]
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
   

    CREATE TABLE #Codes
        (
          empcode  BIGINT  NULL ,
          emp_name [NVARCHAR](100) COLLATE Arabic_CI_Ai
                                   NULL,
        )




    INSERT  INTO #Codes
            SELECT  emp_code ,
                    emp_name
            FROM    emp
            WHERE   --emp.COMP_ID>=@Fcomp and emp.COMP_ID<=@Tcomp and
                    emp.Sec_id >= @FBranch
                    AND emp.Sec_id <= @TBranch
                    AND emp.Planid >= @FPlan
                    AND emp.Planid <= @TPlan
                    AND emp.depart_id >= @Fdepart
                    AND emp.depart_id <= @Tdepart
                    AND emp.emp_code >= CAST(@code AS BIGINT)
                    AND emp.emp_code <= CAST(@code1 AS BIGINT)
                    AND flag = 1


    CREATE TABLE #OverTime
        (
          [code]  BIGINT  NULL ,
          emp_name [NVARCHAR](100) COLLATE Arabic_CI_Ai
                                   NULL ,
          [date] CHAR(10) COLLATE Arabic_CI_Ai
                         NULL ,
          [time] CHAR(5)
        )



    CREATE TABLE #WorkTimesHoliday
        (
          date CHAR(8) COLLATE Arabic_CI_Ai
                       NULL ,
          Explain NVARCHAR(100)
        )

 
    INSERT  INTO #OverTime
            SELECT  empcode ,
                    emp_name ,
                    edafy_date ,
                    ISNULL( edafy_time,0)
            FROM    #Codes 
			INNER JOIN emp_edafy ON emp_id= #Codes.empcode
			WHERE edafy_date BETWEEN @Fdates AND @Tdates

    --UPDATE  #OverTime
    --SET     time = ( SELECT CASE WHEN ( ISNULL( edafy_time,0) * ISNULL( HOURTO,0) < 10 )
    --                             THEN ( '0' + LTRIM(RTRIM(STR(edafy_time
    --                                                          * HOURTO)))
    --                                    + ':00' )
    --                             ELSE ( LTRIM(RTRIM(STR(ISNULL( edafy_time,0) * ISNULL( HOURTO,0))))
    --                                    + ':00' )
    --                        END
    --                 FROM   emp_edafy
    --                 WHERE  emp_edafy.emp_id = #OverTime.code
    --               )


    --UPDATE  #OverTime
    --SET     date = ( SELECT  edafy_date 
    --                 FROM   emp_edafy
					 
    --                 WHERE  emp_edafy.emp_id = #OverTime.code
				--	 GROUP BY emp_id,edafy_date)
                    
 


 
 

    SELECT  *
    FROM    #OverTime
    WHERE   #OverTime.time IS NOT NULL
 

