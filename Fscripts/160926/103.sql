 
 
ALTER PROCEDURE [dbo].[Supplier_Accoutn_SP]
    @datefrom DATE ,
    @Year INT ,
    @CaseID INT ,
    @venderid BIGINT ,
    @CurID INT = 1 ,
    @dateTo DATE ,
    @SuppTypeID INT = 0 ,
    @Detailed INT,
	@Lang NVARCHAR(2)= 'AR'
AS
    BEGIN
	
        CREATE TABLE #Result
            (
              TypeName NVARCHAR(max) ,
              venderid BIGINT ,
              suppliers_name NVARCHAR(max) ,
              actionname NVARCHAR(250) ,
              Invcomno BIGINT ,
              invno_ormony_id BIGINT ,
              movedate DATE ,
              maden FLOAT ,
              daen FLOAT ,
              Raseed FLOAT ,
			  Notes NVARCHAR(max),
              CaseName NVARCHAR(max),
              Journal NVARCHAR(250) ,
              DocNo NVARCHAR(max) ,
              Short_Name_EN NVARCHAR(max) ,
              Short_Name_Ar NVARCHAR(max) ,
              Supplier_Name_EN NVARCHAR(max) ,
             
            );



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
                      CASE WHEN (@Lang='AR') THEN (suppliers_name) else  (Supplier_Name_EN) END AS suppliers_name  ,
                        NULL  AS actionname ,
                        0 AS Invcomno ,
                        0 AS invno_ormony_id ,
                        @datefrom AS movedate ,
                        SUM(ISNULL(maden, 0.00)) AS maden ,
                        SUM(ISNULL(daen, 0.00)) AS daen ,
                        ISNULL(SUM(daen)- SUM(maden), 0.00) AS Raseed   ,
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
                  AND (@venderid = 0 OR venderid = @venderid)
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
                               CASE WHEN (@Lang='AR') THEN (suppliers_name) else  (Supplier_Name_EN) END AS suppliers_name  ,
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
                          AND (@venderid = 0 OR venderid = @venderid)
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
                               CASE WHEN (@Lang='AR') THEN (suppliers_name) else  (Supplier_Name_EN) END AS suppliers_name  ,
                                NULL AS actionname ,
                                NULL AS Invcomno ,
                                 NULL AS invno_ormony_id ,
                                @dateTo AS movedate ,
                                ISNULL(SUM(maden), 00) AS maden ,
                                ISNULL(SUM(daen), 0.00) AS daen ,
                                ISNULL(SUM(daen)- SUM(maden), 0.00) AS Raseed ,
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
                          AND (@venderid = 0 OR venderid = @venderid)
                        GROUP BY venderid ,
                                suppliers_name ,
                                TypeName ,
                                Short_Name_EN ,
                                Short_Name_Ar ,
                                Supplier_Name_EN;


            END;


        SELECT  *
        FROM    #Result
        ORDER BY venderid ,
                movedate; 


    END;
