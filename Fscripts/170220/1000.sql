
INSERT INTO dbo.AAA_Last_Update
        ( LastUpdate, LastVer, FalconV )
VALUES  ( GETDATE(), -- LastUpdate - nvarchar(50)
          170220, -- LastVer - int
          170218  -- FalconV - int
          )