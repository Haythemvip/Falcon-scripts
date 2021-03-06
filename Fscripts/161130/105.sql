 

CREATE  PROCEDURE [dbo].[Select_Final_Ratio]
    @FinalMenuID INT ,
    @Selected BIT = 0
AS
    BEGIN
 
        SELECT  Final_Ratio_Setting.FinalMenuID ,
                Final_Ratio_Setting.Aaccount_GroupID ,
                Final_Ratio_Setting.MethodID ,
                Final_Ratio_Setting.MethodTitele ,
                Account_Group.AccountGroup_Name ,
                Acc_Type_tree.Type_Name ,
                FinalBalanceTypes.ClassificationName ,
                Switch_to_positive ,
                Final_Ratio_Setting.ID ,
                @Selected AS Selected
        FROM    Final_Ratio_Setting
                INNER JOIN Account_Group ON Final_Ratio_Setting.Aaccount_GroupID = Account_Group.AccountGroup_ID
                INNER JOIN Acc_Type_tree ON Account_Group.ACC_Type_ID = Acc_Type_tree.ACC_Type_ID
                INNER JOIN FinalBalanceTypes ON Account_Group.ClassificationId = FinalBalanceTypes.ClassificationId
        WHERE   FinalMenuID = @FinalMenuID;
				 

    END;
