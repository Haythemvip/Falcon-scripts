

ALTER    PROC [dbo].[VacationsCalculate_Balance]
    @Calcdate DATE ,
    @Fcomp INT = 0 ,
    @state BIT = 0 ,
    @username NVARCHAR(100) = NULL ,
    @ComputerName NVARCHAR(100) = NULL ,
    @List AS dbo.MyParam READONLY ,
    @FromLastBack BIT
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
          WorkDayes BIGINT ,
          YY INT ,
          MM INT ,
          DD INT,
		  IqamaID NVARCHAR(100)
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
              Balance_Vac ,
              YY ,
              MM ,
              DD ,
			  IqamaID  

            )
            SELECT  emp.emp_code , -- code - bigint
                    emp.emp_name , -- name - nvarchar(100)
                    dbo.emp.StatusDate , -- Job_Date - date
                    YaerlyVacation , -- YearlyVac - int
                    VacPrevious , -- Past_YearlyVac - int
                    YaerlyVacation + VacPrevious , -- Total_Vac - int
                    0 , -- Due_Vac - int
                    0 , -- Take_Vac - int
                    0    -- Balance_Vac - int
                    ,
                    0 ,
                    0 ,
                    0 ,
					IqamaID
            FROM    emp
            WHERE   ( ( SELECT  ISNULL(COUNT(*), 0)
                            FROM    @List
                          ) = 0
                          OR emp.emp_code IN ( SELECT   *
                                               FROM     @List )
                        );  
          

    DECLARE @NewDate AS DATE; 

    SET @NewDate = ( SELECT FinancialYear.FromDate
                     FROM   dbo.FinancialYear
                     WHERE  YearName = DATEPART(YEAR, @Calcdate)
                   );



    UPDATE  #Vacations
    SET     WorkDayes = DATEDIFF(DAY, Job_Date, @Calcdate);




    --IF @FromLastBack = 0
    --    BEGIN 

    --        UPDATE  #Vacations
    --        SET     WorkDayes = CASE WHEN WorkDayes > 365
    --                                 THEN ( DATEDIFF(DAY, @NewDate, @Calcdate) )
    --                                 ELSE ( WorkDayes )
    --                            END; 

    --    END; 
   
                        


    





    UPDATE  #Vacations
    SET     Due_Vac = ( YearlyVac * WorkDayes ) / 365; 




 
    UPDATE  #Vacations
    SET     Take_Vac = ( SELECT COUNT(vacation_id)
                         FROM   dbo.Emp_Vacation
                         WHERE  Emp_Code = #Vacations.code
                                AND Emp_Vacation.Vacyear = DATEPART(YEAR,
                                                              @Calcdate)
                                AND Emp_Vacation.Emp_Vac_Date <= @Calcdate
                       );





    UPDATE  #Vacations
    SET     YY = WorkDayes / 365.25;

        --UPDATE  #Fixed
        --SET     YYYY = dbo.db_DateDiff('YY', emp_jopdate, @DateSet)





    UPDATE  #Vacations
    SET     MM = ( WorkDayes / 30.4375 ) - ( YY * 12 );

        --UPDATE  #Fixed
        --SET     MM = ( dbo.db_DateDiff('MM', emp_jopdate, @DateSet) ) - ( YYYY * 12 )
        --                                                     
 
  
    UPDATE  #Vacations
    SET     DD = ( WorkDayes ) - ( ( YY * 365.25 ) + ( MM * 30.4375 ) );



    UPDATE  #Vacations
    SET     Balance_Vac = ( Due_Vac + Past_YearlyVac ) - Take_Vac; 
  

    SELECT  *
    FROM    #Vacations
    ORDER BY code; 
           