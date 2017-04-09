
ALTER PROCEDURE [dbo].[POQ_Items_Add]
    @TenderID BIGINT ,
    @Tender_BasicID INT ,
    @tender_workID INT ,
    @Srial INT ,
    @Tender_Item_No NVARCHAR(50) ,
    @Details NVARCHAR(MAX) ,
    @UnitName NVARCHAR(50) ,
    @Quantity DECIMAL(18, 2) ,
    @Price DECIMAL(18, 2) ,
    @Total DECIMAL(18, 2) ,
    @Tahmilat_Perc DECIMAL(18, 2) ,
    @Price2 DECIMAL(18, 2) ,
    @Totalprice2 DECIMAL(18, 2) ,
    @FormID BIGINT ,
    @GroupID BIGINT ,
    @Tender_ContentID BIGINT ,
    @Notes NVARCHAR(350) ,
    @HandPrice FLOAT
AS
    INSERT  INTO [dbo].[POQ_Items]
            ( [TenderID] ,
              [Tender_BasicID] ,
              [tender_workID] ,
              [Srial] ,
              [Tender_Item_No] ,
              [Details] ,
              [UnitName] ,
              [Quantity] ,
              [Price] ,
              [Total] ,
              [Tahmilat_Perc] ,
              [Price2] ,
              [Totalprice2] ,
              [FormID] ,
              [GroupID] ,
              [Tender_ContentID] ,
              [Notes] ,
              [HandPrice]
            )
    VALUES  ( @TenderID ,
              @Tender_BasicID ,
              @tender_workID ,
              @Srial ,
              @Tender_Item_No ,
              @Details ,
              @UnitName ,
              @Quantity ,
              @Price ,
              @Total ,
              @Tahmilat_Perc ,
              @Price2 ,
              @Totalprice2 ,
              @FormID ,
              @GroupID ,
              @Tender_ContentID ,
              @Notes ,
              @HandPrice
		    )  
