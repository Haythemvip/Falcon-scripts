
CREATE PROCEDURE SignePO
    @Details INT = 0 ,
    @performa_id BIGINT = 0 ,
    @FromDate DATE = NULL ,
    @ToDate DATE = NULL ,
    @year INT
AS
    BEGIN
	
	
        IF @Details = 0
            BEGIN 
	
          
                IF @performa_id = 0
                    BEGIN 

                        SELECT  order_no ,
                                performa_id ,
                                customername ,
                                performa_date ,
                                performa_date_end ,
                                payment_termes ,
                                delivery_termes ,
                                delivery_place ,
                                shipping_type ,
                                sales_tax ,
                                general_tax ,
                                total ,
                                net ,
                                user_id ,
                                action_date ,
                                Signed ,
                                Br_Notes ,
                                PMO_Notes ,
                                GNlNote ,
                                MalyaNotes
                        FROM    Amr_Sheraa
                        WHERE   action_date BETWEEN @FromDate AND @ToDate;
                       
                        

                    END;


                IF @performa_id > 0
                    BEGIN 

                        SELECT  order_no ,
                                performa_id ,
                                customername ,
                                performa_date ,
                                performa_date_end ,
                                payment_termes ,
                                delivery_termes ,
                                delivery_place ,
                                shipping_type ,
                                sales_tax ,
                                general_tax ,
                                total ,
                                net ,
                                user_id ,
                                action_date ,
                                Signed ,
                                Br_Notes ,
                                PMO_Notes ,
                                GNlNote ,
                                MalyaNotes
                        FROM    Amr_Sheraa
                        WHERE   performa_id = @performa_id;
                          
                    END;

	
            END;
	
	
        IF @Details = 1
            BEGIN 
                SELECT  performa_id ,
                        order_no ,
                        AccName ,
                        performa_date ,
                        customername ,
                        serial ,
                        item_name ,
                        price ,
                        unit ,
                        quantity ,
                        total ,
                        Accont ,
                        AccontStart ,
                        AccontEnd ,
                        AccontNotes ,
                        ExcutiveManager ,
                        ExcutiveManagerStart ,
                        ExcutiveManagerEnd ,
                        ExcutiveManagerNotes ,
                        Gm ,
                        GmStart ,
                        GmEnd ,
                        GmNotes ,
                        BurchaseDate ,
                        dbo.Item_Balance(ItemCode, @year, 0) AS AllBalance ,
                        dbo.Last_purchase_Date(ItemCode) AS LastPurchase ,
                        dbo.Last_purchase(ItemCode) AS LastPrice
                FROM    View_Amr_Sheraa
                WHERE   performa_id = @performa_id
                ORDER BY serial;

            END; 


	 
    END;
GO
