 
ALTER  PROCEDURE PosSallery
	-- Add the parameters for the stored procedure here
    @Year INT, @Month INT
AS
    BEGIN
	

        CREATE TABLE #Result
            (
              emp_code BIGINT ,
              emp_name NVARCHAR(250) ,
              SecondName NVARCHAR(250) ,
              emp_mob NVARCHAR(50) ,
              Sales FLOAT ,
              Sallery FLOAT ,
              SalePercent FLOAT ,
              ValOmola FLOAT ,
              Extra FLOAT ,
              TotalSallery FLOAT ,
              Loan FLOAT ,
              Cutting FLOAT ,
              HouwsAlloawns FLOAT ,
              TotalCutting FLOAT ,
              NetSallery FLOAT ,
              Notes NVARCHAR(MAX),
			  MandopID INT 
            ); 





        INSERT  INTO #Result
                ( emp_code ,
                  emp_name ,
                  SecondName ,
                  emp_mob ,
                  Sales ,
                  Sallery ,
                  SalePercent ,
                  ValOmola ,
                  Extra ,
                  TotalSallery ,
                  Loan ,
                  Cutting ,
                  HouwsAlloawns ,
                  TotalCutting ,
                  NetSallery ,
                  Notes,
				  MandopID

			    )
                SELECT  emp_code , -- emp_code - bigint
                        emp_name , -- emp_name - nvarchar(250)
                        SecondName , -- SecondName - nvarchar(250)
                        emp_mob , -- emp_mob - nvarchar(50)
                        0 , -- Sales - float
                        emp_sallery , -- Sallery - float
                        0.0 , -- SalePercent - float
                        0.0 , -- ValOmola - float
                        0.0 , -- Extra - float
                        0.0 , -- TotalSallery - float
                        0.0 , -- Loan - float
                        0.0 , -- Cutting - float
                        emp_Take_Home , -- HouwsAlloawns - float
                        0.0 , -- TotalCutting - float
                        0.0 , -- NetSallery - float
                        N''  -- Notes - nvarchar(max)
						, 0 


                FROM    dbo.emp; 
				




				UPDATE  #Result SET MandopID = (SELECT MandopID FROM customer_emp WHERE emp_code = dbo.customer_emp.EmpCode)
				 




        UPDATE  #Result
        SET     Sales = (SELECT SUM(aTotal) FROM dbo.byan WHERE MandopID = #Result.MandopID AND iyeer = @Year AND DATEPART(MONTH,idate) = @Month  )





 
	 


        UPDATE  #Result
        SET     SalePercent = (SELECT customer_emp.PercentVaue FROM dbo.customer_emp WHERE #Result.MandopID = dbo.customer_emp.MAndopID  );


        UPDATE  #Result
        SET     ValOmola = (Sales * SalePercent)/100

		 UPDATE  #Result
        SET     TotalSallery = ValOmola + Sallery 



		 UPDATE  #Result
        SET     Loan = (SELECT SUM(maden)- SUM(daen) FROM dbo.Emp_Account WHERE emp_code = dbo.Emp_Account .venderid AND  dbo.Emp_Account.year = @Year  )




		 UPDATE  #Result
        SET     TotalCutting = Loan + HouwsAlloawns + Cutting  




			 UPDATE  #Result
        SET     NetSallery = TotalSallery - TotalCutting  





        SELECT  *
        FROM    #Result

		ORDER BY emp_code 




    END;
GO
