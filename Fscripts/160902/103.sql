
CREATE PROCEDURE [dbo].[SelectFinalMenuSitting]
	@FainalMenuID int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[ID],
	[FainalMenuID],
	[Name_Ar],
	[Name_En],
	[SortID],
	[isTitle]
FROM
	[dbo].[FinalMenuSittings]
WHERE
	FainalMenuID = @FainalMenuID

ORDER BY [SortID]

GO
