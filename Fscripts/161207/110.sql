

 

CREATE    PROC [dbo].[VacationsCalculate_Balance]
    @code BIGINT ,
    @code1 BIGINT ,
    @Calcdate DATE ,
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
    CREATE TABLE #Vacations
        (
          [code] BIGINT NULL ,
          [name] [NVARCHAR](MAX) NOT NULL ,
          Job_Date DATE ,
          YearlyVac INT ,
          Past_YearlyVac INT ,
          Total_Vac INT ,
          Due_Vac INT ,
          Take_Vac INT ,
          Balance_Vac INT ,
          WorkDayes BIGINT
        ); 

   

    INSERT  INTO #Vacations
            ( code ,
              name ,
              Job_Date ,
              YearlyVac ,
              Past_YearlyVac ,
              Total_Vac ,
              Due_Vac ,
              Take_Vac ,
              Balance_Vac  

            )
            SELECT  emp.emp_code , -- code - bigint
                    emp.emp_name , -- name - nvarchar(100)
                    dbo.emp.emp_jopdate , -- Job_Date - date
                    YaerlyVacation , -- YearlyVac - int
                    VacPrevious , -- Past_YearlyVac - int
                    YaerlyVacation + VacPrevious , -- Total_Vac - int
                    0 , -- Due_Vac - int
                    0 , -- Take_Vac - int
                    0    -- Balance_Vac - int
            FROM    emp
            WHERE   emp.Sec_id >= @FBranch
                    AND emp.Sec_id <= @TBranch
                    AND emp.Planid >= @FPlan
                    AND emp.Planid <= @TPlan
                    AND emp.depart_id >= @Fdepart
                    AND emp.depart_id <= @Tdepart
                    AND emp.emp_code >= CAST(@code AS INT)
                    AND emp.emp_code <= CAST(@code1 AS INT);
          

    DECLARE @NewDate AS DATE; 

    SET @NewDate = ( SELECT FinancialYear.FromDate
                     FROM   dbo.FinancialYear
                     WHERE  YearName = DATEPART(YEAR, @Calcdate)
                   );



    UPDATE  #Vacations
    SET     WorkDayes = DATEDIFF(DAY, Job_Date, @Calcdate);



    UPDATE  #Vacations
    SET     WorkDayes = CASE WHEN WorkDayes > 365
                             THEN ( DATEDIFF(DAY, @NewDate ,@Calcdate ) )
                             ELSE ( WorkDayes )
                        END; 





    UPDATE  #Vacations
    SET     Due_Vac = (YearlyVac * WorkDayes) / 365; 




 
    UPDATE  #Vacations
    SET     Take_Vac = ( SELECT COUNT(vacation_id)
                         FROM   dbo.Emp_Vacation
                         WHERE  Emp_Code = #Vacations.code
                                AND Emp_Vacation.Vacyear = DATEPART(YEAR,
                                                              @Calcdate)
                                AND Emp_Vacation.Emp_Vac_Date <= @Calcdate
                       );






    UPDATE  #Vacations
    SET     Balance_Vac = (Due_Vac + Past_YearlyVac ) - Take_Vac; 
  

    SELECT  *
    FROM    #Vacations; 
           