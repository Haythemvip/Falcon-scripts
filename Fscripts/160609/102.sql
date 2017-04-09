
UPDATE       invoiceout
SET                MandopID = customer_emp.MAndopID
FROM            customer_emp INNER JOIN
                         invoiceout ON customer_emp.MandopName = invoiceout.Mandop_Name