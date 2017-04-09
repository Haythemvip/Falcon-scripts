 

ALTER PROCEDURE [dbo].[SelectFinalMenuSitting]
	@FainalMenuID INT,
	@GroupId INT 
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	*
FROM
	[dbo].[FinalMenuSittings]
WHERE
	FainalMenuID = @FainalMenuID AND GroupId = @GroupId

ORDER BY [SortID]

