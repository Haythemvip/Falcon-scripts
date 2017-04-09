
CREATE PROCEDURE  FinalBalanceForms_Insert_From_Prev



@FinalMenuID INT 
,@NewFinalMenuID INT 

AS



BEGIN
	
	INSERT  INTO dbo.FinalBalanceForms
        ( MezaniaID ,
          GroupId ,
          FinalMenuID ,
          Aaccount_GroupID ,
          MethodID ,
          MethodTitele ,
          Switch_to_positive
        )
        SELECT  MezaniaID ,
                GroupId ,
                @NewFinalMenuID ,
                Aaccount_GroupID ,
                MethodID ,
                MethodTitele ,
                Switch_to_positive
        FROM    dbo.FinalBalanceForms
		WHERE FinalMenuID = @FinalMenuID
		


END
GO
