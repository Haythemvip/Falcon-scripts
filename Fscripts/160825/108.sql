
UPDATE  dbo.CostProjects
SET     Destination = El_Koyod_El_Yawmia.Destination ,
        Acccode2 = El_Koyod_El_Yawmia.Acccode2 ,
        AccName2 = El_Koyod_El_Yawmia.AccName2 ,
        OstazName = OstazCode.OstazName
FROM    dbo.El_Koyod_El_Yawmia
        INNER JOIN dbo.CostProjects ON CostProjects.KedID = El_Koyod_El_Yawmia.ID
        INNER JOIN dbo.OstazCode ON OstazCode.OstazID = El_Koyod_El_Yawmia.OstazID