
 ALTER PROC [dbo].[Projects_Rep]
    @Date1 DATE ,
    @Date2 DATE
 AS
    CREATE TABLE #Render
        (
          Project_Code BIGINT ,--ﬂÊœ «·„‘—Ê⁄
          Project_Name NVARCHAR(250) ,--«”„ «·„‘—Ê⁄
          Project_Owner NVARCHAR(250) ,-- «·„«·ﬂ
          Backing NVARCHAR(250) ,--ÃÂ… «·«”‰«œ
          Letter_Christening_Number BIGINT ,--—ﬁ„ Œÿ«» «· ⁄„Ìœ
          Contract_Number BIGINT , -- —ﬁ„ «·⁄ﬁœ
          Contract_Date DATE , -- «—ÌŒ «·⁄ﬁœ
          Downpayment FLOAT ,--«·œ›⁄… «·„ﬁœ„…
          Project_Values FLOAT ,--ﬁÌ„… «·„‘—Ê⁄
          Project_Group NVARCHAR(150) , --„Ã„Ê⁄… «·„‘«—Ì⁄
          Received_Date DATE ,-- «—ÌŒ «·«” ·«„
          project_period NVARCHAR(50) ,-- „œ… «·„‘—Ê⁄
          Date_of_Completion DATE , -- «—ÌŒ «‰ Â«¡ «·„‘—Ê⁄
          Total_Ratio FLOAT ,--‰”»… «·«‰Ã«“ »«·„œ…
          Value_of_the_Business_Completed FLOAT ,--ﬁÌ„… «·«⁄„«· «·„” ﬂ„·…
          Received_Demodulator FLOAT ,--«·„” Œ·’«  «·„” ·„…
          Abstracts_Submitted_for_Exchange BIGINT ,--«·„” Œ·’«  «·„ﬁœ„… ··’—›
          Business_Value_is_not_Executed FLOAT ,--ﬁÌ„… «·«⁄„«· €Ì— «·„‰›–…
          Completion_Rate_Value FLOAT ,--‰”»… «·«‰Ã«“ »«·ﬁÌ„…
          Final_Guarantee_Source NVARCHAR(250) ,--„’œ— «·÷„«‰ «·‰Â«∆Ï
          Final_Guarantee_Value FLOAT , --ﬁÌ„… «·÷„«‰ «·‰Â«∆Ï
          ProjectDayes BIGINT , -- „œ… «· ‰›Ì– »«·«Ì«„
          TendervalueTime NVARCHAR(50) ,
          DayesToNow FLOAT , --«·«Ì«„ „‰ »œ«Ì… «·„‘—Ê⁄ Õ Ï «·«‰ 
          OpiningCollected FLOAT ,
		  Tenders_Type NVARCHAR(max)
        );

	
    INSERT  INTO #Render
            ( Project_Code ,
              Project_Name ,
              Project_Owner ,
              Backing ,
              Letter_Christening_Number ,
              Contract_Number ,
              Contract_Date ,
              Downpayment ,
              Project_Values ,
              Project_Group ,
              Received_Date ,
              project_period ,
              Date_of_Completion ,
              Total_Ratio ,
              Value_of_the_Business_Completed ,
              Received_Demodulator ,
              Abstracts_Submitted_for_Exchange ,
              Business_Value_is_not_Executed ,
              Completion_Rate_Value ,
              Final_Guarantee_Source ,
              Final_Guarantee_Value ,
              ProjectDayes ,
              TendervalueTime ,
              OpiningCollected ,
			  Tenders_Type
		    )
            SELECT  Tenders_Add.ID , -- Project_Code - bigint
                    Tenders_Add.TheName , -- Project_Name - nvarchar(250)
                    dbo.TendersOwnersAdd.TheName , -- Project_Owner - nvarchar(250)
                    Founder , -- Backing - nvarchar(250)
                    0 , -- Letter_Christening_Number - bigint
                    0 , -- Contract_Number - bigint
                    Tender_Tech.StartDate , -- Contract_Date - date
                    0.0 , -- Downpayment - float
                    TenderValue , -- Project_Values - float
                    Tender_Word_Secsion.TheName , -- Project_Group - nvarchar(150)
                    StartDate , -- Received_Date - date
                    TenderTime , -- project_period - nvarchar(50)
                    GETDATE() , -- Date_of_Completion - date
                    0.0 , -- Total_Ratio - float
                    0.0 , -- Value_of_the_Business_Completed - float
                    0 , -- Received_Demodulator - bigint
                    0 , -- Abstracts_Submitted_for_Exchange - bigint
                    0.0 , -- Business_Value_is_not_Executed - float
                    0.0 , -- Completion_Rate_Value - float
                    N'' , -- Final_Guarantee_Source - nvarchar(250)
                    0.0 ,  -- Final_Guarantee_Value - float 
                    0 ,
                    TendervalueTime ,
                    OpiningCollected,
					Tenders_Type.TheName
            FROM    dbo.Tender_Tech
                    INNER JOIN Tenders_Add ON Tenders_Add.ID = dbo.Tender_Tech.TendeID
                    INNER JOIN dbo.TendersOwnersAdd ON dbo.TendersOwnersAdd.ID = Tender_Tech.OwnerID
                    INNER JOIN dbo.Tender_Word_Secsion ON Tender_Word_Secsion.ID = dbo.Tender_Tech.WorkSesionID
					INNER JOIN dbo.Tenders_Type ON Tenders_Type.ID = dbo.Tenders_Add.ID 
					WHERE IsStoped = 0




    UPDATE  #Render
    SET     ProjectDayes = CASE WHEN ( TendervalueTime = 'day' )
                                THEN ( project_period )
                                WHEN ( TendervalueTime = 'week' )
                                THEN ( project_period * 7 )
                                WHEN ( TendervalueTime = 'Month' )
                                THEN ( project_period * 30 )
                                WHEN ( TendervalueTime = 'Year' )
                                THEN ( project_period * 365.25 )
                           END;   

						    
   




    UPDATE  #Render
    SET     DayesToNow = DATEDIFF(DAY, Contract_Date, GETDATE());




	 UPDATE  #Render
    SET     Date_of_Completion = DATEADD(DAY,CAST(ProjectDayes AS NUMERIC), Received_Date);






    UPDATE  #Render
    SET     Total_Ratio = ROUND(DayesToNow
                                / ( CASE WHEN ( ProjectDayes = 0 ) THEN ( 1 )
                                         ELSE ( ProjectDayes )
                                    END ), 4) * 100;
	
	
 


    UPDATE  #Render
    SET     Total_Ratio = CASE WHEN ( ISNULL(Total_Ratio,0) >= 100 ) THEN ( 100 )
                               ELSE ( ISNULL(Total_Ratio,0) )
                          END; 

 

	
    UPDATE  #Render
    SET     Received_Demodulator = ISNULL(OpiningCollected, 0)
            + ( SELECT  ISNULL(SUM(Isal_Vale), 0)
                FROM    dbo.byan
                WHERE   ProjectID = #Render.Project_Code
              );






    UPDATE  #Render
    SET     Abstracts_Submitted_for_Exchange = ( SELECT ISNULL(SUM(Net), 0)
                                                        - ISNULL(SUM(Isal_Vale),
                                                              0)
                                                 FROM   dbo.byan
                                                 WHERE  ProjectID = #Render.Project_Code
                                               );



    --  UPDATE  #Render
    --SET     Abstracts_Submitted_for_Exchange = isnull(OpiningCollected,0) + ( SELECT ISNULL(SUM(net), 0) - ISNULL(SUM(Isal_Vale), 0)
    --                                             FROM   dbo.byan
    --                                             WHERE  ProjectID = #Render.Project_Code
												 
    --                                           );


 


 -- ﬁÌ„… «·«⁄„«· «·„” ﬂ·„…


    UPDATE  #Render
    SET     Value_of_the_Business_Completed = Received_Demodulator
            + Abstracts_Submitted_for_Exchange
            



    UPDATE  #Render
    SET     Completion_Rate_Value = ROUND(Value_of_the_Business_Completed
                                          / ( CASE WHEN ( Project_Values = 0 )
                                                   THEN ( 1 )
                                                   ELSE ( Project_Values )
                                              END ), 4) * 100;







    UPDATE  #Render
    SET     Business_Value_is_not_Executed = Project_Values
            - Value_of_the_Business_Completed;



			 


	


	 --Final_Guarantee_Source NVARCHAR(250) ,--„’œ— «·÷„«‰ «·‰Â«∆Ï
  --        Final_Guarantee_Value FLOAT , --ﬁÌ„… «·÷„«‰ «·‰Â«∆Ï


    UPDATE  #Render
    SET     Final_Guarantee_Source = ( SELECT TOP 1
                                                AccountName
                                       FROM     dbo.Letter_of_Guarantee_Used
                                                INNER JOIN dbo.BankAccountName ON AccountID = dbo.Letter_of_Guarantee_Used.Bank_ID
                                       WHERE    ProjectID = Project_Code
                                       ORDER BY ID DESC
                                     );


    UPDATE  #Render
    SET     Final_Guarantee_Value = ( SELECT TOP 1
                                                NewValue
                                      FROM      dbo.Letter_of_Guarantee_Used
                                      WHERE     ProjectID = Project_Code
                                      ORDER BY  ID DESC
                                    );





    UPDATE  #Render
    SET     project_period = CAST(project_period AS NVARCHAR(50)) + '-'
            + TendervalueTime


			



 


 


 


    SELECT  *
    FROM    #Render;
   