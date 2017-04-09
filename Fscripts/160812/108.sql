 
CREATE PROCEDURE SaveSystem_Menu_Users
    @UserID BIGINT = 0 ,
    @System_Menu_Users_Type System_Menu_Users_Type READONLY
AS
    BEGIN
 
        DELETE  FROM dbo.Systems_Menu_Users
        WHERE   UserID = @UserID
                AND MenuID IN ( SELECT  MenuID
                                FROM    @System_Menu_Users_Type )
            
  
        INSERT  INTO Systems_Menu_Users
                ( UserID ,
                  MenuID ,
                  SSave ,
                  SEdit ,
                  SDelte ,
                  SPrint ,
                  SView
                )
                SELECT  @UserID ,
                        *
                FROM    @System_Menu_Users_Type
            


       


    END
GO
