

CREATE PROCEDURE [dbo].[FinalBalanceForms_Insirt]
    @MezaniaID INT ,
    @GroupId INT ,
    @FinalMenuID INT ,
    @Aaccount_GroupID INT ,
    @MethodID INT ,
    @MethodTitele NVARCHAR(50)
AS
    SET NOCOUNT ON;

    IF EXISTS ( SELECT  [Aaccount_GroupID]
                FROM    [dbo].[FinalBalanceForms]
                WHERE   [Aaccount_GroupID] = @Aaccount_GroupID
                        AND MezaniaID = @MezaniaID
                        AND GroupId = @GroupId
                        AND FinalMenuID = @FinalMenuID )
        BEGIN
            UPDATE  [dbo].[FinalBalanceForms]
            SET     [MethodID] = @MethodID ,
                    [MethodTitele] = @MethodTitele
            WHERE   [Aaccount_GroupID] = @Aaccount_GroupID
                    AND MezaniaID = @MezaniaID
                    AND GroupId = @GroupId
                    AND FinalMenuID = @FinalMenuID;
        END;
    ELSE
        BEGIN
 
            INSERT  INTO [dbo].[FinalBalanceForms]
                    ( [MezaniaID] ,
                      [GroupId] ,
                      [FinalMenuID] ,
                      [Aaccount_GroupID] ,
                      [MethodID] ,
                      [MethodTitele]
	                )
            VALUES  ( @MezaniaID , -- MezaniaID - int
                      @GroupId , -- GroupId - int
                      @FinalMenuID , -- FinalMenuID - int
                      @Aaccount_GroupID , -- Aaccount_GroupID - int
                      @MethodID , -- MethodID - int
                      @MethodTitele  -- MethodTitele - nvarchar(50)
	                );	 
        END;


