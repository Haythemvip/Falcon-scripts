
CREATE PROCEDURE [dbo].[InsertUpdateFinalMenuSitting]
	@ID int,
	@FainalMenuID int,
	@Name_Ar nvarchar(250),
	@Name_En nvarchar(250),
	@SortID INT,
	@isTitle int
    
AS

SET NOCOUNT ON

IF EXISTS(SELECT [ID] FROM [dbo].[FinalMenuSittings] WHERE [ID] = @ID)
BEGIN
	UPDATE [dbo].[FinalMenuSittings] SET
		[FainalMenuID] = @FainalMenuID,
		[Name_Ar] = @Name_Ar,
		[Name_En] = @Name_En,
		[SortID] = @SortID,
		[isTitle] = @isTitle
	WHERE
		[ID] = @ID
END
ELSE
BEGIN
	INSERT INTO [dbo].[FinalMenuSittings] (
		 
		[FainalMenuID],
		[Name_Ar],
		[Name_En],
		[SortID],
		[isTitle]
	) VALUES (
		 
		@FainalMenuID,
		@Name_Ar,
		@Name_En,
		@SortID,
		@isTitle
	)
END
