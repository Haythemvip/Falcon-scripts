


ALTER PROCEDURE  [dbo].[Items_Update]



        @Item_Id bigint
      , @itm_code2 varchar(50)
      , @Barcode varchar(50)
      , @itm_ismedicine int
      , @Item_Unit_Id int
      , @Item_unit2 int
      , @Item_unit3 int
      , @EqulUnit  DECIMAL (18,2)
      , @EqulUnit2  DECIMAL (18,2)
      , @UnitEqualed varchar(50)
      , @Item_Gro_Id int
      , @Item_Gro_Sub_Id int
      , @TradeTypeID int
      , @Item_Name varchar(225)
      , @Item_Name_AR varchar(225)
      , @itm_request_limit int
      , @MaxQ  DECIMAL (18,2)
      , @MINQ  DECIMAL (18,2)
      , @price float
      , @gomla float
      , @FixPrice bit
      , @Tax  DECIMAL (18,2)
      , @HameshRebh  DECIMAL (18,2)
      , @aNotes text
      , @actiondate date
      , @UserName varchar(50)
      , @flag bit
       
      , @ProunchID int
      , @COMP_ID int
      , @PriceFexed bit
      , @priceCome float
      , @hgomla float
      , @hmonaksat float
      , @pricemonaksat float
      , @hbig float
      , @pricbig float
      , @hmedum float
      , @pricemedum float
      , @hlow float
      , @pricelow float
      , @PartNo varchar(50)
      , @DescountPercent float
      , @PonasPercent float
      , @com_id decimal(18,2)
      , @itm_com_code varchar(20)
      , @itm_has_expire int
      , @itm_active char(1)
      , @itm_freez int
      , @itm_scientific_n1 nvarchar(200)
      , @itm_scientific_n2 nvarchar(200)
      , @itm_scientific_group_id decimal(18,2)
      , @itm_usage_manner_id decimal(18,2)
     
      , @itm_itf_id decimal(18,2)
      , @itm_stop_sell int
      , @itm_stop_pur int
      , @itm_print_barcode int
      , @itm_allow_discount int
      , @itm_max_disc_per float
      , @itm_max_disc_val float
      , @itm_print_name int
      , @itm_sales_avreage_period int
      , @itm_srvc int
      , @itm_origin int
      , @itm_isShortage int
      , @itm_favourite int
      , @itm_location decimal(18,2)
      , @itm_default_limit decimal(18,2)
      , @itm_purchase_unit decimal(18,2)
      , @itm_sell_unit decimal(18,2)
      , @itm_max_disc_value_NotUsed money
      , @StorePlace nvarchar(max)
      , @Waigt decimal(18,2)
      , @ChargDesc decimal(18,2)
      , @GomrokDesc decimal(18,2)
      , @GomrakFinshDesc decimal(18,2)
      , @OtherDesc decimal(18,2)
      , @OntherNameDesc nvarchar(50)
      , @Shehada decimal(18,2)
      , @OtherShehada decimal(18,2)
      , @Boxcost decimal(18,2)
      , @Tabkher decimal(18,2)
      , @InernalCharg decimal(18,2)
      , @Purchase decimal(18,2)
	  ,@Width FLOAT , @highet FLOAT 
     


	  AS


Update [dbo].[Items] set
           
            [itm_code2]                             =@itm_code2  
           ,[Barcode]								=@Barcode  
           ,[itm_ismedicine]						=@itm_ismedicine  
           ,[Item_Unit_Id]							=@Item_Unit_Id 
           ,[Item_unit2]							=@Item_unit2  
           ,[Item_unit3]							=@Item_unit3 
           ,[EqulUnit]								=@EqulUnit  
           ,[EqulUnit2]								=@EqulUnit2  
           ,[UnitEqualed]							=@UnitEqualed  
           ,[Item_Gro_Id]							=@Item_Gro_Id  
           ,[Item_Gro_Sub_Id]						=@Item_Gro_Sub_Id  
           ,[TradeTypeID]							=@TradeTypeID  
           ,[Item_Name]								=@Item_Name  
           ,[Item_Name_AR]							=@Item_Name_AR  
           ,[itm_request_limit]						=@itm_request_limit  
           ,[MaxQ]									=@MaxQ  
           ,[MINQ]									=@MINQ  
           ,[price]									=@price  
           ,[gomla]									=@gomla  
           ,[FixPrice]								=@FixPrice  
           ,[Tax]									=@Tax  
           ,[HameshRebh]							=@HameshRebh  
           ,[aNotes]								=@aNotes  
           ,[actiondate]							=@actiondate  
           ,[UserName]								=@UserName  
           ,[flag]									=@flag  
           										 
           ,[ProunchID]								=@ProunchID  
           ,[COMP_ID]								=@COMP_ID  
           ,[PriceFexed]							=@PriceFexed  
           ,[priceCome]								=@priceCome  
           ,[hgomla]								=@hgomla  
           ,[hmonaksat]								=@hmonaksat 
           ,[pricemonaksat]							=@pricemonaksat 
           ,[hbig]									=@hbig 
           ,[pricbig]								=@pricbig 
           ,[hmedum]								=@hmedum 
           ,[pricemedum]							=@pricemedum 
           ,[hlow]									=@hlow 
           ,[pricelow]								=@pricelow 
           ,[PartNo]								=@PartNo  
           ,[DescountPercent]						=@DescountPercent 
           ,[PonasPercent]							=@PonasPercent 
           ,[com_id]								=@com_id  
           ,[itm_com_code]							=@itm_com_code  
           ,[itm_has_expire]						=@itm_has_expire  
           ,[itm_active]							=@itm_active  
           ,[itm_freez]								=@itm_freez  
           ,[itm_scientific_n1]						=@itm_scientific_n1 
           ,[itm_scientific_n2]						=@itm_scientific_n2  
           ,[itm_scientific_group_id]				=@itm_scientific_group_id  
           ,[itm_usage_manner_id]					=@itm_usage_manner_id  
          
           ,[itm_itf_id]							=@itm_itf_id  
           ,[itm_stop_sell]							=@itm_stop_sell  
           ,[itm_stop_pur]							=@itm_stop_pur  
           ,[itm_print_barcode]						=@itm_print_barcode  
           ,[itm_allow_discount]					=@itm_allow_discount  
           ,[itm_max_disc_per]						=@itm_max_disc_per 
           ,[itm_max_disc_val]						=@itm_max_disc_val 
           ,[itm_print_name]						=@itm_print_name  
           ,[itm_sales_avreage_period]				=@itm_sales_avreage_period  
           ,[itm_srvc]								=@itm_srvc  
           ,[itm_origin]							=@itm_origin  
           ,[itm_isShortage]						=@itm_isShortage  
           ,[itm_favourite]							=@itm_favourite  
           ,[itm_location]							=@itm_location  
           ,[itm_default_limit]						=@itm_default_limit  
           ,[itm_purchase_unit]						=@itm_purchase_unit  
           ,[itm_sell_unit]							=@itm_sell_unit  
           ,[itm_max_disc_value_NotUsed]			=@itm_max_disc_value_NotUsed 
           ,[StorePlace]							=@StorePlace  
           ,[Waigt]									=@Waigt  
           ,[ChargDesc]								=@ChargDesc  
           ,[GomrokDesc]							=@GomrokDesc  
           ,[GomrakFinshDesc]						=@GomrakFinshDesc  
           ,[OtherDesc]								=@OtherDesc  
           ,[OntherNameDesc]						=@OntherNameDesc   
           ,[Shehada]								=@Shehada  
           ,[OtherShehada]							=@OtherShehada  
           ,[Boxcost]								=@Boxcost  
           ,[Tabkher]								=@Tabkher  
           ,[InernalCharg]							=@InernalCharg  
           ,[Purchase]								=@Purchase  
		   ,[width]                                 =@Width
           ,[highet]                                 =@highet
          where [Item_Id] = @Item_Id 

       
       
       