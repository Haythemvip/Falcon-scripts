 
ALTER  PROCEDURE [dbo].[Persons_Update]
    @idno NVARCHAR(12) ,
    @Pname NVARCHAR(50) ,
    @idsource NVARCHAR(20) ,
    @iddate NVARCHAR(10) ,
    @ADDRESS NVARCHAR(100) ,
    @Workaddress NVARCHAR(100) ,
    @phone NVARCHAR(60) ,
    @mobile NVARCHAR(40) ,
    @Nationality NVARCHAR(50) ,
    @JobName NVARCHAR(50) ,
    @AccID BIGINT ,
    @AccName NVARCHAR(250) ,
    @IBAN_NO NVARCHAR(50) ,
    @BankName NVARCHAR(150),
	@Customer_ID BIGINT = 0
AS
    BEGIN
	
        UPDATE  [dbo].[persons]
        SET     [Pname] = @Pname ,
                [idsource] = @idsource ,
                [iddate] = @iddate ,
                [address] = @ADDRESS ,
                [Workaddress] = @Workaddress ,
                [phone] = @phone ,
                [mobile] = @mobile ,
                [Nationality] = @Nationality ,
                [JobName] = @JobName ,
                [AccID] = @AccID ,
                [AccName] = @AccName ,
                [IBAN_NO] = @IBAN_NO ,
                [BankName] = @BankName 

        WHERE   [idno] = @idno 

		AND (@Customer_ID = 0 OR @Customer_ID = @Customer_ID )
		           
                
            
 
    END;
