 
ALTER VIEW [dbo].[Vsupgruop]
AS
SELECT dbo.Groups_Sub.subid, dbo.Groups.groupname, dbo.Groups_Sub.subname, dbo.Groups_Sub.flag, dbo.Groups.groupid, dbo.Groups_Sub.En_Sub_Name, dbo.Groups_Sub.Short_Sub_Code, 
                  dbo.Groups_Sub.ShowINCashier
FROM     dbo.Groups_Sub INNER JOIN
                  dbo.Groups ON dbo.Groups_Sub.groupid = dbo.Groups.groupid

GO


