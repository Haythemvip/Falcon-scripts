 
ALTER VIEW [dbo].[VStoreSecurity]
AS
SELECT dbo.StoreSecurity.BoxID, dbo.StoreSecurity.UserID, dbo.Users.UserName, dbo.Stores.store_name, dbo.Stores.flag, dbo.Stores.store_id, dbo.Stores.store_address
FROM     dbo.StoreSecurity INNER JOIN
                  dbo.Users ON dbo.StoreSecurity.UserID = dbo.Users.UserID INNER JOIN
                  dbo.Stores ON dbo.StoreSecurity.BoxID = dbo.Stores.store_id

GO


