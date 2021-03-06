 

 
ALTER PROCEDURE [dbo].[Appointmet] @UserID INTEGER
AS
    BEGIN
	
	 
        SELECT  AppID ,
                AppDesc ,
                'APP' AS CaseType
        FROM    Appointment
        WHERE   UserID = @UserID
                AND isdone = 0
                AND DATEDIFF(MINUTE, ( CONVERT(DATETIME, GETDATE()) ),
                             ( CONVERT(DATETIME, AppDate) + AppTime )) <= 0
        UNION
        SELECT  emp_code AS AppID ,
                (  IqamaID + ' - ' + emp_name + ' -'
                  + BarCode ) AS AppDesc ,
                'الاقامة - EMP ID' AS CaseType
        FROM    dbo.emp
        WHERE   DATEDIFF(DAY, ( DATEADD(DAY, 30, GETDATE()) ),
                         ( emp_lwork_enddate )) < = 0
                AND flag = 1
        UNION
        SELECT  emp_code AS AppID ,
                (  PassportID + ' - ' + emp_name + ' - '
                  + BarCode ) AS AppDesc ,
                'الجواز - EMP Passport' AS CaseType
        FROM    dbo.emp
        WHERE   DATEDIFF(DAY, ( DATEADD(DAY, 30, GETDATE()) ),
                         ( CAST(datein AS DATE) )) < = 0
                AND flag = 1

    END
