
CREATE PROCEDURE Purchased_Supp
    @FromDate DATE ,
    @ToDate DATE
AS
    BEGIN

        CREATE TABLE #Resul
            (
              venderid BIGINT ,
              suppliers_name NVARCHAR(MAX) ,
              valbr FLOAT ,
              mardodat FLOAT ,
              safy FLOAT
            )


			

        DELETE  FROM #Resul 



        INSERT  INTO #Resul
                ( venderid ,
                  suppliers_name ,
                  valbr ,
                  mardodat ,
                  safy
			    )
                SELECT  suppliers_id ,
                        suppliers_name ,
                        0 ,
                        0 ,
                        0
                FROM    dbo.suppliers



        UPDATE  #Resul
        SET     valbr = ( SELECT    ISNULL(SUM(net), 0)
                          FROM      dbo.invcome
                          WHERE     ClientID = #Resul.venderid
                                    AND idate BETWEEN @FromDate AND @ToDate
                        )
                + ( SELECT  ISNULL(SUM(net), 0)
                    FROM    dbo.invcomeNoTax
                    WHERE   ClientID = #Resul.venderid
                            AND idate BETWEEN @FromDate AND @ToDate
                  )

        UPDATE  #Resul
        SET     mardodat = ( SELECT ISNULL(SUM(net), 0)
                             FROM   dbo.Mardodat_Invcome
                             WHERE  ClientID = #Resul.venderid
                                    AND idate BETWEEN @FromDate AND @ToDate
                           )
                + ( SELECT  ISNULL(SUM(net), 0)
                    FROM    dbo.Mardodat_Invoice_Com_NotTax
                    WHERE   ClientID = #Resul.venderid
                            AND idate BETWEEN @FromDate AND @ToDate
                  )



        UPDATE  #Resul
        SET     safy = valbr - mardodat 



        SELECT  *
        FROM    #Resul WHERE safy <> 0

    END
GO
