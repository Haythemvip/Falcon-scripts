
ALTER PROC [dbo].[Select_Person_Account]
    
    @Date2 DATE ,
    @Kafeel1 BIGINT ,
    @Customer BIGINT ,
    @Vendor BIGINT ,
    @shaseno NVARCHAR(50) = '0'
AS
    CREATE TABLE #Render
        (
          [ContStatus] INT NULL ,
          [customer_name] NVARCHAR(250) COLLATE Arabic_CI_AS
                                        NULL ,
          [shaseno] NVARCHAR(10) NOT NULL ,
          [idno] BIGINT NULL ,
          [Pname] NVARCHAR(250) COLLATE Arabic_CI_AS
                                NULL ,
          [K1Name] NVARCHAR(250) COLLATE Arabic_CI_AS
                                 NULL ,
          [fileno] NVARCHAR(10) NULL ,
          [conttype] NVARCHAR(50) NULL ,
          [contno] BIGINT NULL ,
          [gno] INT NULL ,
          [camount] MONEY NULL ,
          [gdate] NVARCHAR(10) NULL ,
          [payed] MONEY NULL ,
          [Raseed] MONEY NULL ,
          [pdate] NVARCHAR(10) NULL ,
          [remarks] NVARCHAR(MAX) ,
          [modno] NVARCHAR(4) NULL ,
          [cname] NVARCHAR(35) NULL

        ) 



 

                    INSERT  INTO #Render
                            SELECT  contract.ContStatus ,
                                    customers.customer_name ,
                                    contract.shaseno ,
                                    contract.baccno ,
                                    persons.Pname ,
                                    persons_1.Pname AS K1Name ,
                                    contract.fileno ,
                                    aqsat.conttype ,
                                    contract.contno ,
                                    aqsat.gno ,
                                    aqsat.camount ,
                                    aqsat.gdate ,
                                    aqsat.payed ,
                                    0.00 AS Raseed ,
                                    aqsat.pdate ,
                                    carsTable.remarks ,
                                    carsTable.modno ,
                                    cartype.cname
                            FROM    aqsat
                                    INNER JOIN contract ON aqsat.gcontno = contract.contno
                                    INNER JOIN persons AS persons_1 ON contract.kidno1 = persons_1.idno
                                    INNER JOIN customers ON contract.saccno = customers.Customer_id
                                    INNER JOIN persons ON contract.baccno = persons.idno
                                    INNER JOIN carsTable ON contract.shaseno = carsTable.shaseno
                                    INNER JOIN cartype ON carsTable.typecar = cartype.code
                            WHERE   (@Kafeel1 = 0 OR persons_1.idno = @Kafeel1)
                                    AND (@Vendor = 0 OR persons.idno = @Vendor)
                                    AND (@Customer = 0 OR customers.Customer_id = @Customer)
                                    AND (CAST(gdate AS DATE) <= @Date2 )
								    AND (@shaseno = '0' OR contract.shaseno = @shaseno)
			   
               

 
  





    UPDATE  #Render
    SET     Raseed = ISNULL(camount, 0.00) - ISNULL(payed, 0.00)

    SELECT  *
    FROM    #Render
		
       
			 
   

	

