CREATE PROCEDURE [dbo].[DeleteFinalMenuSittingsByID]
	@ID int
AS

SET NOCOUNT ON

DELETE FROM [dbo].[FinalMenuSittings]
WHERE
	[ID] = @ID

--endregion

GO