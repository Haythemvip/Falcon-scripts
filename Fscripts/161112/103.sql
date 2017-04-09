 
CREATE TYPE [dbo].[Amr_ShiraI_Iems_TblP] AS TABLE(
	[serial] [BIGINT] NULL,
	[item_name] [TEXT] NULL,
	[price] [FLOAT] NULL,
	[unit] [VARCHAR](50) NULL,
	[quantity] [FLOAT] NULL,
	[total] [FLOAT] NULL,
	[CostID] [BIGINT] NULL,
	[ItemCode] [INT] NULL,
	[ItemDiscount] [FLOAT] NULL,
	[ItemNet] [FLOAT] NULL,
	[Budget] [FLOAT] NULL,
	[PreviousValue] [FLOAT] NULL,
	[Diff] [FLOAT] NULL,
	[SupID] [BIGINT] NULL,
	[DiscountPercent] [FLOAT] NULL,
	[Last_purchase] NVARCHAR(50) NULL,
	[Stock] [FLOAT] NULL,
	[itm_code2] [NVARCHAR](150) NULL,
	[Item_Unit_Id] [INT] NULL,
	[Unit_Quantity] [FLOAT] NULL,
	[Unit_Price] [FLOAT] NULL,
	[Rate] [FLOAT] NULL
)
GO


