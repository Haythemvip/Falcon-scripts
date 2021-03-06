
 

ALTER PROCEDURE [dbo].[SelectFinalMenu_Groups]
    @MezaniaID INT ,
    @GroupId INT ,
    @FinalMenuID INT,
	@Selected bit = 0,
    @Year INT  

AS
    BEGIN
 

   SELECT  FinalBalanceForms.FinalMenuID ,
                AccCode ,
                FinalBalanceForms.MethodID ,
                FinalBalanceForms.MethodTitele ,
                AccName ,
                N2 ,
                N1 ,
                Switch_to_positive ,
                FinalBalanceForms.ID ,
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
        FROM    FinalBalanceForms
                INNER JOIN View_tblAccTree ON FinalBalanceForms.Aaccount_GroupID = dbo.View_tblAccTree.AccCode
        WHERE   FinalMenuID = @FinalMenuID
                AND ISmain = 0

				AND  MezaniaID = @MezaniaID AND FinalBalanceForms.GroupId = @GroupId 




    --    SELECT  FinalBalanceForms.MezaniaID ,
    --            FinalBalanceForms.GroupId ,
    --            FinalBalanceForms.FinalMenuID ,
    --            FinalBalanceForms.Aaccount_GroupID ,
    --            FinalBalanceForms.MethodID ,
    --            FinalBalanceForms.MethodTitele ,
    --            Account_Group.AccountGroup_Name ,
    --            Acc_Type_tree.Type_Name ,
    --            FinalBalanceTypes.ClassificationName ,
    --            FinalbalanceGroup.GroupName,
				--Switch_to_positive,
				--FinalBalanceForms.ID, @Selected AS Selected
    --    FROM    FinalBalanceForms
    --            INNER JOIN Account_Group ON FinalBalanceForms.Aaccount_GroupID = Account_Group.AccountGroup_ID
    --            INNER JOIN Acc_Type_tree ON Account_Group.ACC_Type_ID = Acc_Type_tree.ACC_Type_ID
    --            INNER JOIN FinalBalanceTypes ON Account_Group.ClassificationId = FinalBalanceTypes.ClassificationId
    --            INNER JOIN FinalbalanceGroup ON FinalBalanceForms.GroupId = FinalbalanceGroup.GroupId 

				--WHERE MezaniaID = @MezaniaID AND FinalBalanceForms.GroupId = @GroupId AND FinalMenuID = @FinalMenuID
				 

    END;
