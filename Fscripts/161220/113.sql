

 

 CREATE PROC [dbo].[Projects_Rep]
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
          Total_Ratio FLOAT ,--‰”»… «·«Ã„«·Ï »«·„œ…
          Value_of_the_Business_Completed FLOAT ,--ﬁÌ„… «·«⁄„«· «·„” ﬂ„·…
          Received_Demodulator BIGINT ,--«·„” Œ·’«  «·„” ·„…
          Abstracts_Submitted_for_Exchange BIGINT ,--«·„” Œ·’«  «·„ﬁœ„… ··’—›
          Business_Value_is_not_Executed FLOAT ,--ﬁÌ„… «·«⁄„«· €Ì— «·„‰›–…
          Completion_Rate_Value FLOAT ,--‰”»… «·«‰Ã«“ »«·ﬁÌ„…
          Final_Guarantee_Source NVARCHAR(250) ,--„’œ— «·÷„«‰ «·‰Â«∆Ï
          Final_Guarantee_Value FLOAT , --ﬁÌ„… «·÷„«‰ «·‰Â«∆Ï







        )



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
              Final_Guarantee_Value
		    )
            SELECT  Tenders_Add.ID , -- Project_Code - bigint
                    Tenders_Add.TheName , -- Project_Name - nvarchar(250)
                    dbo.TendersOwnersAdd.TheName , -- Project_Owner - nvarchar(250)
                    Founder , -- Backing - nvarchar(250)
                    0 , -- Letter_Christening_Number - bigint
                    0 , -- Contract_Number - bigint
                    Tenders_Add.DateArrive  , -- Contract_Date - date
                    0.0 , -- Downpayment - float
                    TenderValue , -- Project_Values - float
                    Tender_Word_Secsion.TheName , -- Project_Group - nvarchar(150)
                    GETDATE() , -- Received_Date - date
                    CAST(TenderTime AS NVARCHAR(50)) + '  ' + TendervalueTime , -- project_period - nvarchar(50)
                    GETDATE() , -- Date_of_Completion - date
                    0.0 , -- Total_Ratio - float
                    0.0 , -- Value_of_the_Business_Completed - float
                    0 , -- Received_Demodulator - bigint
                    0 , -- Abstracts_Submitted_for_Exchange - bigint
                    0.0 , -- Business_Value_is_not_Executed - float
                    0.0 , -- Completion_Rate_Value - float
                    N'' , -- Final_Guarantee_Source - nvarchar(250)
                    0.0  -- Final_Guarantee_Value - float
            FROM    dbo.Tender_Tech
                    INNER JOIN Tenders_Add ON Tenders_Add.ID = dbo.Tender_Tech.TendeID
                    INNER JOIN dbo.TendersOwnersAdd ON dbo.TendersOwnersAdd.ID = Tender_Tech.OwnerID
                    INNER JOIN dbo.Tender_Word_Secsion ON Tender_Word_Secsion.ID = dbo.Tender_Tech.WorkSesionID 









    SELECT  *
    FROM    #Render
   