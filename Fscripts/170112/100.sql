 
ALTER PROCEDURE [dbo].[Supplier_Accoutn_SP]
    @datefrom DATE ,
    @Year INT ,
    @CaseID INT ,
    @venderid BIGINT ,
    @CurID INT = 1 ,
    @dateTo DATE ,
    @SuppTypeID INT = 0 ,
    @Detailed INT ,
    @Lang NVARCHAR(2) = 'AR'
AS
    BEGIN
	
        CREATE TABLE #Result
            (
              TypeName NVARCHAR(MAX) ,
              venderid BIGINT ,
              suppliers_name NVARCHAR(MAX) ,
              actionname NVARCHAR(250) ,
              Invcomno BIGINT ,
              invno_ormony_id BIGINT ,
              movedate DATE ,
              maden FLOAT ,
              daen FLOAT ,
              Raseed FLOAT ,
              Notes NVARCHAR(MAX) ,
              CaseName NVARCHAR(MAX) ,
              Journal NVARCHAR(250) ,
              DocNo NVARCHAR(MAX) ,
              Short_Name_EN NVARCHAR(MAX) ,
              Short_Name_Ar NVARCHAR(MAX) ,
              Supplier_Name_EN NVARCHAR(MAX) ,
             
            );


			--خطابات الضمان

        IF @CaseID = 400
            BEGIN
		
                INSERT  INTO #Result
                        ( TypeName ,
                          venderid ,
                          suppliers_name ,
                          actionname ,
                          Invcomno ,
                          invno_ormony_id ,
                          movedate ,
                          maden ,
                          daen ,
                          Raseed ,
                          Notes ,
                          CaseName ,
                          Journal ,
                          DocNo ,
                          Short_Name_EN ,
                          Short_Name_Ar ,
                          Supplier_Name_EN
			            )
                        SELECT  N'خطاب ضمان' , -- TypeName - nvarchar(max)
                                Letter_of_Guarantee_Used.VedorID , -- venderid - bigint
                                suppliers_name , -- suppliers_name - nvarchar(max)
                                N'خطابات ضمان' , -- actionname - nvarchar(250)
                                0 , -- Invcomno - bigint
                                0 , -- invno_ormony_id - bigint
                                Letter_of_Guarantee_Used.Date_End , -- movedate - date
                                Collateral_Value , -- maden - float
                                0.0 , -- daen - float
                                0.0 , -- Raseed - float
                                Letter_of_Guarantee_Used.Notes , -- Notes - nvarchar(max)
                                N'' , -- CaseName - nvarchar(max)
                                Letter_of_Guarantee_Used.Journal , -- Journal - nvarchar(250)
                                Letter_of_Guarantee_Used.Collateral_NO , -- DocNo - nvarchar(max)
                                Short_Name_EN , -- Short_Name_EN - nvarchar(max)
                                Short_Name_Ar , -- Short_Name_Ar - nvarchar(max)
                                Supplier_Name_EN  -- Supplier_Name_EN - nvarchar(max)
                        FROM    dbo.Letter_of_Guarantee_Used
                                INNER JOIN dbo.suppliers ON suppliers.suppliers_id = Letter_of_Guarantee_Used.VedorID
                        WHERE   ( @venderid = 0
                                  OR VedorID = @venderid
                                )
                              


                UPDATE  #Result
                SET     daen = ( SELECT ISNULL(SUM(daen) - SUM(maden), 0.00)
                                 FROM   venderaccount
                                 WHERE  year = @Year
                                        AND movedate BETWEEN @datefrom AND @dateTo
                                        AND CurID = @CurID
                                        
                                        AND ( 
                                                venderid = #Result.venderid
                                            )
                               
                                        
                               )

							  


            END;



			-- الاعتمادات المستندية


        IF @CaseID = 500
            BEGIN
		
               
			    INSERT  INTO #Result
                        ( TypeName ,
                          venderid ,
                          suppliers_name ,
                          actionname ,
                          Invcomno ,
                          invno_ormony_id ,
                          movedate ,
                          maden ,
                          daen ,
                          Raseed ,
                          Notes ,
                          CaseName ,
                          Journal ,
                          DocNo ,
                          Short_Name_EN ,
                          Short_Name_Ar ,
                          Supplier_Name_EN
			            )
                        SELECT  N'اعتمادات مستندية' , -- TypeName - nvarchar(max)
                                Documentary_of_Guarantee_Used.VendorID , -- venderid - bigint
                                suppliers_name , -- suppliers_name - nvarchar(max)
                                N'اعتمادات مستندية' , -- actionname - nvarchar(250)
                                0 , -- Invcomno - bigint
                                0 , -- invno_ormony_id - bigint
                                Documentary_of_Guarantee_Used.Date_End , -- movedate - date
                                Collateral_Value , -- maden - float
                                0.0 , -- daen - float
                                0.0 , -- Raseed - float
                                Documentary_of_Guarantee_Used.Notes , -- Notes - nvarchar(max)
                                N'' , -- CaseName - nvarchar(max)
                                Documentary_of_Guarantee_Used.Journal , -- Journal - nvarchar(250)
                                Documentary_of_Guarantee_Used.Collateral_NO , -- DocNo - nvarchar(max)
                                Short_Name_EN , -- Short_Name_EN - nvarchar(max)
                                Short_Name_Ar , -- Short_Name_Ar - nvarchar(max)
                                Supplier_Name_EN  -- Supplier_Name_EN - nvarchar(max)
                        FROM    dbo.Documentary_of_Guarantee_Used
                                INNER JOIN dbo.suppliers ON suppliers.suppliers_id = Documentary_of_Guarantee_Used.VendorID
                        WHERE   ( @venderid = 0
                                  OR VendorID = @venderid
                                )
                              


                UPDATE  #Result
                SET     daen = ( SELECT ISNULL(SUM(daen) - SUM(maden), 0.00)
                                 FROM   venderaccount
                                 WHERE  year = @Year
                                        AND movedate BETWEEN @datefrom AND @dateTo
                                        AND CurID = @CurID
                                        
                                        AND ( 
                                                venderid = #Result.venderid
                                            )
                               
                                        )

            END



        IF @CaseID < 400
            BEGIN 


                INSERT  INTO #Result
                        ( TypeName ,
                          venderid ,
                          suppliers_name ,
                          actionname ,
                          Invcomno ,
                          invno_ormony_id ,
                          movedate ,
                          maden ,
                          daen ,
                          Raseed ,
                          Notes ,
                          CaseName ,
                          Journal ,
                          DocNo ,
                          Short_Name_EN ,
                          Short_Name_Ar ,
                          Supplier_Name_EN
			            )
                        SELECT  TypeName ,
                                venderid ,
                                CASE WHEN ( @Lang = 'AR' )
                                     THEN ( suppliers_name )
                                     ELSE ( Supplier_Name_EN )
                                END AS suppliers_name ,
                                NULL AS actionname ,
                                0 AS Invcomno ,
                                0 AS invno_ormony_id ,
                                @datefrom AS movedate ,
                                SUM(ISNULL(maden, 0.00)) AS maden ,
                                SUM(ISNULL(daen, 0.00)) AS daen ,
                                ISNULL(SUM(daen) - SUM(maden), 0.00) AS Raseed ,
                                'رصيد ماقبله' AS Notes ,
                                0 ,
                                0 AS Journal ,
                                '' AS DocNo ,
                                Short_Name_EN ,
                                Short_Name_Ar ,
                                Supplier_Name_EN
                        FROM    vvenderaccount
                        WHERE   year = @Year
                                AND movedate < @datefrom
                                AND CurID = @CurID
                                AND ( @SuppTypeID = 0
                                      OR SuppTypeID = @SuppTypeID
                                    )
                                AND ( @CaseID = 0
                                      OR CaseID = @CaseID
                                    )
                                AND ( @venderid = 0
                                      OR venderid = @venderid
                                    )
                        GROUP BY suppliers_name ,
                                venderid ,
                                TypeName ,
                                Supplier_Name_EN ,
                                Short_Name_EN ,
                                Short_Name_Ar ,
                                TypeName;


                IF @Detailed = 1
                    BEGIN 

                        INSERT  INTO #Result
                                ( TypeName ,
                                  venderid ,
                                  suppliers_name ,
                                  actionname ,
                                  Invcomno ,
                                  invno_ormony_id ,
                                  movedate ,
                                  maden ,
                                  daen ,
                                  Raseed ,
                                  Notes ,
                                  CaseName ,
                                  Journal ,
                                  DocNo ,
                                  Short_Name_EN ,
                                  Short_Name_Ar ,
                                  Supplier_Name_EN
			                    )
                                SELECT  TypeName ,
                                        venderid ,
                                        CASE WHEN ( @Lang = 'AR' )
                                             THEN ( suppliers_name )
                                             ELSE ( Supplier_Name_EN )
                                        END AS suppliers_name ,
                                        actionname ,
                                        Invcomno ,
                                        invno_ormony_id ,
                                        movedate ,
                                        maden ,
                                        daen ,
                                        Raseed ,
                                        Notes ,
                                        CaseName ,
                                        Journal ,
                                        DocNo ,
                                        Short_Name_EN ,
                                        Short_Name_Ar ,
                                        Supplier_Name_EN
                                FROM    vvenderaccount
                                WHERE   year = @Year
                                        AND movedate BETWEEN @datefrom AND @dateTo
                                        AND CurID = @CurID
                                        AND ( @SuppTypeID = 0
                                              OR SuppTypeID = @SuppTypeID
                                            )
                                        AND ( @venderid = 0
                                              OR venderid = @venderid
                                            )
                                        AND ( @CaseID = 0
                                              OR CaseID = @CaseID
                                            )
                                ORDER BY venderid ,
                                        movedate;


                    END;
                        

                IF @Detailed = 0
                    BEGIN 

                        INSERT  INTO #Result
                                ( TypeName ,
                                  venderid ,
                                  suppliers_name ,
                                  actionname ,
                                  Invcomno ,
                                  invno_ormony_id ,
                                  movedate ,
                                  maden ,
                                  daen ,
                                  Raseed ,
                                  Notes ,
                                  CaseName ,
                                  Journal ,
                                  DocNo ,
                                  Short_Name_EN ,
                                  Short_Name_Ar ,
                                  Supplier_Name_EN
			                    )
                                SELECT  TypeName ,
                                        venderid ,
                                        CASE WHEN ( @Lang = 'AR' )
                                             THEN ( suppliers_name )
                                             ELSE ( Supplier_Name_EN )
                                        END AS suppliers_name ,
                                        NULL AS actionname ,
                                        NULL AS Invcomno ,
                                        NULL AS invno_ormony_id ,
                                        @dateTo AS movedate ,
                                        ISNULL(SUM(maden), 00) AS maden ,
                                        ISNULL(SUM(daen), 0.00) AS daen ,
                                        ISNULL(SUM(daen) - SUM(maden), 0.00) AS Raseed ,
                                        NULL AS Notes ,
                                        NULL AS CaseName ,
                                        NULL AS Journal ,
                                        NULL AS DocNo ,
                                        Short_Name_EN ,
                                        Short_Name_Ar ,
                                        Supplier_Name_EN
                                FROM    vvenderaccount
                                WHERE   year = @Year
                                        AND movedate BETWEEN @datefrom AND @dateTo
                                        AND CurID = @CurID
                                        AND ( @SuppTypeID = 0
                                              OR SuppTypeID = @SuppTypeID
                                            )
                                        AND ( @CaseID = 0
                                              OR CaseID = @CaseID
                                            )
                                        AND ( @venderid = 0
                                              OR venderid = @venderid
                                            )
                                GROUP BY venderid ,
                                        suppliers_name ,
                                        TypeName ,
                                        Short_Name_EN ,
                                        Short_Name_Ar ,
                                        Supplier_Name_EN;


                    END;



            END; 




        SELECT  *
        FROM    #Result
        ORDER BY venderid ,
                movedate; 


    END;
