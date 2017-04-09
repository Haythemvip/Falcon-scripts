

 
CREATE   PROCEDURE [dbo].[Save_Journal_Request]
    @ID BIGINT ,
    @KaidID BIGINT ,
    @OstazID BIGINT ,
    @ProunchID INT ,
    @COMP_ID INT ,
    @UserName NVARCHAR(50) ,
   
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
    @DocJorrnal BIGINT = 0,
    @OstasName NVARCHAR(50) = 'ﬁÌœ ÌÊ„Ì…'

AS
    BEGIN

	 
        BEGIN TRANSACTION;
        BEGIN TRY		



            IF @isUpdate = 1
                BEGIN 
                    
                    DELETE  FROM El_Koyod_El_Yawmia_requst
                    WHERE   ID = @ID

                    INSERT  INTO ManagerRep
                            ( FormName ,
                              AcionName ,
                              Data ,
                              UserName ,
                              ActionDate ,
                              ActonTime
                            )
                    VALUES  ( 'ÿ·» ’—› √Ê «÷«›…' ,
                              ' ⁄œÌ·' ,
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
                    VALUES  ( 'ÿ·» ’—› √Ê «÷«›…' ,
                              'Õ›Ÿ' ,
                              @ID ,
                              @UserName ,
                              GETDATE() ,
                              CONVERT(TIME, GETDATE())
                            )


                END


 

 

            INSERT  INTO El_Koyod_El_Yawmia_Request
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
                      DocNO,
					  BeneficiaryCode,
					  Beneficiary
                    )
                    SELECT  @ID ,
                            @KaidID ,
                            @OstazID ,
                            Seyial ,
                            @OstasName ,
                            Detis ,
                            AccID ,
                            AccName ,
                            Maden ,
                            Daen ,
                            aDate ,
                            @OstasName ,
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
                            DocNO,
					  BeneficiaryCode,
					  Beneficiary
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


