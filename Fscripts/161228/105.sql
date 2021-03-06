 
 
ALTER PROCEDURE [dbo].[_Select_Sallery]
     @FBank NVARCHAR(100) ,
   
    @Fcomp INT = 0 ,
    @state BIT = 0 ,
    @List AS dbo.MyParam READONLY ,
    @gettingdaycount INT = 0 ,
    @year INT,
    @month AS INT  
    
AS
    BEGIN

      

                SELECT *,
                        emp.IqamaID ,
                        emp.emp_add ,
                        emp.BankNo ,
                        ISNULL(SalaryReport.Take_Schole, 0) AS Take_Schole ,
                        ISNULL(SalaryReport.Take_Percent, 0) AS Take_Percent,
						dbo.emp.OrignalContry 
                FROM    SalaryReport
                        INNER JOIN emp ON SalaryReport.code = emp.emp_code
                WHERE   (@FBank = '0' OR  SalaryReport.SalaryType = @FBank )
                        AND ((SELECT ISNULL(COUNT(*),0) FROM @List)= 0 OR emp.emp_code IN(SELECT * FROM @List) ) 
                        AND (@month = 0 OR  SalaryReport.month= @month )
                       
                        AND (@year = 0 OR  SalaryReport.year = @year )
                      
                    
                ORDER BY SalaryReport.code


           

      

    END
