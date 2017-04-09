
ALTER VIEW [dbo].[View_Systems]
AS
SELECT        dbo.Systems.SystemCode, dbo.Systems.SystemName, dbo.Systems.ESystemName, dbo.Systems_Sub.SupSysCode, dbo.Systems_Sub.SystemName_Sub, dbo.Systems_Sub.ESystemName_Sub, 
                         dbo.Systems_Menu.MenuID, dbo.Systems_Menu.SystemMenuName, dbo.Systems_Menu.ESystemMenuName, dbo.Systems_Menu_Users.SSave, dbo.Systems_Menu_Users.SEdit, 
                         dbo.Systems_Menu_Users.SDelte, dbo.Systems_Menu_Users.SPrint, dbo.Systems_Menu_Users.SView, dbo.Systems_Menu_Users.UserID, dbo.Systems_Menu.MenuTag, dbo.Systems_Menu.MenU_URL, 
                         dbo.Systems_Menu.AppCode
FROM            dbo.Systems_Menu_Users INNER JOIN
                         dbo.Systems_Sub INNER JOIN
                         dbo.Systems ON dbo.Systems_Sub.SystemCode = dbo.Systems.SystemCode INNER JOIN
                         dbo.Systems_Menu ON dbo.Systems_Sub.SupSysCode = dbo.Systems_Menu.SupSysCode ON dbo.Systems_Menu_Users.MenuID = dbo.Systems_Menu.MenuID

GO


