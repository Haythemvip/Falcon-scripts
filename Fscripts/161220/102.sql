
ALTER TABLE dbo.Letter_of_Guarantee_Used ADD KaidID BIGINT , Journal BIGINT , OstazID INT ,CostID BIGINT ,CurrnceID INT , ActionDate DATE DEFAULT GETDATE();

ALTER TABLE dbo.Documentary_of_Guarantee_Used  ADD KaidID BIGINT , Journal BIGINT , OstazID INT ,CostID BIGINT ,CurrnceID INT , ActionDate DATE DEFAULT GETDATE();



ALTER TABLE dbo.Letter_of_Extend  ADD KaidID BIGINT , Journal BIGINT , OstazID INT ,CostID BIGINT ,CurrnceID INT , ActionDate DATE DEFAULT GETDATE();



ALTER TABLE dbo.Documentary_of_Extend   ADD KaidID BIGINT , Journal BIGINT , OstazID INT ,CostID BIGINT ,CurrnceID INT , ActionDate DATE DEFAULT GETDATE();




ALTER TABLE dbo.Letter_ChangeValue ADD KaidID BIGINT , Journal BIGINT , OstazID INT ,CostID BIGINT ,CurrnceID INT , ActionDate DATE DEFAULT GETDATE();

ALTER TABLE dbo.Documentary_ChangeValue ADD KaidID BIGINT , Journal BIGINT , OstazID INT ,CostID BIGINT ,CurrnceID INT , ActionDate DATE DEFAULT GETDATE();















