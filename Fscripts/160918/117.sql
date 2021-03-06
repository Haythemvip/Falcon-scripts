 


ALTER    PROC [dbo].[_Select_Emp_To_Combo]
    @FPlan CHAR(20) ,
    @Fdepart CHAR(20) ,
    @Tdepart CHAR(20) ,
    @Fcomp CHAR(20) ,
    @Tcomp CHAR(20) ,
    @FBranch CHAR(20) ,
    @TBranch CHAR(20) ,
    @Lang CHAR(2),
	@Signed INT = 0

AS
    CREATE TABLE #excel
        (
          emp_code BIGINT NULL ,
          AccName NVARCHAR(150) COLLATE Arabic_CI_AS ,
          BarCode NVARCHAR(50)
        )



    BEGIN
        INSERT  INTO #excel
                SELECT  emp.emp_code ,
                        CASE WHEN @Lang = 'AR' THEN ( emp.emp_name )
                             ELSE ( emp.SecondName )
                        END ,
                        BarCode
                FROM    emp
                WHERE   emp.flag = 1
                        AND emp.Sec_id >= @FBranch
                        AND emp.Sec_id <= @TBranch
                        AND emp.Planid = @FPlan
                        AND emp.depart_id >= @Fdepart
                        AND emp.depart_id <= @Tdepart
                      



    END

  

  IF @Signed  = 1


  BEGIN

    DELETE FROM #excel WHERE emp_code NOT IN (SELECT Emp_ID FROM dbo.Emp_Requests WHERE HR_Signature = 1 AND DM_Signature = 1 )

  END
  



    SELECT  *
    FROM    #excel
    ORDER BY emp_code
