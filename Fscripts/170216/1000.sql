
INSERT INTO dbo.AAA_Last_Update
        ( LastUpdate, LastVer, FalconV )
VALUES  ( GETDATE(), -- LastUpdate - nvarchar(50)
          170216, -- LastVer - int
          170215  -- FalconV - int
          )