
 

ALTER    PROC [dbo].[_Select_Emp_To_Combo]
    @FPlan CHAR(20) ,
    @Fdepart CHAR(20) ,
    @Tdepart CHAR(20) ,
    @Fcomp CHAR(20) ,
    @Tcomp CHAR(20) ,
    @FBranch CHAR(20) ,
    @TBranch CHAR(20) ,
    @Lang CHAR(2) ,
    @Signed INT = 0
AS
    CREATE TABLE #excel
        (
          emp_code BIGINT NULL ,
          AccName NVARCHAR(150) COLLATE Arabic_CI_AS ,
          BarCode NVARCHAR(50) ,
          Notes NVARCHAR(150)
        );

 

    IF @Signed = 0
        BEGIN

            INSERT  INTO #excel
                    SELECT  emp.emp_code ,
                            CASE WHEN @Lang = 'AR' THEN ( emp.emp_name )
                                 ELSE ( emp.SecondName )
                            END ,
                            BarCode ,
                            IqamaID
                    FROM    emp
                    WHERE   emp.flag = 1
                            AND emp.Sec_id >= @FBranch
                            AND emp.Sec_id <= @TBranch
                            AND emp.Planid = @FPlan
                            AND emp.depart_id >= @Fdepart
                            AND emp.depart_id <= @Tdepart;
                      
        END;


  

  

    IF @Signed = 1
        BEGIN


            INSERT  INTO #excel
                    SELECT  Emp_Requests.Emp_ID ,
                            CASE WHEN @Lang = 'AR' THEN ( emp.emp_name )
                                 ELSE ( emp.SecondName )
                            END ,
                            BarCode ,
                            dbo.Emp_Requests.Request_Type
                    FROM    Emp_Requests
                            INNER JOIN dbo.emp ON emp_code = dbo.Emp_Requests.Emp_ID
                    WHERE   Emp_Requests.Signed = 1
                            AND dbo.Emp_Requests.Request_Type_ID NOT IN ( 2, 5 )
                            AND emp.Sec_id >= @FBranch
                            AND emp.Sec_id <= @TBranch
                            AND emp.Planid = @FPlan
                            AND emp.depart_id >= @Fdepart
                            AND emp.depart_id <= @Tdepart
							AND DATEADD(DAY ,-1,dbo.Emp_Requests .Request_Date) > dbo.emp.StatusDate
							AND flag = 1 ;



           

        END;
  



    SELECT  *
    FROM    #excel
    ORDER BY emp_code;
