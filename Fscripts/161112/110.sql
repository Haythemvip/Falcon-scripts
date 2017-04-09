

INSERT INTO  dbo.Systems_Menu
        ( MenuID ,
          SystemCode ,
          SupSysCode ,
          SystemMenuName ,
          ESystemMenuName ,
          MenuTag ,
          MenU_URL ,
          SSave ,
          SEdit ,
          SDelte ,
          SPrint ,
          SView ,
          AreaName ,
          SupervisorID
        )
VALUES  ( 1018 , -- MenuID - int
         1 , -- SystemCode - int
          82 , -- SupSysCode - int
          N'œ›⁄«  »œ· «·”ﬂ‰' , -- SystemMenuName - nvarchar(50)
          N'œ›⁄«  »œ· «·”ﬂ‰' , -- ESystemMenuName - nvarchar(50)
          N'624' , -- MenuTag - nvarchar(50)
          N'#' , -- MenU_URL - nvarchar(max)
          0 , -- SSave - bit
          0 , -- SEdit - bit
          0 , -- SDelte - bit
          0 , -- SPrint - bit
          0 , -- SView - bit
          N'Null' , -- AreaName - nvarchar(20)
          0  -- SupervisorID - int
        )