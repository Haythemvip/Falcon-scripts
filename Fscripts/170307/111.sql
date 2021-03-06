 
ALTER  PROCEDURE [dbo].[PosSallery]
	-- Add the parameters for the stored procedure here
    @Year INT, @Month INT,@PlanID INt , @ReCalc INT 
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
			  MandopID INT,
			  Planid INT  
            ); 


			IF @ReCalc = 0

			BEGIN 

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
				  MandopID,
				  Planid

			    )
                SELECT  emp_code , -- emp_code - bigint
                        emp_name , -- emp_name - nvarchar(250)
                        SecondName , -- SecondName - nvarchar(250)
                        ISNULL(emp_mob,0) , -- emp_mob - nvarchar(50)
                        Sales , -- Sales - float
                        ISNULL(Sallery,0) , -- Sallery - float
                       SalePercent , -- SalePercent - float
                        ValOmola , -- ValOmola - float
                        Extra , -- Extra - float
                        TotalSallery , -- TotalSallery - float
                        Loan , -- Loan - float
                        Cutting , -- Cutting - float
                        ISNULL(HouwsAlloawns,0) , -- HouwsAlloawns - float
                        TotalCutting , -- TotalCutting - float
                        NetSallery , -- NetSallery - float
                        Notes  -- Notes - nvarchar(max)
						, MandopID
						,Planid

                FROM    dbo.PosSalleryTable 
				
				 WHERE (@PlanID = 0 OR Planid = @PlanID) 
				 AND [YEAR] = @Year  AND [month] = @Month

END 



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
				  MandopID,
				  Planid

			    )
                SELECT  emp_code , -- emp_code - bigint
                        emp_name , -- emp_name - nvarchar(250)
                        SecondName , -- SecondName - nvarchar(250)
                        ISNULL(emp_mob,0) , -- emp_mob - nvarchar(50)
                        0 , -- Sales - float
                        ISNULL(emp_sallery,0) , -- Sallery - float
                        0.0 , -- SalePercent - float
                        0.0 , -- ValOmola - float
                        0.0 , -- Extra - float
                        0.0 , -- TotalSallery - float
                        0.0 , -- Loan - float
                        0.0 , -- Cutting - float
                        ISNULL(emp_Take_Home,0) , -- HouwsAlloawns - float
                        0.0 , -- TotalCutting - float
                        0.0 , -- NetSallery - float
                        N''  -- Notes - nvarchar(max)
						, 0 
						,Planid

                FROM    dbo.emp
				
				WHERE (@PlanID = 0 OR Planid = @PlanID) 



				AND (@ReCalc = 1 OR emp_code NOT IN (SELECT emp_code FROM dbo.PosSalleryTable WHERE [YEAR] = @Year  AND [month] = @Month ))




				UPDATE  #Result SET MandopID = (SELECT MandopID FROM customer_emp WHERE emp_code = dbo.customer_emp.EmpCode)
				 




        UPDATE  #Result
        SET     Sales = (SELECT ISNULL(SUM(aTotal),0) FROM dbo.byan WHERE MandopID = #Result.MandopID AND iyeer = @Year AND DATEPART(MONTH,idate) = @Month  )



        UPDATE  #Result
        SET     SalePercent = (SELECT ISNULL(PercentVaue,0) FROM dbo.customer_emp WHERE #Result.MandopID = dbo.customer_emp.MAndopID  );


		 UPDATE  #Result
        SET     SalePercent = 0 WHERE SalePercent IS NULL 






        UPDATE  #Result
        SET     ValOmola = (Sales * SalePercent)/100

		 UPDATE  #Result
        SET     TotalSallery = ValOmola + Sallery 



		 UPDATE  #Result
        SET     Loan = (SELECT ISNULL(SUM(maden)- SUM(daen),0) FROM dbo.Emp_Account WHERE emp_code = dbo.Emp_Account .venderid AND  dbo.Emp_Account.year = @Year  )




		 UPDATE  #Result
        SET     TotalCutting = Loan + HouwsAlloawns + Cutting  




			 UPDATE  #Result
        SET     NetSallery = TotalSallery - TotalCutting  





        SELECT  *
        FROM    #Result

		ORDER BY emp_code 




    END;
