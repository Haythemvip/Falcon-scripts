 
ALTER PROCEDURE [dbo].[DeleteFinalMenuSittingsByID] @ID INT
AS
    SET NOCOUNT ON;

    DELETE  FROM [dbo].[FinalMenuSittings]
    WHERE   [ID] = @ID;


    DELETE  FROM FinalBalanceForms
    WHERE   FinalMenuID = @ID
         


--endregion

