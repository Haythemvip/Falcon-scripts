 

ALTER VIEW [dbo].[View_Tender_Tech]
AS
SELECT        dbo.Tenders_Add.ID AS TendeID, dbo.Tenders_Add.TheName, dbo.Tender_Tech.MonaksaID, dbo.Tender_Monaksat_Type.TheName AS Monaksat_Type, dbo.Tender_Tech.TenderTypeID, 
                         dbo.Tenders_Type.TheName AS Tenders_Type, dbo.Tender_Tech.WorkSesionID, dbo.Tender_Word_Secsion.TheName AS Tender_Word_Secsion, dbo.Tender_Tech.CuntryID, dbo.Country.CountryName, 
                         dbo.Tender_Tech.CityID, dbo.City.CityName, dbo.Tender_Tech.DateTech, dbo.Tender_Tech.DateMaly, dbo.Tender_Tech.TenderValue, dbo.Tender_Tech.TenderTime, dbo.Tender_Tech.UserAdd, 
                         dbo.Tender_Tech.DateAdd, dbo.Tender_Tech.TenderClassID, dbo.Tenders_Classes.TheName AS Tenders_Classes, dbo.Tender_Tech.TenderOtherCoID, 
                         dbo.Tenders_other_Company.TheName AS Tenders_other_Company, dbo.Tender_Tech.TenderStateID, dbo.Tenders_State.TheName AS Tenders_State, dbo.Tender_Tech.TenderValueMony, 
                         dbo.Tenders_Add.DateArrive, dbo.Tender_Tech.TendervalueTime, dbo.Tenders_Add.ConsaltName, dbo.Tenders_Add.Founder, dbo.Tenders_Add.GM, dbo.Tenders_Consalts.TheName AS Tenders_Consalts, 
                         dbo.Tender_Tech.OwnerID, dbo.TendersOwnersAdd.TheName AS customer_name, dbo.Tenders_Consalts.Mail, dbo.Tenders_Consalts.Adress, dbo.Tenders_Consalts.Phone, 
                         dbo.Tender_Tech.Tenders_ConsaltsID, dbo.Tender_Tech.StartDate, dbo.Tender_Tech.OpiningCollected
FROM            dbo.Tender_Tech LEFT OUTER JOIN
                         dbo.TendersOwnersAdd ON dbo.Tender_Tech.OwnerID = dbo.TendersOwnersAdd.ID LEFT OUTER JOIN
                         dbo.Tenders_Consalts ON dbo.Tender_Tech.Tenders_ConsaltsID = dbo.Tenders_Consalts.ID RIGHT OUTER JOIN
                         dbo.Tenders_Add ON dbo.Tender_Tech.TendeID = dbo.Tenders_Add.ID LEFT OUTER JOIN
                         dbo.Tender_Word_Secsion ON dbo.Tender_Tech.WorkSesionID = dbo.Tender_Word_Secsion.ID LEFT OUTER JOIN
                         dbo.Tender_Monaksat_Type ON dbo.Tender_Tech.MonaksaID = dbo.Tender_Monaksat_Type.ID LEFT OUTER JOIN
                         dbo.Tenders_Type ON dbo.Tender_Tech.TenderTypeID = dbo.Tenders_Type.ID LEFT OUTER JOIN
                         dbo.Tenders_State ON dbo.Tender_Tech.TenderStateID = dbo.Tenders_State.ID LEFT OUTER JOIN
                         dbo.Tenders_other_Company ON dbo.Tender_Tech.TenderOtherCoID = dbo.Tenders_other_Company.ID LEFT OUTER JOIN
                         dbo.City ON dbo.Tender_Tech.CityID = dbo.City.CityID LEFT OUTER JOIN
                         dbo.Tenders_Classes ON dbo.Tender_Tech.TenderClassID = dbo.Tenders_Classes.ID LEFT OUTER JOIN
                         dbo.Country ON dbo.Tender_Tech.CuntryID = dbo.Country.CountryID

GO


