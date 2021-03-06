 

 create  PROC [dbo].[Visa_Sub_SP] @Visa_NO BIGINT = 0
 AS --Visa_Sub


 

    CREATE TABLE #Visa_Sub_Emp
        (
          ID BIGINT ,
          Visa_NO_ID INT ,
          Visa_NO NVARCHAR(50) ,
          NationalityID INT ,
          Nationality NVARCHAR(50) ,
          jobID INT ,
          job NVARCHAR(50) ,
          Visa_Count INT ,
          Visa_Used INT ,
          Visa_Still INT
        )



    INSERT  #Visa_Sub_Emp
            ( ID ,
              Visa_NO_ID ,
              Visa_NO ,
              NationalityID ,
              Nationality ,
              jobID ,
              job ,
              Visa_Count ,
              Visa_Used ,
              Visa_Still
		    )
            SELECT  ID ,
                    Visa_NO_ID ,
                    Visa_Sub.Visa_NO ,
                    Visa_Sub.NationalityID ,
                    Nationality ,
                    Visa_Sub.jobid ,
                    jname ,
                    Visa_Count ,
                    0 ,
                    0
            FROM    Visa_Sub
                    INNER JOIN dbo.Nationality ON Nationality.NationalityID = Visa_Sub.NationalityID
                    INNER JOIN dbo.jobs ON jobs.jobid = Visa_Sub.jobid
            WHERE   ( @Visa_NO = 0
                      OR Visa_Sub.Visa_NO = @Visa_NO
                    )
                        
                       
       
    UPDATE  #Visa_Sub_Emp
    SET     Visa_Used = ( SELECT    COUNT(emp_code)
                          FROM      dbo.emp
                          WHERE     jophasbendplace = #Visa_Sub_Emp.Visa_NO
                                    AND NationalityID = #Visa_Sub_Emp.NationalityID
                                    AND jobid = #Visa_Sub_Emp.jobID
                        )
                        
 


    UPDATE  #Visa_Sub_Emp
    SET     Visa_Still = Visa_Count - Visa_Used



    SELECT  *
    FROM    #Visa_Sub_Emp
    


