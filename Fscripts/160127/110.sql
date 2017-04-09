
  
CREATE  PROCEDURE [dbo].[Amr_Shiraa_Operations]
    @performa_id BIGINT ,
    @Customer_id VARCHAR(50) ,
    @customername NVARCHAR(250) ,
    @contactcmb VARCHAR(50) ,
    @performa_date DATE ,
    @intro TEXT ,
    @performa_date_end DATE ,
    @payment_termes NVARCHAR(MAX) ,
    @delivery_termes NVARCHAR(MAX) ,
    @delivery_place NVARCHAR(MAX) ,
    @shipping_type NVARCHAR(MAX) ,
    @sales_tax MONEY ,
    @general_tax MONEY ,
    @notes TEXT ,
    @total MONEY ,
    @net MONEY ,
    @performaonly TEXT ,
    @user_id VARCHAR(50) ,
    @action_date DATE ,
    @depart_name VARCHAR(50) ,
    @flag BIT ,
    @idmandop BIGINT ,
    @ProunchID INT ,
    @COMP_ID INT ,
    @order_no BIGINT ,
    @Br_Notes NVARCHAR(150) ,
    @PMO_Notes NVARCHAR(150) ,
    @OrderNotes NVARCHAR(150) ,
    @MalyaNotes NVARCHAR(150) ,
    @GNlNote NVARCHAR(150) ,
    @Signed BIT ,
    @PO_NO NVARCHAR(50) ,
    @Inqury_Ref NVARCHAR(50) ,
    @Currancy NVARCHAR(50) ,
    @Rate FLOAT ,
    @ShaipingDate NVARCHAR(50) ,
    @ProjectID BIGINT ,
    @Discount FLOAT ,
    @Emp_Code BIGINT ,
    @DepartID INT ,
    @PurchaseTypeID INT ,
    @Amr_ShiraI_Iems_TblP Amr_ShiraI_Iems_TblP READONLY ,
    @Amr_Shieraa_Remarks_tblP Amr_Shieraa_Remarks_tblP READONLY ,
    @Amr_Shieraa_Payments_tblP Amr_Shieraa_Payments_tblP READONLY ,
    @IsNew BIT
AS
    IF @IsNew = 0
        BEGIN

            DELETE  FROM Amr_Sheraa
            WHERE   performa_id = @performa_id
            DELETE  FROM Amr_Sheraa_Item
            WHERE   performa_id = @performa_id
            DELETE  FROM Amr_Shieraa_Remarks
            WHERE   performa_id = @performa_id
            DELETE  FROM PO_Payments
            WHERE   performa_id = @performa_id


        END

    IF @IsNew = 1
        BEGIN

            SET @performa_id = ( SELECT MAX(performa_id)
                                 FROM   dbo.Amr_Sheraa
                               ) + 1 
        END
        
    INSERT  INTO [dbo].[Amr_Sheraa]
            ( [performa_id] ,
              [Customer_id] ,
              [customername] ,
              [contactcmb] ,
              [performa_date] ,
              [intro] ,
              [performa_date_end] ,
              [payment_termes] ,
              [delivery_termes] ,
              [delivery_place] ,
              [shipping_type] ,
              [sales_tax] ,
              [general_tax] ,
              [notes] ,
              [total] ,
              [net] ,
              [performaonly] ,
              [user_id] ,
              [action_date] ,
              [Depart_Name] ,
              [flag] ,
              [idmandop] ,
              [ProunchID] ,
              [COMP_ID] ,
              [order_no] ,
              [Br_Notes] ,
              [PMO_Notes] ,
              [OrderNotes] ,
              [MalyaNotes] ,
              [GNlNote] ,
              [Signed] ,
              [PO_NO] ,
              [Inqury_Ref] ,
              [Currancy] ,
              [Rate] ,
              [ShaipingDate] ,
              [ProjectID] ,
              [Discount] ,
              [Emp_Code] ,
              [DepartID] ,
              [PurchaseTypeID]
            )
    VALUES  ( @performa_id ,
              @Customer_id ,
              @customername ,
              @contactcmb ,
              @performa_date ,
              @intro ,
              @performa_date_end ,
              @payment_termes ,
              @delivery_termes ,
              @delivery_place ,
              @shipping_type ,
              @sales_tax ,
              @general_tax ,
              @notes ,
              @total ,
              @net ,
              @performaonly ,
              @user_id ,
              @action_date ,
              @depart_name ,
              @flag ,
              @idmandop ,
              @ProunchID ,
              @COMP_ID ,
              @order_no ,
              @Br_Notes ,
              @PMO_Notes ,
              @OrderNotes ,
              @MalyaNotes ,
              @GNlNote ,
              @Signed ,
              @PO_NO ,
              @Inqury_Ref ,
              @Currancy ,
              @Rate ,
              @ShaipingDate ,
              @ProjectID ,
              @Discount ,
              @Emp_Code ,
              @DepartID ,
              @PurchaseTypeID

            )


    INSERT  INTO dbo.Amr_Sheraa_Item
            ( performa_id ,
              serial ,
              item_name ,
              price ,
              unit ,
              quantity ,
              total ,
              CostID ,
              ItemCode ,
              ItemDiscount ,
              ItemNet ,
              Budget ,
              PreviousValue ,
              Diff ,
              SupID ,
              DiscountPercent

            
			 )
            SELECT  @performa_id ,
                    *
            FROM    @Amr_ShiraI_Iems_TblP  



    INSERT  INTO dbo.Amr_Shieraa_Remarks
            ( performa_id ,
              serial ,
              Terms ,
              Remark ,
              Remark_Notes
            )
            SELECT  @performa_id ,
                    *
            FROM    @Amr_Shieraa_Remarks_tblP
			 


    INSERT  INTO dbo.PO_Payments
            ( performa_id ,
              DayCounts ,
              Amount ,
              Percenteg ,
              AmountDate ,
              AmountState ,
              PayMent_Notes 
            )
            SELECT  @performa_id ,
                    *
            FROM    @Amr_Shieraa_Payments_tblP
             




         
 
GO


