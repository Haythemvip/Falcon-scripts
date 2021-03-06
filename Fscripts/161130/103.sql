 
CREATE  PROCEDURE [dbo].[Final_Ratio_Setting_SP]
    @FinalMenuID INT ,
    @Aaccount_GroupID INT ,
    @MethodID INT ,
    @MethodTitele NVARCHAR(50) ,
    @Switch_to_positive INT
AS
    SET NOCOUNT ON;

    IF EXISTS ( SELECT  [Aaccount_GroupID]
                FROM    [dbo].[Final_Ratio_Setting]
                WHERE   [Aaccount_GroupID] = @Aaccount_GroupID
                        AND FinalMenuID = @FinalMenuID )
        BEGIN
            UPDATE  [dbo].[Final_Ratio_Setting]
            SET     [MethodID] = @MethodID ,
                    [MethodTitele] = @MethodTitele ,
                    Switch_to_positive = @Switch_to_positive
            WHERE   [Aaccount_GroupID] = @Aaccount_GroupID
                    AND FinalMenuID = @FinalMenuID;
        END;
    ELSE
        BEGIN
 
            INSERT  INTO [dbo].[Final_Ratio_Setting]
                    ( [FinalMenuID] ,
                      [Aaccount_GroupID] ,
                      [MethodID] ,
                      [MethodTitele] ,
                      [Switch_to_positive]
	                )
            VALUES  ( @FinalMenuID , -- FinalMenuID - int
                      @Aaccount_GroupID , -- Aaccount_GroupID - int
                      @MethodID , -- MethodID - int
                      @MethodTitele ,
                      @Switch_to_positive
	                );	 
        END;


