

ALTER  PROCEDURE [dbo].[Select_Final_Ratio]
    @FinalMenuID INT ,
    @Selected BIT = 0 ,
    @Year INT  
AS
    BEGIN
 
        SELECT  Final_Ratio_Setting.FinalMenuID ,
                AccCode ,
                Final_Ratio_Setting.MethodID ,
                Final_Ratio_Setting.MethodTitele ,
                AccName ,
                N2 ,
                N1 ,
                Switch_to_positive ,
                Final_Ratio_Setting.ID ,
                @Selected AS Selected ,
                CASE WHEN Switch_to_positive = 1 THEN ( ISNULL(( SELECT   SUM(Maden)
                           FROM     dbo.El_Koyod_El_Yawmia
                           WHERE    El_Koyod_El_Yawmia.AccID = View_tblAccTree.AccCode
                                    AND year = @Year
                         ), 0)
                  - ISNULL(( SELECT SUM(Daen)
                             FROM   dbo.El_Koyod_El_Yawmia
                             WHERE  El_Koyod_El_Yawmia.AccID = View_tblAccTree.AccCode
                                    AND year = @Year
                           ), 0) ) * -1 ELSE ( ISNULL(( SELECT   SUM(Maden)
                           FROM     dbo.El_Koyod_El_Yawmia
                           WHERE    El_Koyod_El_Yawmia.AccID = View_tblAccTree.AccCode
                                    AND year = @Year
                         ), 0)
                  - ISNULL(( SELECT SUM(Daen)
                             FROM   dbo.El_Koyod_El_Yawmia
                             WHERE  El_Koyod_El_Yawmia.AccID = View_tblAccTree.AccCode
                                    AND year = @Year
                           ), 0) ) end  AS Balance
        FROM    Final_Ratio_Setting
                INNER JOIN View_tblAccTree ON Final_Ratio_Setting.Aaccount_GroupID = dbo.View_tblAccTree.AccCode
        WHERE   FinalMenuID = @FinalMenuID
                AND ISmain = 0; 

    END;
