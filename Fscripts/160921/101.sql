 
CREATE PROCEDURE [dbo].[Amr_Shra_Costs_Select]
    @fromdate DATE ,
    @todate DATE ,
    @CostId BIGINT ,
    @ParentID BIGINT ,
    @ItemNO_IN_Tender NVARCHAR(50) ,
    @projectID BIGINT
AS
    SELECT  *
    FROM    View_Amr_Shra_Costs
    WHERE   performa_date BETWEEN @fromdate AND @todate
            AND ( @CostId = 0
                  OR CostID = @CostId
                )
            AND ( @ParentID = 0
                  OR ParentID = @ParentID
                )
            AND ( @ItemNO_IN_Tender = 0
                  OR ItemNO_IN_Tender = @ItemNO_IN_Tender
                )
            AND ( @projectID = 0
                  OR ProjectID = @projectID
                )
    ORDER BY View_Amr_Shra_Costs.performa_id

