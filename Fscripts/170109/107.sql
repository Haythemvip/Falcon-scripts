 

ALTER   PROC [dbo].[_Select_Emp_To_SallaryAddon]
    @List AS dbo.MyParam READONLY ,
    @Date DATE ,
    @VlueAdd NUMERIC(18, 2) ,
    @CostID BIGINT = 0 ,
    @CostName NVARCHAR(MAX) = '' ,
    @Notes NVARCHAR(MAX) = ''
AS
    CREATE TABLE #excel
        (
          Emp_Code BIGINT NULL ,
          emp_name [CHAR](100) COLLATE Arabic_CI_AS
                               NULL ,
          AddDate DATE NULL ,
          VlueAdd [NUMERIC](18, 2) NULL ,
          CostID BIGINT ,
          CostName NVARCHAR(MAX) ,
          Notes NVARCHAR(MAX)
        );



    BEGIN




        INSERT  INTO #excel
                SELECT  emp.emp_code ,
                        emp.emp_name ,
                        @Date ,
                        @VlueAdd ,
                        @CostID ,
                        @CostName ,
                        @Notes
                FROM    emp
                WHERE   emp.flag = 1
                        AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                FROM    @List
                              ) = 0
                              OR emp.emp_code IN ( SELECT   *
                                                   FROM     @List )
                            );    



    END;

  

    --UPDATE  #excel
    --SET     VlueAdd = ( SELECT TOP 1
    --                            HOURTO
    --                    FROM    dbo.emp_edafy
    --                    WHERE   emp_edafy.emp_id = #excel.Emp_Code
    --                            AND emp_datecomming = @Date
    --                  )





    SELECT  *
    FROM    #excel
    ORDER BY Emp_Code;


