
 

ALTER  PROCEDURE [dbo].[Customer_Account_SP]
    @datefrom DATE ,
    @Year INT ,
    @CaseID INT ,
    @venderid BIGINT ,
    @CurID INT = 1 ,
    @dateTo DATE ,
    @Mcid INT = 0 ,
    @Detailed INT
AS
    BEGIN


        CREATE TABLE #Result
            (
              id INT ,
              venderid BIGINT ,
              customer_name NVARCHAR(250) ,
              actionname NVARCHAR(250) ,
              invno_ormony_id INT ,
              movedate DATE ,
              maden FLOAT ,
              daen FLOAT ,
              Notes NVARCHAR(250) ,
              Detail NVARCHAR(250) ,
              asDetail2 NVARCHAR(250) ,
              Descount FLOAT ,
              raseed FLOAT ,
              CaseName NVARCHAR(50) ,
              Journal INT ,
              DocNo NVARCHAR(50),
			  MnOmola DECIMAL ,
			  MandopName NVARCHAR(50),
			  MandopPercent DECIMAL ,
			  MandopID INT 
            );

      
        INSERT  INTO #Result
                ( id ,
                  venderid ,
                  customer_name ,
                  actionname ,
                  invno_ormony_id ,
                  movedate ,
                  maden ,
                  daen ,
                  Notes ,
                  Detail ,
                  asDetail2 ,
                  Descount ,
                  raseed ,
                  CaseName ,
                  Journal ,
                  DocNo,MnOmola,MandopName,MandopPercent,MandopID
			    )
                SELECT  0 AS id ,
                        venderid ,
                        customer_name ,
                        null AS actionname ,
                        null AS invno_ormony_id ,
                       @datefrom AS movedate ,
                        SUM(ISNULL(maden, 0.00)) AS maden ,
                        SUM(ISNULL(daen, 0.00)) AS daen ,
                        '—’Ìœ „«ﬁ»·Â' AS Notes ,
                        null AS Detail ,
                        NULL AS  asDetail2 ,
                        0.00 AS Descount ,
                         ISNULL(SUM(maden) - SUM(daen), 0.00) AS raseed ,
                        null AS CaseName ,
                        null AS Journal ,
                        null AS DocNo,
						0,0,
						0,0
                FROM    vcustomeraccount
                WHERE   year = @Year
                        AND ( @CaseID = 0
                              OR CaseID = @CaseID
                            )
                        AND ( @venderid = 0
                              OR venderid = @venderid
                            )
                        AND ( movedate < @datefrom )
                        AND ( CurID = @CurID )
                        AND ( @Mcid = 0
                              OR Mcid = @Mcid
                            )
                GROUP BY customer_name ,
                        venderid;
			

        IF @Detailed = 1
            BEGIN
                INSERT  INTO #Result
                        ( id ,
                          venderid ,
                          customer_name ,
                          actionname ,
                          invno_ormony_id ,
                          movedate ,
                          maden ,
                          daen ,
                          Notes ,
                          Detail ,
                          asDetail2 ,
                          Descount ,
                          raseed ,
                          CaseName ,
                          Journal ,
                          DocNo,MnOmola,MandopName,MandopPercent,MandopID
			            )
                        SELECT  id ,
                                venderid ,
                                customer_name ,
                                actionname ,
                                invno_ormony_id ,
                                movedate ,
                                ISNULL(maden, 0.00) AS maden ,
                                ISNULL(daen, 0.00) AS daen ,
                                Notes ,
                                Detail ,
                                Detail2 ,
                                Descount ,
                                0.00 AS raseed ,
                                CaseName ,
                                Journal ,
                                DocNo,0,0,
						0,0
                        FROM    vcustomeraccount
                        WHERE   year = @Year
                                AND ( @CaseID = 0
                                      OR CaseID = @CaseID
                                    )
                                AND ( @venderid = 0
                                      OR venderid = @venderid
                                    )
                                AND ( movedate BETWEEN @datefrom AND @dateTo )
                                AND ( CurID = @CurID )
                                AND ( @Mcid = 0
                                      OR Mcid = @Mcid
                                    )
                      
          
            END;
          

        IF @Detailed = 0
            BEGIN 
               
                INSERT  INTO #Result
                        ( id ,
                          venderid ,
                          customer_name ,
                          actionname ,
                          invno_ormony_id ,
                          movedate ,
                          maden ,
                          daen ,
                          Notes ,
                          Detail ,
                          asDetail2 ,
                          Descount ,
                          raseed ,
                          CaseName ,
                          Journal ,
                          DocNo,MnOmola,MandopName,MandopPercent,MandopID
			            )
                        SELECT  0 AS id ,
                                venderid ,
                                customer_name ,
                                null AS actionname ,
                                null AS invno_ormony_id ,
                                @dateTo AS movedate ,
                                ISNULL(SUM(maden), 0.00) AS maden ,
                                ISNULL(SUM(daen), 0.00) AS daen ,
                                'Total' AS Notes ,
                                null AS Detail ,
                                null AS Detail2 ,
                                0 AS Descount ,
                               ISNULL(SUM(maden) - SUM(daen), 0.00) AS Raseed  ,
                                null AS CaseName ,
                                null AS Journal ,
                               null AS DocNo,0,'',
						0,0
                        FROM    vcustomeraccount
                        WHERE   year = @Year
                                AND ( @CaseID = 0
                                      OR CaseID = @CaseID
                                    )
                                AND ( @venderid = 0
                                      OR venderid = @venderid
                                    )
                                AND ( movedate BETWEEN @datefrom AND @dateTo )
                                AND ( CurID = @CurID )
                                AND ( @Mcid = 0
                                      OR Mcid = @Mcid
                                    )
                        GROUP BY customer_name ,
                                venderid
                        
          
            END;
			
			



				BEGIN TRY		

				UPDATE #Result SET MandopID = (SELECT TOP 1 MandopID FROM dbo.Customer_Mandop WHERE CustID = #Result.venderid)

				UPDATE #Result SET MandopName = (SELECT MandopName FROM dbo.customer_emp WHERE MandopID = #Result.MandopID)

		    	UPDATE #Result SET MandopPercent = (SELECT PercentVaue FROM dbo.customer_emp WHERE MandopID = #Result.MandopID)

				UPDATE #Result SET MnOmola =( daen * MandopPercent)/100
				END TRY

				BEGIN CATCH
				END CATCH

 

			SELECT * FROM #Result ORDER BY  venderid ,movedate 
				
    END;
