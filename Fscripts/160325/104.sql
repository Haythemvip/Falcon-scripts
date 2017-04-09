 

  
ALTER  PROC [dbo].[Insurances_dues]
AS
    CREATE TABLE #Result
        (
          emp_code BIGINT ,
          emp_name NVARCHAR(200) ,
          jname NVARCHAR(100) ,
          depart_name NVARCHAR(150) ,
          emp_tamensallery FLOAT ,
          emp_tamensalleryCanged FLOAT ,
          EmpVlue FLOAT ,
          OwnerValue FLOAT ,
          Sumary FLOAT ,
          empFix FLOAT ,
          EmpChanged FLOAT ,
          ComFix FLOAT ,
          ComChanged FLOAT ,
          otherDicoount FLOAT ,
          emp_Take_Home FLOAT ,  -- ÈÏá Óßä
          Badal_Sakan BIT ,
          TotalSalleary FLOAT ,
          diffrent FLOAT ,
          DefaultSallry FLOAT ,
          Paid FLOAT ,
          TotalEmpShare FLOAT
        )
     

    INSERT  INTO #Result
            SELECT  emp.emp_code ,
                    emp.emp_name ,
                    jobs.jname ,
                    departments.depart_name ,
                    emp.emp_tamensallery ,
                    emp.emp_tamensalleryCanged ,
                    0.00 AS EmpVlue ,
                    0.00 AS OwnerValue ,
                    0.00 AS Sumary ,
                    EmpTamen.EmpFix ,
                    EmpTamen.EmpChanged ,
                    EmpTamen.ComFix ,
                    EmpTamen.ComChanged ,
                    emp.anohterDescount ,
                    emp.emp_Take_Home ,
                    EmpTamen.Badal_Sakan ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0
            FROM    emp
                    INNER JOIN jobs ON jobs.jobid = emp.jobid
                    INNER JOIN departments ON departments.depart_id = emp.depart_id
                    INNER JOIN EmpTamen ON emp.NationalityID = EmpTamen.ID


 


   



    UPDATE  #Result
    SET     DefaultSallry = ( CASE WHEN ( Badal_Sakan = 0 )
                                   THEN ( ( ISNULL(emp_tamensallery, 0) ) )
                                   ELSE ( ISNULL(emp_tamensallery, 0)
                                          + ISNULL(emp_Take_Home, 0) )
                              END )




    UPDATE  #Result
    SET     EmpVlue = ( DefaultSallry * ISNULL(empFix, 0) ) / 100
            + ( ISNULL(emp_tamensalleryCanged, 0) * ISNULL(EmpChanged, 0) )
            / 100    



    UPDATE  #Result
    SET     Paid = ( otherDicoount * ( ISNULL(empFix, 0) + ISNULL(ComFix, 0) ) )
            / 100 + ( ISNULL(emp_tamensalleryCanged, 0) * ISNULL(EmpChanged, 0) )
            / 100    


    UPDATE  #Result
    SET     OwnerValue = ( DefaultSallry ) * ISNULL(ComFix, 0) / 100
            + ( ISNULL(emp_tamensalleryCanged, 0) * ISNULL(ComChanged, 0)
                / 100 )





    UPDATE  #Result
    SET     Sumary = ( EmpVlue ) + ( OwnerValue )




    UPDATE  #Result
    SET     TotalSalleary = emp_tamensallery + emp_Take_Home



    UPDATE  #Result
    SET     diffrent = Paid - Sumary



 UPDATE  #Result
    SET     TotalEmpShare = (Paid - Sumary)+EmpVlue







    SELECT  *
    FROM    #Result
    WHERE   Sumary > 0




