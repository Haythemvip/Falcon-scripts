
  
ALTER PROC [dbo].[_CheckIN]
    @MachineNumber CHAR(4) ,
    @CostID BIGINT = 0 ,
    @AttendanceType AttendanceType READONLY
AS
    DECLARE @d AS DATE
 
    INSERT  INTO [CheckIN]
            ( [code] ,
              [Date] ,
              [time] ,
              MachineNumber ,
              InOutMode ,
              VerifyMode
            )
            SELECT  code ,
                    Date ,
                    time ,
                    @MachineNumber ,
                    InOutMode ,
                    VerifyMode
            FROM    @AttendanceType

   

    
    


------الحضور والانصاراف

   



    UPDATE  Emp_Comming
    SET     Emp_Comming.Emp_Time_Comming = g.timein ,
            CostID = @CostID
    FROM    Emp_Comming
            INNER JOIN ( SELECT MIN(CheckIN.time) AS timein ,
                                CheckIN.code ,
                                CheckIN.Date AS date ,
                                WorkPlanEdite.Brakeout ,
                                WorkPlanEdite.Brakein
                         FROM   CheckIN
                                INNER JOIN emp ON CheckIN.code = emp.emp_code
                                INNER JOIN WorkPlanEdite ON emp.Planid = WorkPlanEdite.Planid
                                                            AND emp.ShiftID = WorkPlanEdite.ShiftID
                         WHERE  time < WorkPlanEdite.DateEnd
                         GROUP BY CheckIN.code ,
                                CheckIN.Date ,
                                WorkPlanEdite.Brakeout ,
                                WorkPlanEdite.Brakein
                       ) g ON Emp_Comming.Emp_Code = g.code
                              AND Emp_Comming.emp_datecomming = g.date
            INNER JOIN CheckIN ON Emp_Comming.emp_datecomming = CheckIN.Date
                                  AND Emp_Code = CheckIN.code





    UPDATE  Emp_Comming
    SET     Emp_Comming.Emp_Time_Out = g.timeout
    FROM    Emp_Comming
            INNER JOIN ( SELECT MAX(CheckIN.time) AS timeout ,
                                CheckIN.code ,
                                CheckIN.Date AS date ,
                                WorkPlanEdite.Brakeout ,
                                WorkPlanEdite.Brakein
                         FROM   CheckIN
                                INNER JOIN emp ON CheckIN.code = emp.emp_code
                                INNER JOIN WorkPlanEdite ON emp.Planid = WorkPlanEdite.Planid
                                                            AND emp.ShiftID = WorkPlanEdite.ShiftID
                         WHERE  time > WorkPlanEdite.DateStart
                                AND time > WorkPlanEdite.Brakein
                         GROUP BY CheckIN.code ,
                                CheckIN.Date ,
                                WorkPlanEdite.Brakeout ,
                                WorkPlanEdite.Brakein
                       ) g ON Emp_Comming.Emp_Code = g.code
                              AND Emp_Comming.emp_datecomming = g.date
            INNER JOIN CheckIN ON Emp_Comming.emp_datecomming = CheckIN.Date
                                  AND Emp_Code = CheckIN.code



    --UPDATE  Emp_Comming
    --SET     Emp_Comming.Emp_Time_Comming = g.timein ,
    --        Emp_Comming.Emp_Time_Out = g.timeout
    --FROM    Emp_Comming
    --        INNER JOIN ( SELECT timein = MIN([time]) ,
    --                            timeout = MAX([time]) ,
    --                            code = code ,
    --                            date = Date
    --                     FROM   CheckIN
    --                     GROUP BY code ,
    --                            Date
    --                   ) g ON Emp_Comming.Emp_Code = g.code
    --                          AND Emp_Comming.emp_datecomming = g.date
    --WHERE   Emp_Comming.emp_datecomming = @d


--وقت البريك

    UPDATE  Emp_Comming
    SET     Emp_Comming.brakeOut = g.timeout
    FROM    Emp_Comming
            INNER JOIN ( SELECT MIN(CheckIN.time) AS timeout ,
                                CheckIN.code ,
                                CheckIN.Date AS date ,
                                WorkPlanEdite.Brakeout ,
                                WorkPlanEdite.Brakein
                         FROM   CheckIN
                                INNER JOIN emp ON CheckIN.code = emp.emp_code
                                INNER JOIN WorkPlanEdite ON emp.Planid = WorkPlanEdite.Planid
                                                            AND emp.ShiftID = WorkPlanEdite.ShiftID
                         WHERE  time > WorkPlanEdite.Brakeout
                                AND time < WorkPlanEdite.Brakein
                         GROUP BY CheckIN.code ,
                                CheckIN.Date ,
                                WorkPlanEdite.Brakeout ,
                                WorkPlanEdite.Brakein
                       ) g ON Emp_Comming.Emp_Code = g.code
                              AND Emp_Comming.emp_datecomming = g.date
            INNER JOIN CheckIN ON Emp_Comming.emp_datecomming = CheckIN.Date
                                  AND Emp_Code = CheckIN.code

	
    



    UPDATE  Emp_Comming
    SET     Emp_Comming.brakein = g.timein
    FROM    Emp_Comming
            INNER JOIN ( SELECT MAX(CheckIN.time) AS timein ,
                                CheckIN.code ,
                                CheckIN.Date AS date ,
                                WorkPlanEdite.Brakeout ,
                                WorkPlanEdite.Brakein
                         FROM   CheckIN
                                INNER JOIN emp ON CheckIN.code = emp.emp_code
                                INNER JOIN WorkPlanEdite ON emp.Planid = WorkPlanEdite.Planid
                                                            AND emp.ShiftID = WorkPlanEdite.ShiftID
                         WHERE  time > WorkPlanEdite.Brakeout
                                AND time < WorkPlanEdite.DateEnd
                         GROUP BY CheckIN.code ,
                                CheckIN.Date ,
                                WorkPlanEdite.Brakeout ,
                                WorkPlanEdite.Brakein
                       ) g ON Emp_Comming.Emp_Code = g.code
                              AND Emp_Comming.emp_datecomming = g.date
            INNER JOIN CheckIN ON Emp_Comming.emp_datecomming = CheckIN.Date
                                  AND Emp_Code = CheckIN.code
	 

 


    --UPDATE  Emp_Comming
    --SET     brakeOut = 0
    --WHERE   brakeOut = Emp_Time_Comming
          



    --UPDATE  Emp_Comming
    --SET     brakein = 0
    --WHERE   brakein = brakeOut
          




    --UPDATE  Emp_Comming
    --SET     comming = 1
    --WHERE   Emp_Time_Comming IS NOT NULL
             


    --UPDATE  Emp_Comming
    --SET     comming = 0
    --WHERE   Emp_Time_Comming = '0'
            
			 

    --UPDATE  Emp_Comming
    --SET     [out] = 1
    --WHERE   Emp_Time_Out IS NOT NULL
            

    --UPDATE  Emp_Comming
    --SET     [out] = 0
    --WHERE   Emp_Time_Out = '0'
            



    



  