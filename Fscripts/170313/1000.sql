
INSERT INTO dbo.AAA_Last_Update
        ( LastUpdate, LastVer, FalconV )
VALUES  ( GETDATE(), -- LastUpdate - nvarchar(50)
          170313, -- LastVer - int
          170308  -- FalconV - int
          )