 

CREATE VIEW [dbo].[V_AccTree1]
AS
SELECT        ID AS ID1, AccCode AS F1, AccName AS N1, ParentID, ISmain, AccName_En AS NE1
FROM            dbo.tblAccTree
WHERE        (ISmain = 1) AND (ParentID = 0)

GO

 

