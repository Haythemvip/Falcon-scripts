 
ALTER  PROCEDURE [dbo].[Persons_Add]
    @idno NVARCHAR(12) ,
    @Pname NVARCHAR(50) ,
    @idsource NVARCHAR(20) ,
    @iddate NVARCHAR(10) ,
    @ADDRESS NVARCHAR(100) ,
    @Workaddress NVARCHAR(100) ,
    @phone NVARCHAR(60) ,
    @mobile NVARCHAR(40) ,
    @Nationality NVARCHAR(50) ,
    @JobName NVARCHAR(50),
	@AccID BIGINT ,
	@AccName NVARCHAR(250),
	@IBAN_NO NVARCHAR(50),
	@BankName NVARCHAR(150)

	 
AS
    BEGIN
	
        INSERT  INTO [dbo].[persons]
                ( 
				
				  [idno] ,
                  [Pname] ,
                  [idsource] ,
                  [iddate] ,
                  [address] ,
                  [Workaddress] ,
                  [phone] ,
                  [mobile] ,
                  [Nationality] ,
                  [JobName],
				  [AccID],
				  [AccName],
				  [IBAN_NO],
				  [BankName]

                )
        VALUES  
		        ( 
				
				  @idno ,
                  @Pname ,
                  @idsource ,
                  @iddate ,
                  @ADDRESS ,
                  @Workaddress ,
                  @phone ,
                  @mobile ,
                  @Nationality ,
                  @JobName,
				  @AccID,
				  @AccName,
				  @IBAN_NO,
				  @BankName
           
		        )
 
    END
