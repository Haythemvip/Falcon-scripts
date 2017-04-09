 
CREATE  PROCEDURE Journl_Inport
    @JournalID INT OUTPUT ,
    @UserName NVARCHAR(150) ,
    @ErrorMessage NVARCHAR(500) OUTPUT ,
    @ID BIGINT
AS
    BEGIN
	
        BEGIN TRANSACTION;
        BEGIN TRY		

            SET @JournalID = ( SELECT   MAX(ID)
                               FROM     dbo.El_Koyod_El_Yawmia
                             ) + 1;



            INSERT  INTO dbo.El_Koyod_El_Yawmia
                    ( ID ,
                      KaidID ,
                      OstazID ,
                      OstasName ,
                      Seyial ,
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
                      Loked ,
                      CostTypeID ,
                      CostTypeName ,
                      Acccode2 ,
                      AccName2 ,
                      DocJorrnal ,
                      contType ,
                      QestNO ,
                      ContNO ,
                      CaseID ,
                      CaseName ,
                      DocNO ,
                      Destination ,
                      Date_Add
                    )
                    SELECT  @JournalID ,
                            KaidID ,
                            OstazID ,
                            OstasName ,
                            Seyial ,
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
                            Loked ,
                            CostTypeID ,
                            CostTypeName ,
                            Acccode2 ,
                            AccName2 ,
                            DocJorrnal ,
                            contType ,
                            QestNO ,
                            ContNO ,
                            CaseID ,
                            CaseName ,
                            DocNO ,
                            Destination ,
                            Date_Add
                    FROM    dbo.El_Koyod_El_Yawmia_Request
                    WHERE   dbo.El_Koyod_El_Yawmia_Request.ID = @ID; 



            SET @ErrorMessage = 'Done ';
           
            COMMIT TRANSACTION;  

        END TRY 

        BEGIN CATCH 

             SET @JournalID = 0
            SET @ErrorMessage = ERROR_MESSAGE();  
            ROLLBACK TRANSACTION;

        END CATCH;

    END;
GO
