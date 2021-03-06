 

 ALTER PROC [dbo].[Projects_Rep]
    @Date1 DATE ,
    @Date2 DATE
 AS
    CREATE TABLE #Render
        (
          Project_Code BIGINT ,--كود المشروع
          Project_Name NVARCHAR(250) ,--اسم المشروع
          Project_Owner NVARCHAR(250) ,-- المالك
          Backing NVARCHAR(250) ,--جهة الاسناد
          Letter_Christening_Number BIGINT ,--رقم خطاب التعميد
          Contract_Number BIGINT , -- رقم العقد
          Contract_Date DATE , --تاريخ العقد
          Downpayment FLOAT ,--الدفعة المقدمة
          Project_Values FLOAT ,--قيمة المشروع
          Project_Group NVARCHAR(150) , --مجموعة المشاريع
          Received_Date DATE ,--تاريخ الاستلام
          project_period NVARCHAR(50) ,-- مدة المشروع
          Date_of_Completion DATE , --تاريخ انتهاء المشروع
          Total_Ratio FLOAT ,--نسبة الانجاز بالمدة
          Value_of_the_Business_Completed FLOAT ,--قيمة الاعمال المستكملة
          Received_Demodulator FLOAT ,--المستخلصات المستلمة
          Abstracts_Submitted_for_Exchange BIGINT ,--المستخلصات المقدمة للصرف
          Business_Value_is_not_Executed FLOAT ,--قيمة الاعمال غير المنفذة
          Completion_Rate_Value FLOAT ,--نسبة الانجاز بالقيمة
          Final_Guarantee_Source NVARCHAR(250) ,--مصدر الضمان النهائى
          Final_Guarantee_Value FLOAT , --قيمة الضمان النهائى
          ProjectDayes BIGINT , -- مدة التنفيذ بالايام
          TendervalueTime NVARCHAR(50) ,
          DayesToNow FLOAT , --الايام من بداية المشروع حتى الان 
		  OpiningCollected FLOAT 
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
              TendervalueTime,
			  OpiningCollected
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
                    GETDATE() , -- Received_Date - date
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

                    TendervalueTime,
					OpiningCollected

            FROM    dbo.Tender_Tech
                    INNER JOIN Tenders_Add ON Tenders_Add.ID = dbo.Tender_Tech.TendeID
                    INNER JOIN dbo.TendersOwnersAdd ON dbo.TendersOwnersAdd.ID = Tender_Tech.OwnerID
                    INNER JOIN dbo.Tender_Word_Secsion ON Tender_Word_Secsion.ID = dbo.Tender_Tech.WorkSesionID; 




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
    SET     Total_Ratio = ROUND(DayesToNow
                                / ( CASE WHEN ( ProjectDayes = 0 ) THEN ( 1 )
                                         ELSE ( ProjectDayes )
                                    END ), 4) * 100;
	
	
 


    UPDATE  #Render
    SET     Total_Ratio = CASE WHEN ( Total_Ratio >= 100 ) THEN ( 100 )
                               ELSE ( Total_Ratio )
                          END; 



	
    UPDATE  #Render
    SET     Received_Demodulator =  isnull(OpiningCollected,0) + ( SELECT ISNULL(SUM(Isal_Vale), 0)
                                     FROM   dbo.byan
                                     WHERE  ProjectID = #Render.Project_Code
                                   ) ;






    UPDATE  #Render
    SET     Abstracts_Submitted_for_Exchange = isnull(OpiningCollected,0) + ( SELECT ISNULL(SUM(Net), 0)
                                                 FROM   dbo.byan
                                                 WHERE  ProjectID = #Render.Project_Code
                                               );



    UPDATE  #Render
    SET     Completion_Rate_Value = ROUND(Abstracts_Submitted_for_Exchange
                                          / ( CASE WHEN ( Project_Values = 0 )
                                                   THEN ( 1 )
                                                   ELSE ( Project_Values )
                                              END ), 4) * 100;


 

    UPDATE  #Render
    SET     Business_Value_is_not_Executed = Project_Values
            - Value_of_the_Business_Completed;



			 


	-- قيمة الاعمال المستكلمة


    UPDATE  #Render
    SET     Value_of_the_Business_Completed = Project_Values
            - Received_Demodulator;


	 --Final_Guarantee_Source NVARCHAR(250) ,--مصدر الضمان النهائى
  --        Final_Guarantee_Value FLOAT , --قيمة الضمان النهائى


    UPDATE  #Render
    SET     Final_Guarantee_Source = ( SELECT  TOP 1  AccountName
                                       FROM     dbo.Letter_of_Guarantee_Used
                                                INNER JOIN dbo.BankAccountName ON AccountID = dbo.Letter_of_Guarantee_Used.Bank_ID
                                       WHERE    projectID = Project_Code

									   ORDER BY ID DESC 
                                     );


  UPDATE  #Render
    SET     Final_Guarantee_Value = ( SELECT  TOP 1  NewValue
                                       FROM     dbo.Letter_of_Guarantee_Used
                                                
                                       WHERE    projectID = Project_Code

									   ORDER BY ID DESC 
                                     );







    SELECT  *
    FROM    #Render;
   