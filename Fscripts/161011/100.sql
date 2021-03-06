 
  
ALTER   PROC [dbo].[_Select_Emp_To_SallaryAddon]
    @code BIGINT ,
    @code1 BIGINT ,
    @FPlan CHAR(20) ,
    @Fdepart CHAR(20) ,
    @Tdepart CHAR(20) ,
    @Fcomp CHAR(20) ,
    @Tcomp CHAR(20) ,
    @FBranch CHAR(20) ,
    @TBranch CHAR(20) ,
    @Date DATE ,
    @VlueAdd NUMERIC(18, 2) ,
    @CostID BIGINT = 0 ,
    @CostName NVARCHAR(MAX) = ''
AS
    CREATE TABLE #excel
        (
          Emp_Code BIGINT NULL ,
          emp_name [CHAR](100) COLLATE Arabic_CI_AS
                               NULL ,
          AddDate DATE NULL ,
          VlueAdd [NUMERIC](18, 2) NULL ,
          CostID BIGINT ,
          CostName NVARCHAR(MAX)
        )



    BEGIN


        IF @TBranch = 0
            BEGIN 

                SET @TBranch = ( SELECT MAX(PRUN_ID)
                                 FROM   Prunshes
                               )

            END
    

        IF @Tdepart = 0
            BEGIN 

                SET @Tdepart = ( SELECT MAX(depart_id)
                                 FROM   dbo.departments
                               )

            END
    
        IF @code1 = 0
            BEGIN 

                SET @code1 = ( SELECT   MAX(emp_code)
                               FROM     dbo.emp
                             )

            END
    




        INSERT  INTO #excel
                SELECT  emp.emp_code ,
                        emp.emp_name ,
                        @Date ,
                        @VlueAdd ,
                        @CostID ,
                        @CostName
                FROM    emp
                WHERE   emp.flag = 1
                        AND emp.Sec_id BETWEEN @FBranch AND @TBranch
                        AND emp.Planid = @FPlan
                        AND emp.depart_id BETWEEN @Fdepart AND @Tdepart
                        AND emp.emp_code BETWEEN @code AND @code1 



    END

  

    --UPDATE  #excel
    --SET     VlueAdd = ( SELECT TOP 1
    --                            HOURTO
    --                    FROM    dbo.emp_edafy
    --                    WHERE   emp_edafy.emp_id = #excel.Emp_Code
    --                            AND emp_datecomming = @Date
    --                  )





    SELECT  *
    FROM    #excel
    ORDER BY Emp_Code


