 


ALTER PROCEDURE [dbo].[SelectInvoice_Omolat]
	
	@id int
AS
BEGIN

SELECT     *
                     
FROM         MandopOmola where id = @id



SELECT     *
                     
FROM         MandopOmola_Total where id = @id

END

