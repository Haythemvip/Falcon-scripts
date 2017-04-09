 
CREATE PROCEDURE BoxMove_custom 
	
	@BoxID INT,
	@FromDate DATE ,
	@ToDate DATE ,
	@CurID INT = 1

AS
BEGIN
	
	SELECT * FROM dbo.View_BoxMove WHERE 
	BoxID = @BoxID and CurID = @CurID and aDate BETWEEN @FromDate AND @ToDate 

END
GO
