 
CREATE PROCEDURE UpdateEmpID_Select @ID BIGINT
AS
    BEGIN
	
        CREATE TABLE #Result
            (
              [ID] [BIGINT] NULL ,
              [DateFrom] [NVARCHAR](50) NULL ,
              [DateTo] [NVARCHAR](50) NULL ,
              [DateHijriFrom] [NVARCHAR](50) NULL ,
              [DateHigriTo] [NVARCHAR](50) NULL ,
              [EmpCode] [BIGINT] NULL ,
              [IqamaDate] [NVARCHAR](50) NULL ,
              [IqamaHijri] [NVARCHAR](50) NULL ,
              [WorK_Lic_NO] [NVARCHAR](50) NULL ,
              [Work_Lic_Value] [FLOAT] NULL ,
              [ID_Renewual_Value] [FLOAT] NULL,
			  [BarCode] NVARCHAR(50),
			  [emp_name] NVARCHAR(max),
			  [IqamaID] NVARCHAR(50),
			  [PassportID] NVARCHAR(50),
			  [datein] NVARCHAR( 50),
			  [emp_idc_from] NVARCHAR(50)
            );



        INSERT  INTO #Result
                ( ID ,
                  DateFrom ,
                  DateTo ,
                  DateHijriFrom ,
                  DateHigriTo ,
                  EmpCode ,
                  IqamaDate ,
                  IqamaHijri ,
                  WorK_Lic_NO ,
                  Work_Lic_Value ,
                  ID_Renewual_Value,
				  BarCode,
				  emp_name,
				  IqamaID,
				  PassportID,
				  datein,emp_idc_from
	            )
                SELECT  ID ,
                        DateFrom ,
                        DateTo ,
                        DateHijriFrom ,
                        DateHigriTo ,
                        EmpCode ,
                        IqamaDate ,
                        IqamaHijri ,
                        WorK_Lic_NO ,
                        Work_Lic_Value ,
                        ID_Renewual_Value,
						BarCode,emp_name,IqamaID,PassportID,datein,emp_idc_from

                FROM    dbo.UpdateEmpID
				INNER JOIN dbo.emp ON emp_code = EmpCode 
                WHERE   ID = @ID; 
        SELECT  *
        FROM    #Result; 



    END;
GO
