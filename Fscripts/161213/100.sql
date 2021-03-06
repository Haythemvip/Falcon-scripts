 
 
 
 
CREATE PROCEDURE [dbo].[Journal_is_Not_Migrated]
    @Date1 DATE ,
    @Date2 DATE
AS
    BEGIN
 


        SELECT  TaswyaID AS Action_Code ,
                'سند صرف من البنك' AS Action_Name ,
                TaswyaDate AS Action_Date
        FROM    dbo.Tree_Masroft_Bank
        WHERE   Journal NOT IN ( SELECT ID
                                 FROM   dbo.El_Koyod_El_Yawmia )
                AND TaswyaDate BETWEEN @Date1 AND @Date2
        UNION
        SELECT  TaswyaID AS Action_Code ,
                'سند قبض الى البنك' AS Action_Name ,
                TaswyaDate AS Action_Date
        FROM    dbo.Tree_Makbodat_Bank
        WHERE   Journal NOT IN ( SELECT ID
                                 FROM   dbo.El_Koyod_El_Yawmia )
                AND TaswyaDate BETWEEN @Date1 AND @Date2
        UNION
        SELECT  TaswyaID AS Action_Code ,
                'سند صرف من الخزينة' AS Action_Name ,
                TaswyaDate AS Action_Date
        FROM    dbo.Tree_Masroft_box
        WHERE   Journal NOT IN ( SELECT ID
                                 FROM   dbo.El_Koyod_El_Yawmia )
                AND TaswyaDate BETWEEN @Date1 AND @Date2
        UNION
        SELECT  TaswyaID AS Action_Code ,
                'سند قبض الى الخزينة' AS Action_Name ,
                TaswyaDate AS Action_Date
        FROM    dbo.Tree_Makbodat_box
        WHERE   Journal NOT IN ( SELECT ID
                                 FROM   dbo.El_Koyod_El_Yawmia )
                AND TaswyaDate BETWEEN @Date1 AND @Date2
        UNION
        SELECT  InvoiceNo AS Action_Code ,
                'فاتورة المشتريات' AS Action_Name ,
                idate AS Action_Date
        FROM    dbo.invcomeNoTax
        WHERE   Journal NOT IN ( SELECT ID
                                 FROM   dbo.El_Koyod_El_Yawmia )
                AND idate BETWEEN @Date1 AND @Date2
        UNION
        SELECT  InvoiceNo AS Action_Code ,
                'فاتورة المبيعات' AS Action_Name ,
                idate AS Action_Date
        FROM    dbo.byan
        WHERE   Journal NOT IN ( SELECT ID
                                 FROM   dbo.El_Koyod_El_Yawmia )
                AND idate BETWEEN @Date1 AND @Date2
        UNION
        SELECT  InvoiceNo AS Action_Code ,
                'مردودات فاتورة مشتريات' AS Action_Name ,
                idate AS Action_Date
        FROM    dbo.Mardodat_Invoice_Com_NotTax
        WHERE   Journal NOT IN ( SELECT ID
                                 FROM   dbo.El_Koyod_El_Yawmia )
                AND idate BETWEEN @Date1 AND @Date2
        UNION
        SELECT  InvoiceNo AS Action_Code ,
                'مردودات فاتورة مبيعات' AS Action_Name ,
                idate AS Action_Date
        FROM    dbo.Mardodat_Byan
        WHERE   Journal NOT IN ( SELECT ID
                                 FROM   dbo.El_Koyod_El_Yawmia )
                AND idate BETWEEN @Date1 AND @Date2
        UNION
        SELECT  SarfID AS Action_Code ,
                'إذن صرف' AS Action_Name ,
                Sarfdate AS Action_Date
        FROM    dbo.EsnSarf
        WHERE   Journal NOT IN ( SELECT ID
                                 FROM   dbo.El_Koyod_El_Yawmia )
                AND Sarfdate BETWEEN @Date1 AND @Date2
        UNION
        SELECT  EdafaID AS Action_Code ,
                'إذن اضافة' AS Action_Name ,
                Edafadate AS Action_Date
        FROM    dbo.EznEdafa
        WHERE   Journal NOT IN ( SELECT ID
                                 FROM   dbo.El_Koyod_El_Yawmia )
                AND Edafadate BETWEEN @Date1 AND @Date2
        UNION
        SELECT  SarfID AS Action_Code ,
                'تسوية بالخصم' AS Action_Name ,
                Sarfdate AS Action_Date
        FROM    dbo.TaswyaKhasm
        WHERE   Journal NOT IN ( SELECT ID
                                 FROM   dbo.El_Koyod_El_Yawmia )
                AND Sarfdate BETWEEN @Date1 AND @Date2
        UNION
        SELECT  EdafaID AS Action_Code ,
                'تسوية بالاضافة' AS Action_Name ,
                Edafadate AS Action_Date
        FROM    dbo.TaswyaEdafa
        WHERE   Journal NOT IN ( SELECT ID
                                 FROM   dbo.El_Koyod_El_Yawmia )
                AND Edafadate BETWEEN @Date1 AND @Date2
        UNION
        SELECT  TransId AS Action_Code ,
                'تحويل بين المخازن' AS Action_Name ,
                TransDate AS Action_Date
        FROM    dbo.Stores_Transfares
        WHERE   Journal NOT IN ( SELECT ID
                                 FROM   dbo.El_Koyod_El_Yawmia )
                AND TransDate BETWEEN @Date1 AND @Date2



				 UNION
        SELECT  AssemplyTo.AssID AS Action_Code ,
                'تجميع وتفكيك صنف' AS Action_Name ,
                ActionDate AS Action_Date
        FROM    dbo.AssemplyFrom
		INNER JOIN dbo.AssemplyTo ON AssemplyTo.AssID = AssemplyFrom.AssID 
        WHERE   Journal NOT IN ( SELECT ID
                                 FROM   dbo.El_Koyod_El_Yawmia )
                AND ActionDate BETWEEN @Date1 AND @Date2
       
      

--SELECT * FROM dbo.El_Koyod_El_Yawmia WHERE ID NOT IN (SELECT Journal  FROM dbo.TaswyaKhasm ) AND OstasName = 'تسويه بالخصم'
--SELECT * FROM dbo.El_Koyod_El_Yawmia WHERE ID NOT IN (SELECT Journal  FROM dbo.TaswyaEdafa ) AND OstasName = 'تسويه بالاضافة'
--SELECT * FROM dbo.El_Koyod_El_Yawmia WHERE ID NOT IN (SELECT Journal  FROM dbo.Stores_Transfares ) AND OstasName = 'تحويل بين المخازن'
--select * FROM dbo.El_Koyod_El_Yawmia WHERE ID NOT IN (SELECT Journal  FROM dbo.EsnSarf ) AND OstasName = 'اذن صرف'
--select * FROM dbo.El_Koyod_El_Yawmia WHERE ID NOT IN (SELECT Journal  FROM dbo.EznEdafa ) AND OstasName = 'اذن اضافة'
--select * FROM dbo.El_Koyod_El_Yawmia WHERE ID NOT IN (SELECT Journal  FROM dbo.invcomeNoTax ) AND OstasName = 'فاتورة مشتريات'
--select * FROM dbo.El_Koyod_El_Yawmia WHERE ID NOT IN (SELECT Journal  FROM dbo.byan ) AND OstasName = 'فاتورة مبيعات'
--select * FROM dbo.El_Koyod_El_Yawmia WHERE ID NOT IN (SELECT Journal  FROM dbo.Mardodat_Invoice_Com_NotTax ) AND OstasName = 'مردودات مشتريات'
--select * FROM dbo.El_Koyod_El_Yawmia WHERE ID NOT IN (SELECT Journal  FROM dbo.Mardodat_Byan ) AND OstasName = 'مردودات فاتورة مبيعات'
--SELECT * FROM dbo.El_Koyod_El_Yawmia WHERE ID NOT IN (SELECT Journal  FROM dbo.Tree_Masroft_Bank  ) AND OstasName = 'سند صرف من البنك'
--SELECT * FROM dbo.El_Koyod_El_Yawmia WHERE ID NOT IN (SELECT Journal  FROM dbo.Tree_Makbodat_Bank ) AND OstasName = 'سند قبض الى البنك'
--SELECT * FROM dbo.El_Koyod_El_Yawmia WHERE ID NOT IN (SELECT Journal  FROM dbo.Tree_Masroft_box  ) AND OstasName = 'سند صرف من الخزينة'
--SELECT * FROM dbo.El_Koyod_El_Yawmia WHERE ID NOT IN (SELECT Journal  FROM dbo.Tree_Makbodat_box ) AND OstasName = 'سند قبض الى الخزينة'


       

    END

 


 