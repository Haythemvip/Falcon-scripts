
CREATE PROCEDURE SelectFinalMenu_Groups
    @MezaniaID INT ,
    @GroupId INT ,
    @FinalMenuID INT
AS
    BEGIN
 
        SELECT  FinalBalanceForms.MezaniaID ,
                FinalBalanceForms.GroupId ,
                FinalBalanceForms.FinalMenuID ,
                FinalBalanceForms.Aaccount_GroupID ,
                FinalBalanceForms.MethodID ,
                FinalBalanceForms.MethodTitele ,
                Account_Group.AccountGroup_Name ,
                Acc_Type_tree.Type_Name ,
                FinalBalanceTypes.ClassificationName ,
                FinalbalanceGroup.GroupName
        FROM    FinalBalanceForms
                INNER JOIN Account_Group ON FinalBalanceForms.Aaccount_GroupID = Account_Group.AccountGroup_ID
                INNER JOIN Acc_Type_tree ON Account_Group.ACC_Type_ID = Acc_Type_tree.ACC_Type_ID
                INNER JOIN FinalBalanceTypes ON Account_Group.ClassificationId = FinalBalanceTypes.ClassificationId
                INNER JOIN FinalbalanceGroup ON FinalBalanceForms.GroupId = FinalbalanceGroup.GroupId 

				WHERE MezaniaID = @MezaniaID AND FinalBalanceForms.GroupId = @GroupId AND FinalMenuID = @FinalMenuID
				 

    END;
GO
