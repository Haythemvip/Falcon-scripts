 

CREATE  PROCEDURE  Final_Ratio_Setting_Insert_From_Prev



@FinalMenuID INT 
,@NewFinalMenuID INT 

AS



BEGIN
	
	INSERT  INTO dbo.Final_Ratio_Setting
        (  
          FinalMenuID ,
          Aaccount_GroupID ,
          MethodID ,
          MethodTitele ,
          Switch_to_positive
        )
        SELECT  
                @NewFinalMenuID ,
                Aaccount_GroupID ,
                MethodID ,
                MethodTitele ,
                Switch_to_positive
        FROM    dbo.Final_Ratio_Setting
		WHERE FinalMenuID = @FinalMenuID
		


END
