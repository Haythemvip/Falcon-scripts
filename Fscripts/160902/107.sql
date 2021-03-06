 

ALTER PROCEDURE [dbo].[InsertUpdateFinalMenuSitting]
    @ID INT ,
    @FainalMenuID INT ,
    @Name_Ar NVARCHAR(250) ,
    @Name_En NVARCHAR(250) ,
    @SortID INT ,
    @isTitle INT ,
    @GroupId INT ,
    @GroupName NVARCHAR(50)
AS
    SET NOCOUNT ON;

    IF EXISTS ( SELECT  [ID]
                FROM    [dbo].[FinalMenuSittings]
                WHERE   [ID] = @ID )
        BEGIN
            UPDATE  [dbo].[FinalMenuSittings]
            SET     [FainalMenuID] = @FainalMenuID ,
                    [Name_Ar] = @Name_Ar ,
                    [Name_En] = @Name_En ,
                    [SortID] = @SortID ,
                    [isTitle] = @isTitle ,
                    [GroupId] = @GroupId ,
                    [GroupName] = @GroupName
            WHERE   [ID] = @ID;
        END;
    ELSE
        BEGIN
            INSERT  INTO [dbo].[FinalMenuSittings]
                    ( [FainalMenuID] ,
                      [Name_Ar] ,
                      [Name_En] ,
                      [SortID] ,
                      [isTitle] ,
                      [GroupId] ,
                      [GroupName]
	                )
            VALUES  ( @FainalMenuID ,
                      @Name_Ar ,
                      @Name_En ,
                      @SortID ,
                      @isTitle ,
                      @GroupId ,
                      @GroupName
	                );
        END;
