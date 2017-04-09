

ALTER VIEW [dbo].[V_POQ_Items]
AS
SELECT dbo.POQ_Items.TenderID, dbo.POQ_Items.Tender_BasicID, dbo.POQ_Items.tender_workID, dbo.POQ_Items.Srial, dbo.POQ_Items.Tender_Item_No, dbo.POQ_Items.Details, dbo.POQ_Items.UnitName, 
                  dbo.POQ_Items.Quantity, dbo.POQ_Items.Price, dbo.POQ_Items.Total, dbo.POQ_Items.Tahmilat_Perc, dbo.POQ_Items.Price2, dbo.POQ_Items.Totalprice2, dbo.POQ_Items.FormID, dbo.POQ_Items.GroupID, 
                  dbo.POQ_Items.Tender_ContentID, dbo.POQ_Items.Notes, dbo.Tender_Forms.TenderFormName, dbo.Tendr_Basic_Work.Tender_Basic_Work, dbo.Tender_Work.Tender_Work_Name, dbo.Tender_Groups.TheName, 
                  dbo.Tender_Content.Tender_Content, dbo.POQ_Items.HandPrice, dbo.POQ_Items.LokedUser, dbo.POQ_Items.LokedDate, dbo.POQ_Items.Loked
FROM     dbo.Tendr_Basic_Work INNER JOIN
                  dbo.POQ_Items INNER JOIN
                  dbo.Tender_Forms ON dbo.POQ_Items.FormID = dbo.Tender_Forms.ID_Form ON dbo.Tendr_Basic_Work.ID = dbo.POQ_Items.Tender_BasicID INNER JOIN
                  dbo.Tender_Work ON dbo.POQ_Items.tender_workID = dbo.Tender_Work.ID INNER JOIN
                  dbo.Tender_Groups ON dbo.POQ_Items.GroupID = dbo.Tender_Groups.ID INNER JOIN
                  dbo.Tender_Content ON dbo.POQ_Items.Tender_ContentID = dbo.Tender_Content.Tender_Content_Srial

GO


