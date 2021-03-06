 
/****** Object:  UserDefinedTableType [dbo].[Amr_ShiraI_Iems_TblP]    Script Date: 11/10/2016 03:16:11 � ******/
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
	[Last_purchase] [FLOAT] NULL,
	[Stock] [FLOAT] NULL,
	[itm_code2] [NVARCHAR](150) NULL,
	[Item_Unit_Id] INT ,
	[Unit_Quantity] FLOAT,
	[Unit_Price] FLOAT ,
	[Rate] FLOAT 
)
GO


