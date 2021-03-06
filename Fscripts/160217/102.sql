 

ALTER PROCEDURE [dbo].[Get_ItemContint]
    @DefualtItem_ID INT ,
    @Storeid INT ,
    @ActionDate DATE ,
    @year INTEGER ,
    @Lang NVARCHAR(2)
AS
    IF @Lang = 'AR'
        BEGIN
	

            SELECT  dbo.ItemContent.itemid ,
                    dbo.ItemContent.Q ,
                    dbo.ItemContent.unit ,
                    dbo.Items.Item_Name ,
                    dbo.ItemContent.unitCode ,
                    ( dbo.get_item_average(@Storeid, dbo.ItemContent.itemid,
                                           @ActionDate)
                      * ( CASE WHEN ( ItemContent.unitCode = Items.Item_Unit_Id )
                               THEN ( dbo.ItemContent.Q )
                               WHEN ( ItemContent.unitCode = dbo.Items.Item_unit2
                                      AND ISNULL(EqulUnit, 0) > 0
                                    ) THEN ( dbo.ItemContent.Q / EqulUnit )
                               WHEN ( ItemContent.unitCode = dbo.Items.Item_unit3
                                      AND ISNULL(EqulUnit2, 0) > 0
                                    ) THEN ( dbo.ItemContent.Q / EqulUnit2 )
                               ELSE ( dbo.ItemContent.Q )
                          END ) ) AS TotalPrice
            FROM    dbo.Items
                    INNER JOIN dbo.ItemContent ON dbo.Items.Item_Id = dbo.ItemContent.itemid
            WHERE   DefaulID = @DefualtItem_ID







        END

	
    IF @Lang = 'EN'
        BEGIN
	

            SELECT  dbo.ItemContent.itemid ,
                    dbo.ItemContent.Q ,
                    dbo.ItemContent.unit ,
                    dbo.Items.Item_Name_AR AS Item_Name ,
                    dbo.ItemContent.unitCode ,
                    ( dbo.get_item_average(@Storeid, dbo.ItemContent.itemid,
                                           @ActionDate)
                      * ( CASE WHEN ( ItemContent.unitCode = Items.Item_Unit_Id )
                               THEN ( dbo.ItemContent.Q )
                               WHEN ( ItemContent.unitCode = dbo.Items.Item_unit2
                                      AND ISNULL(EqulUnit, 0) > 0
                                    ) THEN ( dbo.ItemContent.Q / EqulUnit )
                               WHEN ( ItemContent.unitCode = dbo.Items.Item_unit3
                                      AND ISNULL(EqulUnit2, 0) > 0
                                    ) THEN ( dbo.ItemContent.Q / EqulUnit2 )
                               ELSE ( dbo.ItemContent.Q )
                          END ) ) AS TotalPrice
            FROM    dbo.Items
                    INNER JOIN dbo.ItemContent ON dbo.Items.Item_Id = dbo.ItemContent.itemid
            WHERE   DefaulID = @DefualtItem_ID







        END
