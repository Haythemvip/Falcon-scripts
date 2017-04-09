 
 
ALTER   PROCEDURE dbo.Save_Journal
    @ID BIGINT ,
    @KaidID BIGINT ,
    @OstazID BIGINT ,
    @ProunchID INT ,
    @COMP_ID INT ,
    @UserName NVARCHAR(50) ,
    @aDate DATE ,
    @FinancialYear NVARCHAR(10) ,
    @CurID INT ,
    @DayName NVARCHAR(50) ,
    @Notes NVARCHAR(MAX) ,
    @JournalType JournalType READONLY ,
    @isUpdate INT = 0 ,
    @IsStartedBalance BIT = 0 ,
    @ErrorNumber INT OUTPUT ,
    @cmbKedName NVARCHAR(150) ,
    @ErrorMessage NVARCHAR(500) OUTPUT,
    @DocJorrnal BIGINT = 0

AS
    BEGIN

	 
        BEGIN TRANSACTION;
        BEGIN TRY		



            IF @isUpdate = 1
                BEGIN 
                    DELETE  FROM CostProjects
                    WHERE   TaswyaMasroof_ID = @ID
                            AND TaswyaID = @ID
                    DELETE  FROM Box_Moves
                    WHERE   Taswya_Mony_ID = @ID
                    DELETE  FROM chartaccount
                    WHERE   invno_ormony_id = @ID
                            AND TaswyaMasroof_ID = @ID
                    DELETE  FROM Emp_Account
                    WHERE   invno_ormony_id = @ID
                            AND TaswyaMasroof_ID = @ID
                    DELETE  FROM customer_account
                    WHERE   invno_ormony_id = @ID
                            AND TaswyaMasroof_ID = @ID
                    DELETE  FROM Bank_Accounts
                    WHERE   invno_ormony_id = @ID
                            AND TaswyaMasroof_ID = @ID
                    DELETE  FROM venderaccount
                    WHERE   invno_ormony_id = @ID
                            AND TaswyaMasroof_ID = @ID
                    DELETE  FROM El_Koyod_El_Yawmia
                    WHERE   ID = @ID

                    INSERT  INTO ManagerRep
                            ( FormName ,
                              AcionName ,
                              Data ,
                              UserName ,
                              ActionDate ,
                              ActonTime
                            )
                    VALUES  ( 'قيد يومية' ,
                              'تعديل' ,
                              @ID ,
                              @UserName ,
                              GETDATE() ,
                              CONVERT(TIME, GETDATE())
                            )

                END
    


            IF @isUpdate = 0
                BEGIN
                    INSERT  INTO ManagerRep
                            ( FormName ,
                              AcionName ,
                              Data ,
                              UserName ,
                              ActionDate ,
                              ActonTime
                            )
                    VALUES  ( 'قيد يومية' ,
                              'حفظ' ,
                              @ID ,
                              @UserName ,
                              GETDATE() ,
                              CONVERT(TIME, GETDATE())
                            )


                END



            INSERT  INTO [Box_Moves]
                    ( BoxID ,
                      accountcode ,
                      account_name ,
                      Account_info ,
                      aDate ,
                      Year ,
                      Price_Elwared ,
                      Price_ElMonsaref ,
                      monsarefCast ,
                      monsarefvender ,
                      monsarefchart ,
                      monsarefconstcenter ,
                      putinbank ,
                      Solafemp ,
                      MonyOnly ,
                      CostId ,
                      CurID ,
                      DocMonsaref_No ,
                      Taswya_Mony_ID ,
                      DayName ,
                      Journal 
				
                    )
                    SELECT  Acccode2 ,
                            AccID ,
                            AccName2 ,
                            Detis ,
                            @aDate ,
                            @FinancialYear ,
                            Maden ,
                            Daen ,
                            0 ,
                            0 ,
                            1 ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            @CurID ,
                            0 ,
                            @ID ,
                            @DayName ,
                            @ID
                    FROM    @JournalType
                    WHERE   CaseID = 13


            INSERT  INTO Emp_Account
                    ( venderid ,
                      year ,
                      actionname ,
                      invno_ormony_id ,
                      movedate ,
                      maden ,
                      daen ,
                      Notes ,
                      CurID ,
                      TaswyaMasroof_ID ,
                      CaseID ,
                      CaseName ,
                      Journal ,
                      DocNo
                    )
                    SELECT  Acccode2 ,
                            @FinancialYear ,
                            'قيد يومية' ,
                            @ID ,
                            @aDate ,
                            Maden ,
                            Daen ,
                            Detis ,
                            @CurID ,
                            @ID ,
                            CaseID ,
                            CaseName ,
                            @ID ,
                            DocNO
                    FROM    @JournalType
                    WHERE   CaseID = 15
                            OR CaseID = 16
                            OR CaseID = 17



            INSERT  INTO customer_account
                    ( venderid ,
                      year ,
                      actionname ,
                      invno_ormony_id ,
                      movedate ,
                      maden ,
                      daen ,
                      Notes ,
                      CurID ,
                      TaswyaMasroof_ID ,
                      CaseID ,
                      CaseName ,
                      Journal ,
                      DocNo
                    )
                    SELECT  Acccode2 ,
                            @FinancialYear ,
                            'قيد يومية' ,
                            @ID ,
                            @aDate ,
                            Maden ,
                            Daen ,
                            Detis ,
                            @CurID ,
                            @ID ,
                            CaseID ,
                            CaseName ,
                            @ID ,
                            DocNO
                    FROM    @JournalType
                    WHERE   CaseID = 2
                            OR CaseID = 3
                            OR CaseID = 4
                            OR CaseID = 5



            INSERT  INTO Bank_Accounts
                    ( venderid ,
                      year ,
                      actionname ,
                      invno_ormony_id ,
                      movedate ,
                      maden ,
                      daen ,
                      Notes ,
                      CurID ,
                      TaswyaMasroof_ID ,
                      Journal ,
                      DocNo
                    )
                    SELECT  Acccode2 ,
                            @FinancialYear ,
                            'قيد يومية' ,
                            @ID ,
                            @aDate ,
                            Maden ,
                            Daen ,
                            Detis ,
                            @CurID ,
                            @ID ,
                            @ID ,
                            DocNO
                    FROM    @JournalType
                    WHERE   CaseID = 12
                      



            INSERT  INTO venderaccount
                    ( venderid ,
                      year ,
                      actionname ,
                      invno_ormony_id ,
                      movedate ,
                      maden ,
                      daen ,
                      Notes ,
                      CurID ,
                      TaswyaMasroof_ID ,
                      CaseID ,
                      CaseName ,
                      Journal ,
                      DocNo
                    )
                    SELECT  Acccode2 ,
                            @FinancialYear ,
                            'قيد يومية' ,
                            @ID ,
                            @aDate ,
                            Maden ,
                            Daen ,
                            Detis ,
                            @CurID ,
                            @ID ,
                            CaseID ,
                            CaseName ,
                            @ID ,
                            DocNO
                    FROM    @JournalType
                    WHERE   CaseID = 7
                            OR CaseID = 8
                            OR CaseID = 9
                            OR CaseID = 10




            INSERT  INTO [chartaccount]
                    ( venderid ,
                      year ,
                      actionname ,
                      invno_ormony_id ,
                      movedate ,
                      maden ,
                      daen ,
                      Notes ,
                      CurID ,
                      TaswyaMasroof_ID ,
                      Journal
                    )
                    SELECT  Acccode2 ,
                            @FinancialYear ,
                            'قيد يومية' ,
                            @ID ,
                            @aDate ,
                            Maden ,
                            Daen ,
                            Detis ,
                            @CurID ,
                            @ID ,
                            @ID
                    FROM    @JournalType
                    WHERE   CaseID = 0






            INSERT  INTO [CostProjects]
                    ( [CostId] ,
                      [CostDate] ,
                      [Pudget] ,
                      [Wared] ,
                      [Monsaref] ,
                      [Sallerys] ,
                      [Machines] ,
                      [Matrial] ,
                      [AjelVender] ,
                      [Ajel_Sadad] ,
                      [Mortad] ,
                      [emp_code] ,
                      [suppliers_id] ,
                      [notes] ,
                      [UserName] ,
                      [ActionDate] ,
                      [KedID] ,
                      [item_id] ,
                      [item_Quntity] ,
                      [Esn_sarf_Id] ,
                      [Byan_No] ,
                      [InvoiceoutNO] ,
                      [Esn_Edafa_No] ,
                      [InvCom_NOtTax_No] ,
                      [Inv_ComNO] ,
                      [TaswyaMasroof_ID] ,
                      [TreeID] ,
                      [TaswyaID] ,
                      [Destination] ,
                      [Acccode2] ,
                      [AccName2] ,
                      [OstazName]
                    )
                    SELECT  costid ,
                            @aDate ,
                            0 ,
                            Daen ,
                            Maden ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            Detis ,
                            @UserName ,
                            GETDATE() ,
                            @ID ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            @ID ,
                            AccID ,
                            @ID ,
                            'Journal' ,
                            [Acccode2] ,
                            [AccName2] ,
                            @cmbKedName
                    FROM    @JournalType
                    WHERE   costid > 0


            INSERT  INTO El_Koyod_El_Yawmia
                    ( ID ,
                      KaidID ,
                      OstazID ,
                      Seyial ,
                      OstasName ,
                      Detis ,
                      AccID ,
                      AccName ,
                      Maden ,
                      Daen ,
                      aDate ,
                      trancename ,
                      Notes ,
                      ProunchID ,
                      COMP_ID ,
                      IsStartedBalance ,
                      costid ,
                      CurID ,
                      UserAA ,
                      year ,
                      DayName ,
                      CostTypeID ,
                      CostTypeName ,
                      Acccode2 ,
                      AccName2 ,
                      DocJorrnal ,
                      CaseID ,
                      CaseName ,
                      DocNO
                    )
                    SELECT  @ID ,
                            @KaidID ,
                            @OstazID ,
                            Seyial ,
                            'قيد يومية' ,
                            Detis ,
                            AccID ,
                            AccName ,
                            Maden ,
                            Daen ,
                            @aDate ,
                            'قيد يومية' ,
                            @Notes ,
                            @ProunchID ,
                            @COMP_ID ,
                            @IsStartedBalance ,
                            costid ,
                            @CurID ,
                            @UserName ,
                            @FinancialYear ,
                            @DayName ,
                            CostTypeID ,
                            CostTypeName ,
                            Acccode2 ,
                            AccName2 ,
                            @DocJorrnal ,
                            CaseID ,
                            CaseName ,
                            DocNO
                    FROM    @JournalType



            SET @ErrorMessage = 'Done '
            SET @ErrorNumber = 0
            COMMIT TRANSACTION  

        END TRY 

        BEGIN CATCH 

            SET @ErrorNumber = ERROR_NUMBER()    
            SET @ErrorMessage = ERROR_MESSAGE()  
            ROLLBACK TRANSACTION;

        END CATCH;
	
 
    END

GO