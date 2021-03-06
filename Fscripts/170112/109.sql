 
ALTER PROCEDURE [dbo].[Amr_Shra_Costs_Select]
    @fromdate DATE ,
    @todate DATE ,
    @CostId AS dbo.MyCostParam READONLY ,
    
    @ItemNO_IN_Tender NVARCHAR(50) ,
    @projectID BIGINT ,
    @ListItems AS dbo.MyItemtParam READONLY ,
    @UserID INT ,
    @ProunchID INT ,
    @DepartID INT ,
    @VendorID BIGINT
AS
    SELECT  *
    FROM    View_Amr_Shra_Costs
    WHERE   performa_date BETWEEN @fromdate AND @todate
            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                    FROM    @CostId
                  ) = 0
                  OR CostID IN ( SELECT *
                                 FROM   @CostId )
                )
            
            AND ( @ItemNO_IN_Tender = 0
                  OR ItemNO_IN_Tender = @ItemNO_IN_Tender
                )
            AND ( @projectID = 0
                  OR ProjectID = @projectID
                )
            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                    FROM    @ListItems
                  ) = 0
                  OR ItemCode IN ( SELECT   *
                                   FROM     @ListItems )
                )
            AND ( @UserID = 0
                  OR Emp_Code = @UserID
                )
            AND ( @ProunchID = 0
                  OR ProunchID = @ProunchID
                )
            AND ( @DepartID = 0
                  OR DepartID = @DepartID
                )

  AND ( @VendorID = 0
                  OR Customer_id = @VendorID
                )


    ORDER BY View_Amr_Shra_Costs.performa_id;

