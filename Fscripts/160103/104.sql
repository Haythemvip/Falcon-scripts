
ALTER PROCEDURE [dbo].[_CopyOLD]
AS
    BEGIN
	

	-- دليل الحسابات

        INSERT  INTO dbo.tblAccTree
                ( AccCode ,
                  AccName ,
                  ParentID ,
                  AccType ,
                  AccLevel ,
                  ISmain ,
                  MezanyaID ,
                  ACC_Type_ID ,
                  LongCode ,
                  AccName_En ,
                  AccountGroup_ID ,
                  ClassificationId ,
                  SortID
                )
                SELECT  AccCode ,
                        AccName ,
                        ParentID ,
                        AccType ,
                        AccLevel ,
                        ISmain ,
                        MezanyaID ,
                        ACC_Type_ID ,
                        LongCode ,
                        AccName_En ,
                        AccountGroup_ID ,
                        ClassificationId ,
                        SortID
                FROM    FALCON.dbo.tblAccTree 




        INSERT  INTO dbo.TblAccTreeAZ
                ( ID ,
                  AccCode ,
                  AccName ,
                  SortID ,
                  ISmain ,
                  AccName_En
                )
                SELECT  ID ,
                        AccCode ,
                        AccName ,
                        SortID ,
                        ISmain ,
                        AccName_En
                FROM    FALCON.dbo.TblAccTreeAZ



				-- ماكينات الحضور والانصراف
        INSERT  INTO dbo.t_Clock_List
                ( N_ClockIdx ,
                  S_ClockName ,
                  N_Enabled ,
                  S_IP ,
                  N_Port ,
                  MFunction
                )
                SELECT  N_ClockIdx ,
                        S_ClockName ,
                        N_Enabled ,
                        S_IP ,
                        N_Port ,
                        MFunction
                FROM    FALCON.dbo.t_Clock_List





        INSERT  INTO dbo.EmpTamen
                ( ID ,
                  EmpFix ,
                  EmpChanged ,
                  ComFix ,
                  ComChanged ,
                  Badal_Sakan
		        )
                SELECT  ID ,
                        EmpFix ,
                        EmpChanged ,
                        ComFix ,
                        ComChanged ,
                        Badal_Sakan
                FROM    FALCON.dbo.EmpTamen




        INSERT  INTO dbo.Company_name
                ( COM_ID ,
                  COM_name ,
                  flag
                )
                SELECT  COM_ID ,
                        COM_name ,
                        flag
                FROM    FALCON.dbo.Company_name



        INSERT  INTO dbo.Prunshes
                ( PRUN_ID ,
                  Purnsh_name ,
                  COM_ID ,
                  flag ,
                  BranchCode ,
                  Description ,
                  IATACode ,
                  GalileoCode ,
                  AMADUESCode ,
                  Address ,
                  Telephone ,
                  Fax ,
                  ManagerID ,
                  AllowSMS ,
                  SMSPrice ,
                  SearchesCount ,
                  SearchPeriod ,
                  Discount ,
                  Markup
                )
                SELECT  PRUN_ID ,
                        Purnsh_name ,
                        COM_ID ,
                        flag ,
                        BranchCode ,
                        Description ,
                        IATACode ,
                        GalileoCode ,
                        AMADUESCode ,
                        Address ,
                        Telephone ,
                        Fax ,
                        ManagerID ,
                        AllowSMS ,
                        SMSPrice ,
                        SearchesCount ,
                        SearchPeriod ,
                        Discount ,
                        Markup
                FROM    FALCON.dbo.Prunshes



        INSERT  INTO dbo.Users
                ( UserID ,
                  UserName ,
                  Password ,
                  UserSkin ,
                  UserColore ,
                  GridColor ,
                  ProunchID ,
                  COMP_ID ,
                  Mnue ,
                  IsAdmin ,
                  IsSupervisor ,
                  IsUser ,
                  ShowPrice ,
                  Journal ,
                  CD_PortName ,
                  CD_Parity ,
                  CD_Baudrate ,
                  CD_StopBits ,
                  CD_DataBits ,
                  UseItemWithowyutBalence ,
                  RebateItems ,
                  Show_Item_Palance ,
                  zeropic ,
                  stopmessages ,
                  IsOnline ,
                  useLoked ,
                  Signe ,
                  Pos ,
                  orderPos ,
                  UserLang
                )
                SELECT  UserID ,
                        UserName ,
                        Password ,
                        UserSkin ,
                        UserColore ,
                        GridColor ,
                        ProunchID ,
                        COMP_ID ,
                        Mnue ,
                        IsAdmin ,
                        IsSupervisor ,
                        IsUser ,
                        ShowPrice ,
                        Journal ,
                        CD_PortName ,
                        CD_Parity ,
                        CD_Baudrate ,
                        CD_StopBits ,
                        CD_DataBits ,
                        UseItemWithowyutBalence ,
                        RebateItems ,
                        Show_Item_Palance ,
                        zeropic ,
                        stopmessages ,
                        IsOnline ,
                        useLoked ,
                        Signe ,
                        Pos ,
                        orderPos ,
                        UserLang
                FROM    FALCON.dbo.Users



        INSERT  INTO dbo.Falcon_Sitting
                ( SitingID ,
                  Effict_Stores_From_Invoices ,
                  falcondata ,
                  EPD ,
                  Lenth ,
                  QTY ,
                  Normal ,
                  usebox ,
                  CachierForm ,
                  Autoprint ,
                  BarcodGeneral ,
                  Autonew ,
                  usetaxes ,
                  Shobox ,
                  PriceAsLevel ,
                  ComfirstPayFirst ,
                  printestlam ,
                  printtahdeer ,
                  printsarf ,
                  fokasQuantity ,
                  FokasPrice ,
                  FokasSeial ,
                  Sale_With_Percent ,
                  LokYearly ,
                  UseVacation ,
                  GardDawry ,
                  MobilyUsername ,
                  MobilyPass ,
                  Badal_Ta3am ,
                  Badal_Sakan ,
                  Badal_thabet ,
                  Badal_Entekal ,
                  Badal_Tabe3a ,
                  Badal_Other ,
                  Badal_tel ,
                  Take_Schole ,
                  MobilySender ,
                  BudgetFromTblCostTree
                )
                SELECT  SitingID ,
                        Effict_Stores_From_Invoices ,
                        falcondata ,
                        EPD ,
                        Lenth ,
                        QTY ,
                        Normal ,
                        usebox ,
                        CachierForm ,
                        Autoprint ,
                        BarcodGeneral ,
                        Autonew ,
                        usetaxes ,
                        Shobox ,
                        PriceAsLevel ,
                        ComfirstPayFirst ,
                        printestlam ,
                        printtahdeer ,
                        printsarf ,
                        fokasQuantity ,
                        FokasPrice ,
                        FokasSeial ,
                        Sale_With_Percent ,
                        LokYearly ,
                        UseVacation ,
                        GardDawry ,
                        MobilyUsername ,
                        MobilyPass ,
                        Badal_Ta3am ,
                        Badal_Sakan ,
                        Badal_thabet ,
                        Badal_Entekal ,
                        Badal_Tabe3a ,
                        Badal_Other ,
                        Badal_tel ,
                        Take_Schole ,
                        MobilySender ,
                        BudgetFromTblCostTree
                FROM    FALCON.dbo.Falcon_Sitting 









        INSERT  INTO dbo.COMPANY_INFO
                ( COMP_ID ,
                  COMP_NAME ,
                  COMP_ADDRESS ,
                  COMP_CITY ,
                  COMP_GOVER ,
                  COMP_COUNTRY ,
                  COMP_POB ,
                  COMP_PHONE ,
                  COMP_FAX ,
                  LINKID ,
                  EMAIL ,
                  TRADENO ,
                  VATNO ,
                  COMP_LOGO ,
                  ProunchID ,
                  FilenNO ,
                  SalesNO ,
                  Mamorya ,
                  GM ,
                  maglesedara ,
                  SaleManger ,
                  AcontManger ,
                  BurchaseManger ,
                  StoreManager ,
                  HRManager ,
                  ProductManeger ,
                  mentManger ,
                  CountryName ,
                  GM_2 ,
                  maglesedara_2 ,
                  SaleManger_2 ,
                  AcontManger_2 ,
                  BurchaseManger_2 ,
                  StoreManager_2 ,
                  HRManager_2 ,
                  ProductManeger_2 ,
                  mentManger_2 ,
                  Picture_BG ,
                  Picture_head ,
                  Picture_Footer
                )
                SELECT  COMP_ID ,
                        COMP_NAME ,
                        COMP_ADDRESS ,
                        COMP_CITY ,
                        COMP_GOVER ,
                        COMP_COUNTRY ,
                        COMP_POB ,
                        COMP_PHONE ,
                        COMP_FAX ,
                        LINKID ,
                        EMAIL ,
                        TRADENO ,
                        VATNO ,
                        COMP_LOGO ,
                        ProunchID ,
                        FilenNO ,
                        SalesNO ,
                        Mamorya ,
                        GM ,
                        maglesedara ,
                        SaleManger ,
                        AcontManger ,
                        BurchaseManger ,
                        StoreManager ,
                        HRManager ,
                        ProductManeger ,
                        mentManger ,
                        CountryName ,
                        GM_2 ,
                        maglesedara_2 ,
                        SaleManger_2 ,
                        AcontManger_2 ,
                        BurchaseManger_2 ,
                        StoreManager_2 ,
                        HRManager_2 ,
                        ProductManeger_2 ,
                        mentManger_2 ,
                        Picture_BG ,
                        Picture_head ,
                        Picture_Footer
                FROM    FALCON.dbo.COMPANY_INFO




        INSERT  INTO dbo.jobs
                ( jobid ,
                  jname ,
                  departmentid ,
                  gm ,
                  supjop ,
                  supgm ,
                  describe ,
                  respons ,
                  jtermes ,
                  flag ,
                  ProunchID ,
                  COMP_ID
                )
                SELECT  jobid ,
                        jname ,
                        departmentid ,
                        gm ,
                        supjop ,
                        supgm ,
                        describe ,
                        respons ,
                        jtermes ,
                        flag ,
                        ProunchID ,
                        COMP_ID
                FROM    FALCON.dbo.jobs 








        INSERT  INTO dbo.workPlan
                ( Planid ,
                  planName
                )
                SELECT  0 Planid ,
                        planName
                FROM    FALCON.dbo.workPlan






        INSERT  INTO dbo.Stores
                ( store_id ,
                  store_name ,
                  store_address ,
                  emp_name ,
                  flag ,
                  ProunchID ,
                  COMP_ID ,
                  City
                )
                SELECT  store_id ,
                        store_name ,
                        store_address ,
                        emp_name ,
                        flag ,
                        ProunchID ,
                        COMP_ID ,
                        City
                FROM    FALCON.dbo.Stores






        INSERT  INTO dbo.unit
                ( unitcode ,
                  unitname ,
                  unitname_en ,
                  flag ,
                  ProunchID ,
                  COMP_ID ,
                  Unit_En_Name
                )
                SELECT  unitcode ,
                        unitname ,
                        unitname_en ,
                        flag ,
                        ProunchID ,
                        COMP_ID ,
                        Unit_En_Name
                FROM    FALCON.dbo.unit 






        INSERT  INTO dbo.Groups
                ( groupid ,
                  groupname ,
                  flag ,
                  ProunchID ,
                  COMP_ID ,
                  En_Name ,
                  Short_Code
                )
                SELECT  groupid ,
                        groupname ,
                        flag ,
                        ProunchID ,
                        COMP_ID ,
                        En_Name ,
                        Short_Code
                FROM    FALCON.dbo.Groups 



        INSERT  INTO dbo.Groups_Sub
                ( subid ,
                  groupid ,
                  subname ,
                  flag ,
                  ProunchID ,
                  COMP_ID ,
                  En_Sub_Name ,
                  Short_Sub_Code
                )
                SELECT  subid ,
                        groupid ,
                        subname ,
                        flag ,
                        ProunchID ,
                        COMP_ID ,
                        En_Sub_Name ,
                        Short_Sub_Code
                FROM    FALCON.dbo.Groups_Sub 





        INSERT  INTO dbo.EznType
                ( EZnTypeID ,
                  TypeName
                )
                SELECT  EZnTypeID ,
                        TypeName
                FROM    FALCON.dbo.EznType 







        INSERT  INTO dbo.TasnefTogary
                ( TradeTypeID ,
                  TradeType ,
                  flag
                )
                SELECT  TradeTypeID ,
                        TradeType ,
                        flag
                FROM    FALCON.dbo.TasnefTogary




        INSERT  INTO dbo.Items
                ( Item_Id ,
                  itm_code2 ,
                  Barcode ,
                  itm_ismedicine ,
                  Item_Unit_Id ,
                  Item_unit2 ,
                  Item_unit3 ,
                  EqulUnit ,
                  EqulUnit2 ,
                  UnitEqualed ,
                  Item_Gro_Id ,
                  Item_Gro_Sub_Id ,
                  TradeTypeID ,
                  Item_Name ,
                  Item_Name_AR ,
                  itm_request_limit ,
                  MaxQ ,
                  MINQ ,
                  price ,
                  gomla ,
                  FixPrice ,
                  Tax ,
                  HameshRebh ,
                  aNotes ,
                  actiondate ,
                  UserName ,
                  flag ,
                  Pic ,
                  ProunchID ,
                  COMP_ID ,
                  PriceFexed ,
                  priceCome ,
                  hgomla ,
                  hmonaksat ,
                  pricemonaksat ,
                  hbig ,
                  pricbig ,
                  hmedum ,
                  pricemedum ,
                  hlow ,
                  pricelow ,
                  PartNo ,
                  DescountPercent ,
                  PonasPercent ,
                  com_id ,
                  itm_com_code ,
                  itm_has_expire ,
                  itm_active ,
                  itm_freez ,
                  itm_scientific_n1 ,
                  itm_scientific_n2 ,
                  itm_scientific_group_id ,
                  itm_usage_manner_id ,
                  itm_isprev ,
                  itm_itf_id ,
                  itm_stop_sell ,
                  itm_stop_pur ,
                  itm_print_barcode ,
                  itm_allow_discount ,
                  itm_max_disc_per ,
                  itm_max_disc_val ,
                  itm_print_name ,
                  itm_sales_avreage_period ,
                  itm_srvc ,
                  itm_origin ,
                  itm_isShortage ,
                  itm_favourite ,
                  itm_location ,
                  itm_default_limit ,
                  itm_purchase_unit ,
                  itm_sell_unit ,
                  itm_max_disc_value_NotUsed ,
                  StorePlace ,
                  Waigt ,
                  ChargDesc ,
                  GomrokDesc ,
                  GomrakFinshDesc ,
                  OtherDesc ,
                  OntherNameDesc ,
                  Shehada ,
                  OtherShehada ,
                  Boxcost ,
                  Tabkher ,
                  InernalCharg ,
                  Purchase ,
                  Quntity_Price ,
                  Pic1
                )
                SELECT  Item_Id ,
                        itm_code2 ,
                        Barcode ,
                        itm_ismedicine ,
                        Item_Unit_Id ,
                        Item_unit2 ,
                        Item_unit3 ,
                        EqulUnit ,
                        EqulUnit2 ,
                        UnitEqualed ,
                        Item_Gro_Id ,
                        Item_Gro_Sub_Id ,
                        TradeTypeID ,
                        Item_Name ,
                        Item_Name_AR ,
                        itm_request_limit ,
                        MaxQ ,
                        MINQ ,
                        price ,
                        gomla ,
                        FixPrice ,
                        Tax ,
                        HameshRebh ,
                        aNotes ,
                        GETDATE() ,
                        UserName ,
                        flag ,
                        Pic ,
                        ProunchID ,
                        COMP_ID ,
                        PriceFexed ,
                        priceCome ,
                        hgomla ,
                        hmonaksat ,
                        pricemonaksat ,
                        hbig ,
                        pricbig ,
                        hmedum ,
                        pricemedum ,
                        hlow ,
                        pricelow ,
                        PartNo ,
                        DescountPercent ,
                        PonasPercent ,
                        com_id ,
                        itm_com_code ,
                        itm_has_expire ,
                        itm_active ,
                        itm_freez ,
                        itm_scientific_n1 ,
                        itm_scientific_n2 ,
                        itm_scientific_group_id ,
                        itm_usage_manner_id ,
                        itm_isprev ,
                        itm_itf_id ,
                        itm_stop_sell ,
                        itm_stop_pur ,
                        itm_print_barcode ,
                        itm_allow_discount ,
                        itm_max_disc_per ,
                        itm_max_disc_val ,
                        itm_print_name ,
                        itm_sales_avreage_period ,
                        itm_srvc ,
                        itm_origin ,
                        itm_isShortage ,
                        itm_favourite ,
                        itm_location ,
                        itm_default_limit ,
                        itm_purchase_unit ,
                        itm_sell_unit ,
                        itm_max_disc_value_NotUsed ,
                        StorePlace ,
                        Waigt ,
                        ChargDesc ,
                        GomrokDesc ,
                        GomrakFinshDesc ,
                        OtherDesc ,
                        OntherNameDesc ,
                        Shehada ,
                        OtherShehada ,
                        Boxcost ,
                        Tabkher ,
                        InernalCharg ,
                        Purchase ,
                        Quntity_Price ,
                        Pic1
                FROM    FALCON.dbo.Items 





        INSERT  INTO dbo.BerchisingType
                ( BeurchisingID ,
                  BeurchisingTypeMoves ,
                  flag
                )
                SELECT  BeurchisingID ,
                        BeurchisingTypeMoves ,
                        flag
                FROM    FALCON.dbo.BerchisingType 




        INSERT  INTO dbo.SuppType
                ( SuppTypeID ,
                  TypeName ,
                  flag
                )
                SELECT  SuppTypeID ,
                        TypeName ,
                        flag
                FROM    FALCON.dbo.SuppType 




        INSERT  INTO dbo.PaymentTerms
                ( TermID ,
                  TermName ,
                  EnTermName
                )
                SELECT  TermID ,
                        TermName ,
                        EnTermName
                FROM    FALCON.dbo.PaymentTerms 



        INSERT  INTO dbo.PaymentTerms_Items
                ( TermItemID ,
                  TermID ,
                  TermName_Items ,
                  EnTermName_Items
                )
                SELECT  TermItemID ,
                        TermID ,
                        TermName_Items ,
                        EnTermName_Items
                FROM    FALCON.dbo.PaymentTerms_Items




        INSERT  INTO dbo.suppliers
                ( suppliers_id ,
                  suppliers_name ,
                  address ,
                  phone ,
                  fax ,
                  mobile ,
                  site ,
                  email ,
                  scope ,
                  togary ,
                  saletax ,
                  taxcard ,
                  mamorya ,
                  fileNO ,
                  notes ,
                  user_id ,
                  action_date ,
                  flag ,
                  ProunchID ,
                  COMP_ID ,
                  TahseelModa ,
                  Short_Name_Ar ,
                  Supplier_Name_EN ,
                  Short_Name_EN ,
                  SuppTypeID ,
                  TreeCode ,
                  TreeName ,
                  Mokadama ,
                  Mokadama_Name ,
                  Mo7tagazat ,
                  Mo7tagazat_Name ,
                  Dman ,
                  Dman_Name
                )
                SELECT  suppliers_id ,
                        suppliers_name ,
                        address ,
                        phone ,
                        fax ,
                        mobile ,
                        site ,
                        email ,
                        scope ,
                        togary ,
                        saletax ,
                        taxcard ,
                        mamorya ,
                        fileNO ,
                        notes ,
                        user_id ,
                        GETDATE() ,
                        flag ,
                        ProunchID ,
                        COMP_ID ,
                        TahseelModa ,
                        Short_Name_Ar ,
                        Supplier_Name_EN ,
                        Short_Name_EN ,
                        SuppTypeID ,
                        TreeCode ,
                        TreeName ,
                        Mokadama ,
                        Mokadama_Name ,
                        Mo7tagazat ,
                        Mo7tagazat_Name ,
                        Dman ,
                        Dman_Name
                FROM    FALCON.dbo.suppliers
        





        INSERT  INTO dbo.customer_emp
                ( MAndopID ,
                  MandopName ,
                  flag ,
                  ProunchID ,
                  COMP_ID ,
                  IsFrom_Mksab ,
                  IsFrom_Egmaly ,
                  PercentVaue ,
                  IsFrom_Target ,
                  TargetValue ,
                  ServicePercent ,
                  UserID
                )
                SELECT  MAndopID ,
                        MandopName ,
                        flag ,
                        ProunchID ,
                        COMP_ID ,
                        IsFrom_Mksab ,
                        IsFrom_Egmaly ,
                        PercentVaue ,
                        IsFrom_Target ,
                        TargetValue ,
                        ServicePercent ,
                        UserID
                FROM    FALCON.dbo.customer_emp 





        INSERT  INTO dbo.Service_Type
                ( Service_ID ,
                  Service_Type_Name ,
                  flag
                )
                SELECT  Service_ID ,
                        Service_Type_Name ,
                        flag
                FROM    FALCON.dbo.Service_Type 



        INSERT  INTO dbo.customers_types
                ( TypeCode ,
                  TypeName ,
                  flag ,
                  ProunchID ,
                  COMP_ID
                )
                SELECT  TypeCode ,
                        TypeName ,
                        flag ,
                        ProunchID ,
                        COMP_ID
                FROM    FALCON.dbo.customers_types 




        INSERT  INTO dbo.MainCustomer
                ( Mcid ,
                  CustomerName ,
                  Flag ,
                  CustLevel ,
                  CustDescount ,
                  Cust_Type ,
                  TypeCode
                )
                SELECT  Mcid ,
                        CustomerName ,
                        Flag ,
                        CustLevel ,
                        CustDescount ,
                        Cust_Type ,
                        TypeCode
                FROM    FALCON.dbo.MainCustomer 




        INSERT  dbo.customers
                ( Customer_id ,
                  MAndopID ,
                  customer_name ,
                  address ,
                  phone ,
                  fax ,
                  mobile ,
                  site ,
                  scope ,
                  ntes ,
                  user_id ,
                  action_date ,
                  TypeCode ,
                  Mcid ,
                  CityID ,
                  flag ,
                  COMP_ID ,
                  ProunchID ,
                  custtime ,
                  custVacaiotn ,
                  Taxstate ,
                  paystate ,
                  waypay ,
                  custlevel ,
                  TahseelModa ,
                  Customer_Name_EN ,
                  Short_Name_Ar ,
                  Short_Name_EN ,
                  EmpSuperFizer ,
                  Limet_money ,
                  Nationality ,
                  brth_date ,
                  Discount_percent ,
                  TreeCode ,
                  TreeName ,
                  OperatorID ,
                  ID_Number ,
                  ID_Date_start ,
                  ID_Date_End ,
                  ID_From ,
                  Mokadama ,
                  Mokadama_Name ,
                  Mo7tagazat ,
                  Mo7tagazat_Name ,
                  Dman ,
                  Dman_Name
                )
                SELECT  Customer_id ,
                        MAndopID ,
                        customer_name ,
                        address ,
                        phone ,
                        fax ,
                        mobile ,
                        site ,
                        scope ,
                        ntes ,
                        user_id ,
                        GETDATE() ,
                        TypeCode ,
                        Mcid ,
                        CityID ,
                        flag ,
                        COMP_ID ,
                        ProunchID ,
                        custtime ,
                        custVacaiotn ,
                        Taxstate ,
                        paystate ,
                        waypay ,
                        custlevel ,
                        TahseelModa ,
                        Customer_Name_EN ,
                        Short_Name_Ar ,
                        Short_Name_EN ,
                        EmpSuperFizer ,
                        Limet_money ,
                        Nationality ,
                        GETDATE() ,
                        Discount_percent ,
                        TreeCode ,
                        TreeName ,
                        OperatorID ,
                        ID_Number ,
                        ID_Date_start ,
                        ID_Date_End ,
                        ID_From ,
                        Mokadama ,
                        Mokadama_Name ,
                        Mo7tagazat ,
                        Mo7tagazat_Name ,
                        Dman ,
                        Dman_Name
                FROM    FALCON.dbo.customers




        INSERT  INTO dbo.Box
                ( BoxID ,
                  BoxName ,
                  flag ,
                  ProunchID ,
                  COMP_ID
                )
                SELECT  BoxID ,
                        BoxName ,
                        flag ,
                        ProunchID ,
                        COMP_ID
                FROM    FALCON.dbo.Box 




        INSERT  INTO dbo.Bank_Code
                ( id_Bank ,
                  Bank_Name ,
                  Bank_Location ,
                  COMP_ID ,
                  ProunchID ,
                  flag
                )
                SELECT  id_Bank ,
                        Bank_Name ,
                        Bank_Location ,
                        COMP_ID ,
                        ProunchID ,
                        flag
                FROM    FALCON.dbo.Bank_Code 





        INSERT  INTO dbo.BankAccountName
                ( AccountID ,
                  id_Bank ,
                  Bank_Name ,
                  Bank_Location ,
                  AccountName ,
                  AccountNum ,
                  COMP_ID ,
                  ProunchID ,
                  flag
				 )
                SELECT  AccountID ,
                        id_Bank ,
                        Bank_Name ,
                        Bank_Location ,
                        AccountName ,
                        AccountNum ,
                        COMP_ID ,
                        ProunchID ,
                        flag
                FROM    FALCON.dbo.BankAccountName 





        INSERT  INTO dbo.OstazCode
                ( OstazID ,
                  OstazName ,
                  flag ,
                  ProunchID ,
                  COMP_ID
                )
                SELECT  OstazID ,
                        OstazName ,
                        flag ,
                        ProunchID ,
                        COMP_ID
                FROM    FALCON.dbo.OstazCode 




        INSERT  INTO dbo.Mezanya
                ( MezanyaID ,
                  Mezanya_Name ,
                  flag ,
                  Mezanya_Name_En
                )
                SELECT  MezanyaID ,
                        Mezanya_Name ,
                        flag ,
                        Mezanya_Name_En
                FROM    FALCON.dbo.Mezanya 







        INSERT  dbo.FinalBalanceTypes
                ( ClassificationId ,
                  ClassificationName
                )
                SELECT  ClassificationId ,
                        ClassificationName
                FROM    dbo.FinalBalanceTypes 







        INSERT  INTO dbo.Acc_Type_tree
                ( ACC_Type_ID ,
                  Type_Name ,
                  flag ,
                  ClassificationId
                )
                SELECT  ACC_Type_ID ,
                        Type_Name ,
                        flag ,
                        ClassificationId
                FROM    FALCON.dbo.Acc_Type_tree 





        INSERT  INTO dbo.Account_Group
                ( AccountGroup_ID ,
                  ACC_Type_ID ,
                  ClassificationId ,
                  AccountGroup_Name ,
                  flag
                )
                SELECT  AccountGroup_ID ,
                        ACC_Type_ID ,
                        ClassificationId ,
                        AccountGroup_Name ,
                        flag
                FROM    FALCON.dbo.Account_Group 




        INSERT  INTO dbo.keadSitting
                ( AccID ,
                  AccName ,
                  KedDescirpe ,
                  ID ,
                  EznID ,
                  CustTypeID ,
                  StoreID ,
                  SuppTypeID ,
                  BoxID ,
                  SalesType ,
                  BurshaseType ,
                  bankAccountID ,
                  typeID ,
                  Asl_ID
                )
                SELECT  AccID ,
                        AccName ,
                        KedDescirpe ,
                        ID ,
                        EznID ,
                        CustTypeID ,
                        StoreID ,
                        SuppTypeID ,
                        BoxID ,
                        SalesType ,
                        BurshaseType ,
                        bankAccountID ,
                        typeID ,
                        Asl_ID
                FROM    FALCON.dbo.keadSitting 



        INSERT  INTO dbo.AslName
                ( AslID ,
                  AslCode ,
                  Aslname ,
                  DatePurchse ,
                  InvNO ,
                  MOD ,
                  Serial ,
                  Price ,
                  Steep ,
                  EhlakType ,
                  TasneefID ,
                  flag ,
                  notes ,
                  COMP_ID ,
                  ProunchID ,
                  CostID ,
                  DateStart ,
                  NetVale ,
                  lastdate ,
                  ScrapValue
                )
                SELECT  AslID ,
                        AslCode ,
                        Aslname ,
                        DatePurchse ,
                        InvNO ,
                        MOD ,
                        Serial ,
                        Price ,
                        Steep ,
                        EhlakType ,
                        TasneefID ,
                        flag ,
                        notes ,
                        COMP_ID ,
                        ProunchID ,
                        CostID ,
                        DateStart ,
                        NetVale ,
                        lastdate ,
                        ScrapValue
                FROM    FALCON.dbo.AslName 








        INSERT  dbo.AslType
                ( TasneefID ,
                  TasneefName ,
                  PRUN_ID
                )
                SELECT  TasneefID ,
                        TasneefName ,
                        PRUN_ID
                FROM    dbo.AslType 






        INSERT  INTO dbo.TblCostTree
                ( ID ,
                  AccCode ,
                  AccName ,
                  ParentID ,
                  AccType ,
                  AccLevel ,
                  ISmain ,
                  CustID ,
                  ShortCode ,
                  LongCode ,
                  Flag
                )
                SELECT  ID ,
                        AccCode ,
                        AccName ,
                        ParentID ,
                        AccType ,
                        AccLevel ,
                        ISmain ,
                        CustID ,
                        ShortCode ,
                        LongCode ,
                        Flag
                FROM    FALCON.dbo.TblCostTree



    END
   
