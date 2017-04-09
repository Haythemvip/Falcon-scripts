CREATE PROCEDURE El_Koyod_TEMP_Add

            
               @Maden decimal,
               @Daen decimal,
               @Detis NVARCHAR(500),
               @AccID BIGINT,
               @AccName nvarchar(500),
               @costid bigint,
               @CostName nvarchar(max),
               @CostTypeID int,
               @CostTypeName NVARCHAR(50),
               @Acccode2 bigint,
               @AccName2 NVARCHAR(50),
               @CaseID bigint,
               @CaseName NVARCHAR(50)



AS
    

        INSERT  INTO dbo.El_Koyod_TEMP
                ( 
                  Maden ,
                  Daen ,
                  Detis ,
                  AccID ,
                  AccName ,
                  costid ,
                  CostName ,
                  CostTypeID ,
                  CostTypeName ,
                  Acccode2 ,
                  AccName2 ,
                  CaseID ,
                  CaseName
                )
        VALUES  ( 
                  @Maden , -- Maden - decimal
                  @Daen , -- Daen - decimal
                  @Detis, -- Detis - varchar(500)
                  @AccID, -- AccID - bigint
                  @AccName , -- AccName - nvarchar(500)
                  @costid, -- costid - bigint
                  @CostName , -- CostName - nvarchar(max)
                  @CostTypeID , -- CostTypeID - int
                  @CostTypeName , -- CostTypeName - nvarchar(50)
                  @Acccode2 , -- Acccode2 - bigint
                  @AccName2 , -- AccName2 - nvarchar(250)
                  @CaseID, -- CaseID - bigint
                  @CaseName  -- CaseName - nvarchar(50)
                )
               

   