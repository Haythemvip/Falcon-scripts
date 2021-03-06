 
ALTER    PROCEDURE [dbo].[Emp_Mosta7kat_Add]
   
    @List AS dbo.MyParam READONLY ,
    @DateSet DATE ,
    @year INT ,
    @Vacation INT ,
    @EndService INT ,
    @Estekala INT ,
    @Yearly INT ,
    @Srial BIGINT,	@ActionName NVARCHAR(50)

AS
    INSERT  INTO Emp_Mosta7kat
            SELECT  @Srial ,
                    emp_code ,
                    emp_name ,
                    jname ,
                    emp_jopdate ,
                    0 AS DayCountToEnd ,
                    ( ISNULL(emp_sallery, 0) + ISNULL(emp_tamensallery, 0)
                      + ISNULL(emp_tamensalleryCanged, 0) ) AS emp_sallery ,
                    ISNULL(emp_Take_Home, 0) AS emp_Take_Home ,
                    ( ISNULL(emp_sallery, 0) + ISNULL(emp_tamensallery, 0)
                      + ISNULL(emp_tamensalleryCanged, 0)
                      + ISNULL(emp_Take_Home, 0) ) AS TotalSalary ,
                    ISNULL(contract_period, 0) AS ContractTime ,
                    ISNULL(YaerlyVacation, 0) AS YaerlyVacation ,
                    ISNULL(YearlyTiket, 0) AS TiketValue ,
                    date_driver_2 AS LastVacation ,
                    0 AS VacationToNow ,
                    0 AS ValueOFStellVacation ,
                    0.0000 AS BadalTekit ,
                    0.0000 AS EndValue ,
                    0 AS YYYY ,
                    0 AS MM ,
                    0 AS DD ,
                    0.0000 ,
                    0.0000 ,
                    ISNULL(YaerlyVacation, 0) ,
                    ISNULL(VacPrevious, 0) ,
                    @DateSet ,
                    @ActionName ,
                    Nationality ,
                    depart_name ,
                    date_driver1 ,
                    0
            FROM    dbo.VEmp
            WHERE   VEmp.flag = 1
                     AND ((SELECT ISNULL(COUNT(*),0) FROM @List)= 0 OR vemp.emp_code IN(SELECT * FROM @List) ) 





    IF @Vacation = 1
        BEGIN

            UPDATE  Emp_Mosta7kat
            SET     ActionName += ':اجازه سنويه:'
        END
       

    IF @EndService = 1
        BEGIN

            UPDATE  Emp_Mosta7kat
            SET     ActionName += ':نهاية خدمه:'
        END


    IF @Estekala = 1
        BEGIN

            UPDATE  Emp_Mosta7kat
            SET     ActionName += ':استقاله:'
        END

    IF @Yearly = 1
        BEGIN

            UPDATE  Emp_Mosta7kat
            SET     ActionName = 'القيد السنوى'

        END



            
    DECLARE @thisyar AS DATE 

    SET @thisyar = CONVERT(DATE, '01-01-'
        + CAST(DATEPART(YEAR, @DateSet) AS CHAR(4)), 103)
                                                             
       

        

    UPDATE  Emp_Mosta7kat
    SET     Daythisyear = dbo.db_DateDiff('DD', @thisyar, @DateSet) + 1
             


    UPDATE  Emp_Mosta7kat
    SET     Daythisyear = CASE WHEN Daythisyear < 365 THEN ( Daythisyear )
                               ELSE ( 365 )
                          END




	 
    UPDATE  Emp_Mosta7kat
    SET     VacationToNow = dbo.db_DateDiff('DD', DateBackTo_job, @DateSet)
            + 1
                                                        
                


    UPDATE  Emp_Mosta7kat
    SET     DayCountToEnd = dbo.db_DateDiff('DD', emp_jopdate, @DateSet) + 1
            


    UPDATE  Emp_Mosta7kat
    SET     YYYY = dbo.db_DateDiff('YY', emp_jopdate, @DateSet)


    UPDATE  Emp_Mosta7kat
    SET     MM = ( dbo.db_DateDiff('MM', emp_jopdate, @DateSet) ) - ( YYYY
                                                              * 12 )
 
  


    UPDATE  Emp_Mosta7kat
    SET     DD = ( DayCountToEnd ) - ( ( YYYY * 365 ) + ( MM * 30 ) )


        

    IF @Vacation = 1
        OR @Yearly = 1
        BEGIN

		     --UPDATE  Emp_Mosta7kat
       -- SET     ValueOFStellVacation = ((( YaerlyVacation * dbo.db_DateDiff('MM', emp_jopdate, @DateSet) ) / 12)-(SELECT COUNT(Emp_Code) FROM dbo.Emp_Vacation WHERE Emp_Code = Emp_Mosta7kat .emp_code AND dbo.Emp_Vacation.Vacyear = @year ))


            UPDATE  Emp_Mosta7kat
            SET     ValueOFStellVacation = ( YaerlyVacation / 30 )
                    * ( emp_sallery * VacationToNow ) / 360
        END


			 

    UPDATE  Emp_Mosta7kat
    SET     BadalTekit = TiketValue

        
 



    IF @EndService = 1
        BEGIN

            UPDATE  Emp_Mosta7kat
            SET     First5 = CASE WHEN ( YYYY > 5 )
                                  THEN ( emp_sallery * 5 / 2 )
                                  ELSE ( YYYY * ( emp_sallery / 2 ) )
                             END

		  
            UPDATE  Emp_Mosta7kat
            SET     BakyModa = CASE WHEN ( YYYY > 5 )
                                    THEN ( emp_sallery * ( YYYY - 5 ) )
                                    ELSE ( 0.0000 )
                               END
                         


            UPDATE  Emp_Mosta7kat
            SET     BakyModa = CASE WHEN ( YYYY > 5 )
                                    THEN ( emp_sallery * ( ( ( MM * 30 )
                                                             + ( DD ) )
                                                           / 365.0000 ) )
                                    ELSE ( ( emp_sallery / 2 ) * ( ( MM * 30 )
                                                              + ( DD ) )
                                           / 365.0000 )
                               END

        END







    IF @Yearly = 1
        BEGIN

            UPDATE  Emp_Mosta7kat
            SET     First5 = CASE WHEN ( YYYY > 5 ) THEN ( emp_sallery )
                                  ELSE ( Daythisyear / 365 * ( emp_sallery / 2 ) )
                             END
 
             

        END





    IF @Estekala = 1
        BEGIN

            UPDATE  Emp_Mosta7kat
            SET     First5 = CASE WHEN ( YYYY > 5 )
                                  THEN ( emp_sallery * 5 / 2 ) * 1 / 3
                                  ELSE ( YYYY * ( emp_sallery / 2 ) ) * 1 / 3
                             END

		  
            UPDATE  Emp_Mosta7kat
            SET     BakyModa = CASE WHEN ( YYYY > 5 )
                                    THEN ( emp_sallery * ( YYYY - 5 ) ) * 2
                                         / 3
                                    ELSE ( 0.0000 )
                               END
                         

            UPDATE  Emp_Mosta7kat
            SET     BakyModa = CASE WHEN ( YYYY > 10 )
                                    THEN ( emp_sallery * ( YYYY - 10 ) )
                                    ELSE ( 0.0000 )
                               END



            UPDATE  Emp_Mosta7kat
            SET     BakyModa = CASE WHEN ( YYYY > 10 )
                                    THEN ( emp_sallery * ( ( ( MM * 30 )
                                                             + ( DD ) )
                                                           / 365.0000 ) )
                                    ELSE ( 0 )
                               END



            UPDATE  Emp_Mosta7kat
            SET     BakyModa = CASE WHEN ( YYYY > 5 )
                                    THEN ( emp_sallery * ( ( ( MM * 30 )
                                                             + ( DD ) )
                                                           / 365.0000 ) ) * 2
                                         / 3
                                    ELSE ( ( emp_sallery / 2 ) * ( ( MM * 30 )
                                                              + ( DD ) )
                                           / 365.0000 ) * 1 / 3
                               END



          



        END


    UPDATE  Emp_Mosta7kat
    SET     EndValue = ISNULL(First5, 0.00) + ISNULL(BakyModa, 0.00)


    UPDATE  Emp_Mosta7kat
    SET     EndValue = ISNULL(First5, 0.00) + ISNULL(BakyModa, 0.00)

