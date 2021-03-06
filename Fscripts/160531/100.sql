 
 

ALTER PROCEDURE [dbo].[Fixed_Aset_Calc] @ToDate DATE
AS
    CREATE TABLE #Fixed
        (
          [AslID] BIGINT NULL ,
          [AslCode] NVARCHAR(500) NULL ,
          [Aslname] NVARCHAR(200) COLLATE Arabic_CI_Ai
                                  NULL ,
          [TasneefName] NVARCHAR(200) COLLATE Arabic_CI_Ai
                                      NULL ,
          [TasneefID] BIGINT NULL ,
          [CostID] BIGINT NULL ,
          [AccName] NVARCHAR(200) COLLATE Arabic_CI_Ai
                                  NULL ,
          [DateStart] CHAR(10) NULL ,
          [DatePurchse] CHAR(10) NULL ,
          [Steep] DECIMAL(18, 2) NULL ,
          [Price] DECIMAL(18, 2) NULL ,
          [MasrofEhlak] DECIMAL(18, 2) NULL ,
          [Mojama3Ehlak_Sabek] DECIMAL(18, 2) NULL ,
          [Mojama3Ehlak] DECIMAL(18, 2) NULL ,
          [NetVale] DECIMAL(18, 2) NULL ,
          [lastdate] CHAR(10) NULL ,
          [DayCOunt] BIGINT NULL ,
          [P_DayCOunt] BIGINT NULL,
	  ScrapValue BIGINT
        )

    BEGIN
	
        INSERT  INTO #Fixed
                SELECT  [AslID] ,
                        [AslCode] ,
                        [Aslname] ,
                        [TasneefName] ,
                        [TasneefID] ,
                        [CostID] ,
                        [AccName] ,
                        [DateStart] ,
                        [DatePurchse] ,
                        [Steep] ,
                        [Price] ,
                        0.00 AS [MasrofEhlak] ,
                        0.00 AS [Mojama3Ehlak_Sabek] ,
                        0.00 AS [Mojama3Ehlak] ,
                        NetVale AS [NetVale] ,
                        [lastdate] ,
                        0.00 AS [DayCOunt] ,
                        0.00 AS [P_DayCOunt],
			ScrapValue

                FROM    dbo.vAslName
                WHERE   NetVale > ScrapValue
                        AND AslCode IN ( SELECT VarParameter
                                         FROM   Table_Parameter )
                        AND @ToDate > DateStart
	 

		 
        UPDATE  #Fixed
        SET     DayCOunt = DATEDIFF(DAY, CONVERT(DATE, lastdate), @ToDate)  


        UPDATE  #Fixed
        SET     MasrofEhlak = ( Price * DayCOunt ) * ( Steep / 100 ) / 365
        WHERE   DayCOunt > 0 
		   
        UPDATE  #Fixed
        SET     MasrofEhlak = CASE WHEN MasrofEhlak >= NetVale THEN ( NetVale - ScrapValue)
                                   ELSE MasrofEhlak
                              END

        



		 
        --UPDATE  #Fixed
        --SET     P_DayCOunt = DATEDIFF(DAY, CONVERT(DATE,DateStart ),
        --                              CONVERT(DATE, @ToDate)) + 1 -DayCOunt




        --UPDATE  #Fixed
        --SET     [Mojama3Ehlak_Sabek] = ( Price * P_DayCOunt ) * ( Steep / 100 )
        --        / 365



        UPDATE  #Fixed
        SET     [Mojama3Ehlak_Sabek] = ( SELECT ISNULL(SUM(MasrofEhlak), 0.00) AS MasrofEhlak
                                         FROM   Fixed_Aset_Calc_Add
                                         WHERE  AslID = #Fixed.AslID
                                       )


        UPDATE  #Fixed
        SET     [Mojama3Ehlak] = MasrofEhlak + [Mojama3Ehlak_Sabek]


        UPDATE  #Fixed
        SET     [NetVale] = [NetVale] - MasrofEhlak
		 
        SELECT  *
        FROM    #Fixed 
    END


	