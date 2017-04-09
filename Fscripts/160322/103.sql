 

 
ALTER   PROCEDURE [dbo].[Emp_Nhayat_Service]
    @code CHAR(50) = '0' ,
    @code1 CHAR(20) = '99999999' ,
    @Fdepart CHAR(20) = '0' ,
    @Tdepart CHAR(20) = '999' ,
    @Fcomp CHAR(20) = '0' ,
    @Tcomp CHAR(20) = '999' ,
    @FBranch CHAR(20) = '0' ,
    @TBranch CHAR(20) = '999' ,
    @DateSet DATE ,
    @year INT ,
    @Vacation INT ,
    @EndService INT ,
    @Estekala INT ,
    @Yearly INT ,
    @ActionName NVARCHAR(50) = ''
AS
    CREATE TABLE #Fixed
        (
          Srial INT IDENTITY ,
          emp_code BIGINT NULL ,
          emp_name NVARCHAR(100) COLLATE Arabic_CI_Ai ,
          jname NVARCHAR(50) COLLATE Arabic_CI_Ai ,
          emp_jopdate DATE ,
          DayCountToEnd DECIMAL(18) ,
          emp_sallery FLOAT ,
          TotalSalary FLOAT ,
          ContractTime BIGINT ,
          YearlyVacation DECIMAL(18, 4) ,
          TiketValue DECIMAL(18) ,
          LastVacation DATE ,
          VacationToNow INT ,
          ValueOFStellVacation DECIMAL(18) ,
          BadalTekit VARCHAR(50) ,
          EndValue DECIMAL(18) ,
          YYYY BIGINT ,
          MM BIGINT ,
          DD BIGINT ,
          First5 DECIMAL(18, 4) ,
          BakyModa DECIMAL(18, 4) ,
          BakyModa10 DECIMAL(18, 4) ,
          BakyModaDay DECIMAL(18, 4) ,
          YaerlyVacation DECIMAL(18, 4) ,
          VacPrevious BIGINT ,
          DateSet DATE ,
          Nationality NVARCHAR(50) ,
          Department NVARCHAR(50) ,
          DateBackTo_job DATE ,
          Daythisyear DECIMAL(18) ,
          OutServiceDays FLOAT ,
          ActionName NVARCHAR(50) ,
          costid BIGINT ,
          costname NVARCHAR(MAX) ,
          emp_Take_Bus FLOAT ,
          emp_Take_Food FLOAT ,
          HavezEntetzam FLOAT ,
          emp_Take_Home FLOAT ,
          emp_Take_other FLOAT ,
          Dengers FLOAT ,
          Take_Schole FLOAT ,
          emp_tamensallery FLOAT ,
          emp_tamensalleryCanged FLOAT ,
        )

    BEGIN
	
 

        INSERT  INTO #Fixed
                SELECT  emp_code ,
                        emp_name ,
                        jname ,
                        emp_jopdate ,
                        0 AS DayCountToEnd ,
                        0 AS emp_sallery ,
                        0 AS TotalSalary ,
                        ISNULL(contract_period, 0) AS ContractTime ,
                        ISNULL(YaerlyVacation, 0) AS YaerlyVacation ,
                        ISNULL(YearlyTiket, 0) AS TiketValue ,
                        StatusDate AS LastVacation ,
                        0 AS VacationToNow ,
                        0 AS ValueOFStellVacation ,
                        0.0000 AS BadalTekit ,
                        0.0000 AS EndValue ,
                        0 AS YYYY ,
                        0 AS MM ,
                        0 AS DD ,
                        0.0000 ,
                        0.0000 ,
                        0.0000 ,
                        0.0000 ,
                        ISNULL(YaerlyVacation, 0) ,
                        ISNULL(VacPrevious, 0) ,
                        @DateSet ,
                        Nationality ,
                        depart_name ,
                        StatusDate ,
                        0 ,
                        0 ,
                        @ActionName ,
                        CostID ,
                        CostName ,
                        emp_Take_Bus ,
                        emp_Take_Food ,
                        HavezEntetzam ,
                        emp_Take_Home ,
                        emp_Take_other ,
                        Dengers ,
                        Take_Schole ,
                        emp_tamensallery ,
                        emp_tamensalleryCanged
                FROM    dbo.VEmp
                WHERE   VEmp.flag = 1
                        AND VEmp.Sec_id >= @FBranch
                        AND VEmp.Sec_id <= @TBranch
                        AND VEmp.depart_id >= @Fdepart
                        AND VEmp.depart_id <= @Tdepart
                        AND VEmp.emp_code >= CAST(@code AS INT)
                        AND VEmp.emp_code <= CAST(@code1 AS INT)









--شركة مدرارا


        UPDATE  #Fixed
        SET     emp_sallery = ( ISNULL(emp_sallery, 0)
                                + ISNULL(emp_tamensallery, 0)
                                + ISNULL(emp_tamensalleryCanged, 0) )
                                





        UPDATE  #Fixed
        SET     TotalSalary = ( ISNULL(emp_sallery, 0) + ISNULL(emp_Take_Bus,
                                                              0)
                                + ISNULL(emp_Take_Food, 0)
                                + ISNULL(HavezEntetzam, 0)
                                + ISNULL(emp_Take_Home, 0)
                                + ISNULL(emp_Take_other, 0)
                                + ISNULL(Take_Schole, 0) )


--===============================================================================================
     






        DECLARE @thisyar AS DATE 

        SET @thisyar = CONVERT(DATE, '01-01-'
            + CAST(DATEPART(YEAR, @DateSet) AS CHAR(4)), 103)
                                                             
       
        UPDATE  #Fixed
        SET     OutServiceDays = ( SELECT   COUNT(Emp_Code)
                                   FROM     dbo.emp_ghyab_bezn
                                   WHERE    dbo.emp_ghyab_bezn.Emp_Code = #Fixed.emp_code
                                 ) 

        

        UPDATE  #Fixed
        SET     Daythisyear = dbo.db_DateDiff('DD', @thisyar, @DateSet) + 1
             


        --UPDATE  #Fixed
        --SET     Daythisyear = CASE WHEN Daythisyear < 365 THEN ( Daythisyear )
        --                           ELSE ( 365 )
        --                      END



                --UPDATE  #Fixed
                --SET     YYYY = CASE WHEN DayCountToEnd >= 365 THEN ( 1 )
                --                    ELSE ( 0 )
                --               END


                --UPDATE  #Fixed
                --SET     MM = ( dbo.db_DateDiff('MM', emp_jopdate, @DateSet) )
                        


                --UPDATE  #Fixed
                --SET     MM = CASE WHEN MM < 12 THEN ( mm )
                --                  ELSE ( 0 )
                --             END

  

	 
        UPDATE  #Fixed
        SET     VacationToNow = dbo.db_DateDiff('DD', DateBackTo_job, @DateSet)
                + 1
                                                        
                


        UPDATE  #Fixed
        SET     DayCountToEnd = dbo.db_DateDiff('DD', emp_jopdate, @DateSet)
                - OutServiceDays + 1
            
 


        UPDATE  #Fixed
        SET     YYYY = DayCountToEnd / 365.25

        --UPDATE  #Fixed
        --SET     YYYY = dbo.db_DateDiff('YY', emp_jopdate, @DateSet)





        UPDATE  #Fixed
        SET     MM = ( DayCountToEnd / 30.4375 ) - ( YYYY * 12 )

        --UPDATE  #Fixed
        --SET     MM = ( dbo.db_DateDiff('MM', emp_jopdate, @DateSet) ) - ( YYYY * 12 )
        --                                                     
 
  
        UPDATE  #Fixed
        SET     DD = ( DayCountToEnd ) - ( ( YYYY * 365.25 ) + ( MM * 30.4375 ) )


        

        IF @Vacation = 1
            BEGIN

                UPDATE  #Fixed
                SET     ValueOFStellVacation = ( YaerlyVacation / 30 )
                        * ( ( emp_sallery ) * VacationToNow ) / 360
            END



			--مستحقات الاجازة فى القيد السنوى
        IF @Yearly = 1
            BEGIN

                --UPDATE  #Fixed
                --SET     ValueOFStellVacation = ( YaerlyVacation / 30 ) * ( ( emp_sallery )
                --            * CASE WHEN ( VacationToNow > 365 ) THEN ( 365 )
                --                   ELSE ( VacationToNow )
                --              END ) / 360

				 UPDATE  #Fixed
                SET     ValueOFStellVacation = ( YaerlyVacation / 30 ) *  ( CASE WHEN ( DayCountToEnd > 365 )
                                                  THEN ( emp_sallery )
                                                  ELSE ( DayCountToEnd / 365
                                                         * ( emp_sallery ) )
                                             END  )
         
            END

			--مستحقات نهاية الخدمة فى القيد السنوى
        IF @Yearly = 1
            BEGIN

                UPDATE  #Fixed
                SET     First5 = CASE WHEN ( YYYY > 5 ) THEN ( TotalSalary )
                                      ELSE ( CASE WHEN ( DayCountToEnd > 365 )
                                                  THEN ( TotalSalary / 2 )
                                                  ELSE ( DayCountToEnd / 365
                                                         * ( TotalSalary / 2 ) )
                                             END )
                                 END
            END





			 

        UPDATE  #Fixed
        SET     BadalTekit = TiketValue

        
 



        IF @EndService = 1
            BEGIN

                UPDATE  #Fixed
                SET     First5 = CASE WHEN ( YYYY > 5 )
                                      THEN ( TotalSalary * 5 / 2 )
                                      ELSE ( YYYY * ( TotalSalary / 2 ) )
                                 END

               

		  
                UPDATE  #Fixed
                SET     BakyModa = CASE WHEN ( YYYY > 5 )
                                        THEN ( TotalSalary * ( YYYY - 5 ) )
                                        ELSE ( 0.0000 )
                                   END
                         


                UPDATE  #Fixed
                SET     BakyModaDay = CASE WHEN ( YYYY >= 5 )
                                           THEN ( TotalSalary ) * ( ( MM * 30 )
                                                              + ( DD ) ) / 365
                                           ELSE ( TotalSalary / 2 ) * ( ( MM
                                                              * 30 ) + ( DD ) )
                                                / 365
                                      END 

            END












        IF @Estekala = 1
            BEGIN

                UPDATE  #Fixed
                SET     First5 = CASE WHEN ( YYYY >= 5 )
                                      THEN ( TotalSalary * 5 / 2 ) * 1 / 3
                                      ELSE ( YYYY * ( TotalSalary / 2 ) ) * 1
                                           / 3
                                 END

		  
                UPDATE  #Fixed
                SET     BakyModa = CASE WHEN ( YYYY > 5 )
                                        THEN CASE WHEN ( YYYY < 10 )
                                                  THEN ( TotalSalary )
                                                       * ( YYYY - 5 ) * 2 / 3
                                                  ELSE ( BakyModa )
                                             END
                                        ELSE ( BakyModa )
                                   END


                UPDATE  #Fixed
                SET     BakyModa = CASE WHEN ( YYYY >= 10 )
                                        THEN TotalSalary * ( 5 ) * 2 / 3
                                        ELSE ( 0.0000 )
                                   END


            


                UPDATE  #Fixed
                SET     BakyModa10 = CASE WHEN ( YYYY > 10 )
                                          THEN ( TotalSalary * ( YYYY - 10 ) )
                                          ELSE ( 0.0000 )
                                     END



                UPDATE  #Fixed
                SET     BakyModaDay = CASE WHEN ( YYYY < 5 )
                                           THEN ( TotalSalary ) * ( ( ( MM
                                                              * 30 ) + ( DD ) )
                                                              / 365.0000 ) * 1
                                                / 3
                                           ELSE ( 0 )
                                      END



                UPDATE  #Fixed
                SET     BakyModaDay = CASE WHEN ( YYYY >= 5 )
                                           THEN CASE WHEN ( YYYY < 10 )
                                                     THEN ( TotalSalary )
                                                          * ( ( ( MM * 30 )
                                                              + ( DD ) )
                                                              / 365.0000 ) * 2
                                                          / 3
                                                     ELSE ( 0 )
                                                END
                                           ELSE ( 0 )
                                      END

                UPDATE  #Fixed
                SET     BakyModaDay = CASE WHEN ( YYYY >= 10 )
                                           THEN ( TotalSalary ) * ( ( ( MM
                                                              * 30 ) + ( DD ) )
                                                              / 365.0000 )
                                           ELSE ( 0 )
                                      END





            END


        UPDATE  #Fixed
        SET     EndValue = ISNULL(First5, 0.00) + ISNULL(BakyModa, 0.00)
                + ISNULL(BakyModa10, 0.00) + ISNULL(BakyModaDay, 0.00)


 




        SELECT  *
        FROM    #Fixed
        ORDER BY emp_code
    END


	