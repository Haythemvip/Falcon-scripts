 
 

ALTER    PROCEDURE [dbo].[Emp_Nhayat_Service_View]
     @List AS dbo.MyParam READONLY ,
    @DateSet DATE ,
    @year INT ,
    @Vacation INT ,
    @EndService INT ,
    @Estekala INT ,
    @Yearly INT
AS
    CREATE TABLE #Codes ( emp_code BIGINT )
    INSERT  INTO #Codes
            SELECT  emp_code
            FROM    dbo.emp
            WHERE   emp.flag = 1
                    AND ((SELECT ISNULL(COUNT(*),0) FROM @List)= 0 OR emp.emp_code IN(SELECT * FROM @List) ) 





   
    SELECT  *
    FROM    Emp_Mosta7kat
    --WHERE   emp_code IN ( SELECT    emp_code
    --                      FROM      #Codes )
				--		  end		
						  -- AND ActionName = CASE WHEN (@Yearly = 1) THEN ('القيد السنوى') 
 
 
	

