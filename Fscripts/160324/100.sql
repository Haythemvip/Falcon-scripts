
  
ALTER PROCEDURE [dbo].[Customers_Add]
    @Customer_id BIGINT ,
    @MAndopID BIGINT ,
    @customer_name VARCHAR(250) ,
    @address TEXT ,
    @phone VARCHAR(50) ,
    @fax VARCHAR(50) ,
    @mobile VARCHAR(50) ,
    @site VARCHAR(50) ,
    @scope VARCHAR(50) ,
    @ntes TEXT ,
    @user_id VARCHAR(50) ,
    @action_date DATE ,
    @TypeCode INT ,
    @Mcid BIGINT ,
    @CityID BIGINT ,
    @flag BIT ,
    @COMP_ID INT = 1 ,
    @ProunchID INT = 1 ,
    @custtime NVARCHAR(50) ,
    @custVacaiotn NVARCHAR(50) ,
    @Taxstate NVARCHAR(50) ,
    @paystate NVARCHAR(50) ,
    @waypay NVARCHAR(50) ,
    @custlevel NVARCHAR(50) ,
    @TahseelModa INT ,
    @Customer_Name_EN NVARCHAR(50) ,
    @Short_Name_Ar NVARCHAR(50) ,
    @Short_Name_EN NVARCHAR(50) ,
    @EmpSuperFizer INT ,
    @Limet_money FLOAT ,
    @Nationality NVARCHAR(50) ,
    @brth_date DATE ,
    @Discount_percent NVARCHAR(50) ,
    @TreeCode INT = 0 ,
    @TreeName NVARCHAR(100) = 0 ,
    @OperatorID INT = 0 ,
    @ID_Number BIGINT = 0 ,
    @ID_Date_End DATE ,
    @ID_From NVARCHAR(50) = ' ' ,
    @Mokadama BIGINT = 0 ,
    @Mokadama_Name NVARCHAR(100) = '' ,
    @Mo7tagazat BIGINT = 0 ,
    @Mo7tagazat_Name NVARCHAR(100) = '' ,
    @Dman BIGINT = 0 ,
    @Dman_Name NVARCHAR(100) = ''
AS
    INSERT  INTO [dbo].[customers]
            ( [Customer_id] ,
              [MAndopID] ,
              [customer_name] ,
              [address] ,
              [phone] ,
              [fax] ,
              [mobile] ,
              [site] ,
              [scope] ,
              [ntes] ,
              [user_id] ,
              [action_date] ,
              [TypeCode] ,
              [Mcid] ,
              [CityID] ,
              [flag] ,
              [COMP_ID] ,
              [ProunchID] ,
              [custtime] ,
              [custVacaiotn] ,
              [Taxstate] ,
              [paystate] ,
              [waypay] ,
              [custlevel] ,
              [TahseelModa] ,
              [Customer_Name_EN] ,
              [Short_Name_Ar] ,
              [Short_Name_EN] ,
              [EmpSuperFizer] ,
              [Limet_money] ,
              [Nationality] ,
              [brth_date] ,
              [Discount_percent] ,
              [TreeCode] ,
              [TreeName] ,
              [OperatorID] ,
              [ID_Number] ,
              [ID_Date_End] ,
              [ID_From] ,
              Mokadama ,
              Mokadama_Name ,
              Mo7tagazat ,
              Mo7tagazat_Name ,
              Dman ,
              Dman_Name   
		    )
    VALUES  ( @Customer_id ,
              @MAndopID ,
              @customer_name ,
              @address ,
              @phone ,
              @fax ,
              @mobile ,
              @site ,
              @scope ,
              @ntes ,
              @user_id ,
              @action_date ,
              @TypeCode ,
              @Mcid ,
              @CityID ,
              @flag ,
              @COMP_ID ,
              @ProunchID ,
              @custtime ,
              @custVacaiotn ,
              @Taxstate ,
              @paystate ,
              @waypay ,
              @custlevel ,
              @TahseelModa ,
              @Customer_Name_EN ,
              @Short_Name_Ar ,
              @Short_Name_EN ,
              @EmpSuperFizer ,
              @Limet_money ,
              @Nationality ,
              @brth_date ,
              @Discount_percent ,
              @TreeCode ,
              @TreeName ,
              @OperatorID ,
              @ID_Number ,
              @ID_Date_End ,
              @ID_From ,
              @Mokadama ,
              @Mokadama_Name ,
              @Mo7tagazat ,
              @Mo7tagazat_Name ,
              @Dman ,
              @Dman_Name   
		    )
