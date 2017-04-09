
CREATE  PROCEDURE Supplier_Accoutn_SP
    @datefrom DATE ,
    @Year INT ,
    @CaseID INT ,
    @venderid BIGINT ,
    @CurID INT = 1 ,
    @dateTo DATE ,
    @SuppTypeID INT = 0 ,
    @Detailed INT
AS
    BEGIN
	
        CREATE TABLE #Result
            (
              TypeName NVARCHAR(250) ,
              venderid BIGINT ,
              suppliers_name NVARCHAR(250) ,
              actionname NVARCHAR(250) ,
              Invcomno INT ,
              invno_ormony_id INT ,
              movedate DATE ,
              maden FLOAT ,
              daen FLOAT ,
              Raseed FLOAT ,
			  Notes NVARCHAR(250),
              CaseName NVARCHAR(50),
              Journal NVARCHAR(50) ,
              DocNo NVARCHAR(50) ,
              Short_Name_EN NVARCHAR(250) ,
              Short_Name_Ar NVARCHAR(250) ,
              Supplier_Name_EN NVARCHAR(250) ,
             
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
                        suppliers_name ,
                        NULL  AS actionname ,
                        0 AS Invcomno ,
                        0 AS invno_ormony_id ,
                        @datefrom AS movedate ,
                        SUM(ISNULL(maden, 0.00)) AS maden ,
                        SUM(ISNULL(daen, 0.00)) AS daen ,
                        ISNULL(SUM(daen)- SUM(maden), 0.00) AS Raseed   ,
                        '—’Ìœ „«ﬁ»·Â' AS Notes ,
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
                                suppliers_name ,
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
GO
