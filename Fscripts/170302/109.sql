 
ALTER   PROCEDURE [dbo].[EmpSolfaState]
    @EmpCode BIGINT ,
    @FromDate DATE ,
    @ToDate DATE
AS
    BEGIN
	
        SELECT  empcode ,
                emp_name ,
                jname ,
                depart_name ,
                solafpercent ,
                movedate,
				IqamaID
        FROM    Vsolaf
        WHERE   movedate BETWEEN @FromDate AND @ToDate
                AND (@EmpCode =0 OR empcode = @EmpCode )   


    END;
;
