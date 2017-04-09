
  
ALTER  PROC [dbo].[_CheckIN_All]
    

	@TakeEdafy AS INTEGER = 0,
	@AllChekInType    AllChekInType READONLY
	 
AS


 ------ÇáÍÖæÑ 



    CREATE TABLE #Result
        (
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
          HOURTO float
        )


		INSERT INTO #Result 
		       SELECT * FROM @AllChekInType 


    UPDATE  Emp_Comming
    SET     Emp_Comming.Emp_Time_Comming =  #Result.Emp_Time_Comming ,
            Emp_Time_Out = #Result.Emp_Time_Out ,
            brakeOut = #Result.BrakeOut ,
            brakein = #Result.BrakeIN ,
            CostID = #Result.AccCode 
    FROM    #Result
    WHERE   Emp_Comming.emp_datecomming = #Result.emp_datecomming
            AND Emp_Comming.Emp_Code = #Result.emp_code
                                     
          

			 

    UPDATE  Emp_Comming
    SET     Emp_Time_Out = 0
	 FROM    #Result
    WHERE   Emp_Comming.Emp_Time_Comming = Emp_Comming.Emp_Time_Out
            AND Emp_Comming.emp_datecomming = #Result.emp_datecomming 
            AND Emp_Comming.Emp_Code = #Result.Emp_Code 



    
	 
    UPDATE  Emp_Comming
    SET     comming = 1
	FROM    #Result
    WHERE   Emp_Comming.Emp_Time_Comming IS NOT NULL
             AND Emp_Comming.emp_datecomming = #Result.emp_datecomming 
           AND Emp_Comming.Emp_Code = #Result.Emp_Code 


    UPDATE  Emp_Comming
    SET     comming = 0
	FROM    #Result
    WHERE   Emp_Comming.Emp_Time_Comming = '0'
             AND Emp_Comming.emp_datecomming = #Result.emp_datecomming 
           AND Emp_Comming.Emp_Code = #Result.Emp_Code 
			 

    UPDATE  Emp_Comming
    SET     [out] = 1
		FROM    #Result
    WHERE   Emp_Comming.Emp_Time_Out IS NOT NULL
              AND Emp_Comming.emp_datecomming = #Result.emp_datecomming 
           AND Emp_Comming.Emp_Code = #Result.Emp_Code 

    UPDATE  Emp_Comming
    SET     [out] = 0
		FROM    #Result
    WHERE   Emp_Comming.Emp_Time_Out = '0'
               AND Emp_Comming.emp_datecomming = #Result.emp_datecomming 
           AND Emp_Comming.Emp_Code = #Result.Emp_Code 



    

	IF @TakeEdafy > 0 
	BEGIN

	DELETE FROM emp_edafy WHERE emp_id   in(SELECT  emp_code FROM #Result)  AND edafy_date IN(SELECT emp_datecomming FROM #Result)
	 
	 INSERT INTO dbo.emp_edafy 
	         
	 SELECT emp_code,emp_datecomming ,Emp_Time_Out ,0,edafy_time ,HOURTO ,(HOURTO * edafy_time),1,1 FROM #Result

	 --Update Emp_Comming set  edafy = 1,Emp_Time_Extra = @Emp_Time_Extra , Extra_HOUR_Rate = @Extra_HOUR_Rate Where emp_datecomming = @emp_datecomming and Emp_Code = @Emp_Code



	END




  