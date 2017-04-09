 
CREATE PROCEDURE PO_CostItemBudget_SP
	 
	 @CostID bigint 
AS
BEGIN
	
	 
	  CREATE TABLE #Budget
        (
          GroupID FLOAT NULL ,
          SupID FLOAT NULL ,
          CostID FLOAT NULL,
		  Budget float null ,
		  DateAddn date ,
		  UserAdd   nvarchar(150),
		  year nvarchar(10), 
		  groupname nvarchar(150),

		  subname nvarchar(150),
 AccName nvarchar(150),
 Short_Sub_Code nvarchar(150),
 Short_Code nvarchar(150),
 spending float,
  Diff float 
        )


    INSERT  INTO #Budget
            (  GroupID  ,
          SupID  ,
          CostID ,
		  Budget  ,
		  DateAddn  ,
		  UserAdd  ,
		  year , 
		  groupname ,

		  subname ,
 AccName ,
 Short_Sub_Code ,
 Short_Code ,
 spending ,
  Diff   )
   SELECT        dbo.CostItemsBudget.GroupID, dbo.CostItemsBudget.SupID, dbo.CostItemsBudget.CostID, dbo.CostItemsBudget.Budget, dbo.CostItemsBudget.DateAdd, dbo.CostItemsBudget.UserAdd, 
                         dbo.CostItemsBudget.year, dbo.Groups.groupname, dbo.Groups_Sub.subname, dbo.TblCostTree.AccName, dbo.Groups_Sub.Short_Sub_Code, dbo.Groups.Short_Code

						 ,0,0
FROM            dbo.CostItemsBudget LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.CostItemsBudget.CostID = dbo.TblCostTree.AccCode LEFT OUTER JOIN
                         dbo.Groups ON dbo.CostItemsBudget.GroupID = dbo.Groups.groupid LEFT OUTER JOIN
                         dbo.Groups_Sub ON dbo.CostItemsBudget.SupID = dbo.Groups_Sub.subid
 


  UPDATE  #Budget
    SET     spending = ISNULL(( SELECT SUM(Amr_Sheraa_Item.ItemNet) AS Expr1
                                     FROM   Amr_Sheraa_Item
                                            INNER JOIN Amr_Sheraa ON Amr_Sheraa_Item.performa_id = Amr_Sheraa.performa_id
                                     WHERE  ( Amr_Sheraa_Item.SupID = SupID )
                                            AND ( Amr_Sheraa.ProjectID = @CostID )
                                   ), 0)

    UPDATE  #Budget
    SET     Diff = Budget - spending - Budget


	select * from #Budget

END
GO
