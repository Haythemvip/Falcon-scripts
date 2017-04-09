
EXEC sp_executesql N'UPDATE Falcon_Sitting SET  FLC = Convert(varbinary(MAX), @FLC) ',
    N'@FLC nvarchar(168)',
    @FLC = N'Data Source= 184.168.194.62;Initial Catalog= haythemvip_TSupportDb ;Persist Security Info=True;User ID= TSupportDbsa ;Password= F@lcon@ss@123;Connection Timeout=50000 ;'
 