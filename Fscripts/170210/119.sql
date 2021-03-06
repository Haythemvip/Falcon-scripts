 
ALTER PROCEDURE [dbo].[Item_Cost]
	
	 @Item_Id int 

	,@Case int  

	,@percent decimal(18,2)

	, @Storeid BIGINT 

    , @ActionDate DATE


 --case = 1 الودر اولا يصرف اولا
 --case = 0 المتوصط المرجح

AS


create table #ItemCosts
(
Item_Id  [numeric](8, 0) NULL,
ActionDate date,
Cost decimal(18,2),
Raseed decimal(18,2),
SalePrice decimal(18,2),
Avrg  decimal(18,2),

)

	 

--declare @cont int 
--Declare @total decimal(18,2)


--set @cont = (select count(Item_Id ) from #ItemCosts Where Raseed > 0)

--set @total = (select sum(Cost) from #ItemCosts Where Raseed > 0)

--update #ItemCosts set Avrg = @total / @cont







if @Case = 1 

BEGIN

DELETE FROM #ItemCosts

insert into     #ItemCosts 
SELECT          Item_Id, ActionDate, ISNULL(CostAllItemOut, 0.00)  AS Cost, SUM(QCome) - SUM(Qout) AS Raseed ,0.00 , 0.00 
FROM            Item_Card
Where           Item_Id = @Item_Id
GROUP BY        Item_Id, CostAllItemOut, ActionDate
ORDER BY        ActionDate  


update #ItemCosts set SalePrice =  (cost * @percent )/100 + cost
select Cost  as Price , *  from #ItemCosts Where Raseed > 0

END
 
 if @Case = 0 

BEGIN

DELETE FROM #ItemCosts

insert into     #ItemCosts 
   SELECT         @Item_Id, NULL, null , Null , 0.00 , dbo.get_item_average (@Storeid,@Item_Id,@ActionDate,DATEPART(YEAR,@ActionDate)) 

     

update #ItemCosts set SalePrice =  (Avrg * @percent )/100 + Avrg


select Avrg  as Price , SalePrice from #ItemCosts  


END



