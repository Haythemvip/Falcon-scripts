 
-- =============================================
CREATE PROCEDURE PosSallery
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
              Notes NVARCHAR(MAX)
            ); 





			INSERT INTO #Result
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
			          Notes
			        )
			SELECT emp_code , -- emp_code - bigint
			          emp_name , -- emp_name - nvarchar(250)
			          SecondName , -- SecondName - nvarchar(250)
			          emp_mob , -- emp_mob - nvarchar(50)
			          0 , -- Sales - float
			          0.0 , -- Sallery - float
			          0.0 , -- SalePercent - float
			          0.0 , -- ValOmola - float
			          0.0 , -- Extra - float
			          0.0 , -- TotalSallery - float
			          0.0 , -- Loan - float
			          0.0 , -- Cutting - float
			          0.0 , -- HouwsAlloawns - float
			          0.0 , -- TotalCutting - float
			          0.0 , -- NetSallery - float
			          N''  -- Notes - nvarchar(max)
			     FROM dbo.emp 

        SELECT  *
        FROM    #Result; 




    END;
GO
