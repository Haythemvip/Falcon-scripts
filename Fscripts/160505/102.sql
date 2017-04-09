
CREATE TYPE AllChekInType AS TABLE(
 
	
	      emp_datecomming DATE ,
          dayname NVARCHAR(50) ,
          emp_code BIGINT ,
          Emp_Name NVARCHAR(max) ,
          Emp_Time_Comming CHAR(5) ,
          brakeOut CHAR(5) ,
          brakein CHAR(5) ,
          Emp_Time_Out CHAR(5) ,
          AccCode BIGINT , -- CostID 
          edafy_time float ,
          HOURTO FLOAT


)
GO
