
 

ALTER PROC [dbo].[_OverTime]
    @code BIGINT = 0 ,
    @code1 BIGINT = 0 ,
    @Fdates DATE ,
    @Tdates DATE ,
    @Fcomp CHAR(20) ,
    @Tcomp CHAR(20) ,
    @FPlan CHAR(20) ,
    @TPlan CHAR(20) ,
    @Fdepart CHAR(20) ,
    @Tdepart CHAR(20) ,
    @FBranch CHAR(20) ,
    @TBranch CHAR(20) ,
    @state BIT = 0 ,
    @username NVARCHAR(100) = NULL ,
    @ComputerName NVARCHAR(100) = NULL
AS
    BEGIN


        IF @TBranch = 0
            BEGIN 

                SET @TBranch = ( SELECT MAX(PRUN_ID)
                                 FROM   Prunshes
                               );

            END;
    

        IF @Tdepart = 0
            BEGIN 

                SET @Tdepart = ( SELECT MAX(depart_id)
                                 FROM   dbo.departments
                               );

            END;
    
        IF @code1 = 0
            BEGIN 

                SET @code1 = ( SELECT   MAX(emp_code)
                               FROM     dbo.emp
                             );

            END;
    




 IF @TPlan = 0
            BEGIN 

                SET @TPlan = ( SELECT   MAX(Planid)
                               FROM     dbo.workPlan 
                             );

            END;










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
				   AND emp.Sec_id BETWEEN @FBranch AND @TBranch
                        AND emp.Planid BETWEEN @FPlan AND @TPlan
                        AND emp.depart_id BETWEEN @Fdepart AND @Tdepart
                        AND emp.emp_code BETWEEN @code AND @code1; 
					 
   


 
 

        SELECT  *
        FROM    #OverTime
        WHERE   #OverTime.OverTime IS NOT NULL
       

    END; 