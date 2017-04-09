 

ALTER PROCEDURE [dbo].[Emp_WorkPlan]
    @PlanID INT ,
    @ShiftID INT ,
    @FromDate DATE ,
    @ToDate DATE
AS
    

    WHILE @FromDate <= @ToDate
        BEGIN

            INSERT  INTO Emp_Comming
                    SELECT  emp_code ,
                            dbo.ReturnDateChar(@FromDate) AS emp_datecomming ,
                            ( DATENAME(dw, @FromDate) ) AS dayname ,
                            '0' AS Emp_Time_Comming ,
                            '0' AS MacinComming ,
                            '0' AS Emp_Time_Out ,
                            0 AS Emp_Time_Late ,
                            0 AS Emp_Time_Extra ,
                            0 AS Emp_Come_Befor ,
                            0 AS Emp_Out_Befor ,
                            0 AS EmpHDiscount ,
                            0 AS comming ,
                            0 AS ezn ,
                            0 AS vacation ,
                            0 AS out ,
                            0 AS edafy ,
                            0 AS maamorya ,
                            0 AS svacation ,
                            0 AS ghyab_bezn ,
                            @ShiftID AS ShiftID ,
                            1 AS ProunchID ,
                            0 AS COMP_ID ,
                            @PlanID AS planid,
							0 ,0,0,0,0,0,0,0,CostID,0,0,0

                    FROM    emp
                    WHERE   emp.flag = 1
                            AND Planid = @PlanID
                            AND emp_code NOT IN (
                            SELECT  Emp_Code
                            FROM    Emp_Comming
                            WHERE   emp_datecomming = @FromDate )

            SET @FromDate = ( DATEADD(DAY, 1, @FromDate) )

        END

    --INSERT  INTO Emp_Comming
    --        SELECT  *
    --        FROM    #Test 

 
  
 
 
	
	

