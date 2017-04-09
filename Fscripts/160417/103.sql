


ALTER  PROC [dbo].[byan_ezn_Save]
   
    @idate DATE ,
    @ClientID BIGINT ,
    @aTotal DECIMAL(18, 2) ,
    @Fright DECIMAL(18, 2) = 0 ,
    @Descount DECIMAL(18, 2) ,
    @Net DECIMAL(18, 2) ,
    @aArabicTotal VARCHAR(300) ,
    @invtype VARCHAR(50) ,
    @monycome DECIMAL(18, 2) ,
    @monystill DECIMAL(18, 2) ,
    @notes TEXT ,
    @iyeer BIGINT ,
    @store_id INT ,
    @servicetype VARCHAR(50) = '' ,
    @flag BIT = 0 ,
    @ProunchID INT ,
    @COMP_ID INT ,
    @IsUsed BIT = 0,
    @Mandop_Name NVARCHAR(100) ,
    @MandopID BIGINT ,
    @DocNo NVARCHAR(50) ,
    @UserID INT,
	@dtItems  byan_item_eznType  READONLY ,
	@OldID BIGINT 
	

AS
    IF @OldID = 0
        BEGIN 
            INSERT  INTO byan_ezn
                    ( idate ,
                      ClientID ,
                      aTotal ,
                      Descount ,
                      Net ,
                      aArabicTotal ,
                      invtype ,
                      monycome ,
                      monystill ,
                      notes ,
                      iyeer ,
                      store_id ,
                      Mandop_Name ,
                      ProunchID ,
                      COMP_ID ,
                      MandopID ,
                      DocNo ,
                      UserID
                    )
            VALUES  ( @idate ,
                      @ClientID ,
                      @aTotal ,
                      @Descount ,
                      @Net ,
                      @aArabicTotal ,
                      @invtype ,
                      @monycome ,
                      @monystill ,
                      @notes ,
                      @iyeer ,
                      @store_id ,
                      @Mandop_Name ,
                      @ProunchID ,
                      @COMP_ID ,
                      @MandopID ,
                      @DocNo ,
                      @UserID
                    ) 
			




        END

    IF @OldID > 0
        BEGIN 

            UPDATE  byan_ezn
            SET     idate = @idate ,
                    ClientID = @ClientID ,
                    aTotal = @aTotal ,
                    Descount = @Descount ,
                    Net = @Net ,
                    aArabicTotal = @aArabicTotal ,
                    invtype = @invtype ,
                    monycome = @monycome ,
                    monystill = @monystill ,
                    notes = @notes ,
                    iyeer = @iyeer ,
                    store_id = @store_id ,
                    Mandop_Name = @Mandop_Name ,
                    ProunchID = @ProunchID ,
                    COMP_ID = @COMP_ID ,
                    MandopID = @MandopID ,
                    DocNo = @DocNo ,
                    UserID = @UserID
            WHERE   InvoiceNo = @OldID

        END
 
    UPDATE  dbo.customers
    SET     OperatorID = @UserID 
    WHERE   Customer_id = @ClientID

    DELETE  FROM byan_item_ezn
    WHERE   InvoiceNo = @OldID


	

	 IF @OldID = 0
	 BEGIN 

	 DECLARE @NewID BIGINT 
	 
	 SET @NewID = (SELECT SCOPE_IDENTITY())

	 INSERT INTO [dbo].[byan_item_ezn]
          
         SELECT @NewID  ,  * FROM @dtItems

		 RETURN @NewID 

	 END
     
	
	 IF @OldID > 0
	 BEGIN 

	 

	 INSERT INTO [dbo].[byan_item_ezn]
          
         SELECT @OldID  ,  * FROM @dtItems

	 END


GO

   