


 CREATE TABLE MandopOmola
            (
			 ID INT ,
              idate DATE ,
              Tahseel NVARCHAR(50) ,
              servicetype NVARCHAR(50) ,
              customer_name NVARCHAR(250) ,
              TotalPrice FLOAT ,
              store_id BIGINT ,
              tahseldate DATE ,
              InvoiceNo BIGINT ,
              Mandop_Name NVARCHAR(100) ,
              TotalCost FLOAT NULL ,
              ItemMaksab FLOAT NULL ,
              InvoiceType NVARCHAR(50) ,
              ValPonas DECIMAL(18, 2) ,
              Chargevalue DECIMAL(18, 2) ,
              ExactCharge DECIMAL(18, 2) ,
              Omola DECIMAL(18, 2) ,
              Omola_Percent DECIMAL(18, 6) ,
              Net_Percent DECIMAL(18, 6) ,
              Net_Chartg DECIMAL(18, 6) ,
              Net_profit DECIMAL(18, 6) ,
              Indirect_Cost DECIMAL(18, 6) ,
              CollectCount int ,
              Indirect_Cost_Percent DECIMAL(18, 6) ,
              NetCost DECIMAL(18, 6) ,
              MAndopID INT
            )
      
        
        CREATE TABLE MandopOmola_Total
            (
			  ID INT ,
              MandopID INT ,
              Mandop_Name NVARCHAR(100) ,
              TotalSales DECIMAL(18, 2) ,
              Targetvalue DECIMAL(18, 2) ,
              TargetPercent DECIMAL(18, 2) ,
              OmolaValue DECIMAL(18, 2) ,
              net_Omola DECIMAL(18, 2)
            )

