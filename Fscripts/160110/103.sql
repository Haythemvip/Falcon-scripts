 
CREATE PROCEDURE Tender_Tech_Add

           @TendeID BIGINT 
          ,@MonaksaID INTEGER 
          ,@TenderTypeID INTEGER 
          ,@WorkSesionID INTEGER 
          ,@CuntryID INTEGER 
          ,@CityID INTEGER 
          ,@DateTech DATE 
          ,@DateMaly DATE 
          ,@TenderValue NVARCHAR(50) 
          ,@TenderValueMony NVARCHAR(50) 
          ,@TenderTime NVARCHAR(50) 
          ,@TendervalueTime NVARCHAR(50)
          ,@UserAdd NVARCHAR(50)
          ,@Tenders_ConsaltsID INTEGER ,
		   @OwnerID INTEGER


AS
    BEGIN
	

	
        IF NOT EXISTS ( SELECT  TendeID
                        FROM    Tender_Tech WHERE TendeID = @TendeID )
            BEGIN

                INSERT  INTO [Tender_Tech]
                        ( [TendeID] ,
                          [MonaksaID] ,
                          [TenderTypeID] ,
                          [WorkSesionID] ,
                          [CuntryID] ,
                          [CityID] ,
                          [DateTech] ,
                          [DateMaly] ,
                          [TenderValue] ,
                          [TenderValueMony] ,
                          [TenderTime] ,
                          [TendervalueTime] ,
                          [UserAdd] ,
                          [Tenders_ConsaltsID],
						  [OwnerID]
                        )
                VALUES  ( @TendeID ,
                          @MonaksaID ,
                          @TenderTypeID ,
                          @WorkSesionID ,
                          @CuntryID ,
                          @CityID ,
                          @DateTech ,
                          @DateMaly ,
                          @TenderValue ,
                          @TenderValueMony ,
                          @TenderTime ,
                          @TendervalueTime ,
                          @UserAdd ,
                          @Tenders_ConsaltsID,
						  @OwnerID
                        )

            END

        IF EXISTS ( SELECT  *
                    FROM    Tender_Tech WHERE TendeID = @TendeID )
            BEGIN

                UPDATE  Tender_Tech
                SET     MonaksaID = @MonaksaID ,
                        TenderTypeID = @TenderTypeID ,
                        WorkSesionID = @WorkSesionID ,
                        CuntryID = @CuntryID ,
                        CityID = @CityID ,
                        DateTech = @DateTech ,
                        DateMaly = @DateMaly ,
                        TenderValue = @TenderValue ,
                        TenderValueMony = @TenderValueMony ,
                        TenderTime = @TenderTime ,
                        TendervalueTime = @TendervalueTime ,
                        Tenders_ConsaltsID = @Tenders_ConsaltsID
						,OwnerID = @OwnerID 
                WHERE   TendeID = @TendeID 

            END



    END
GO
