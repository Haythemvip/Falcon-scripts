 
CREATE TYPE dbo.byan_item_eznType AS TABLE

(
	 
	[serialitem] [BIGINT] NULL,
	[itemid] [BIGINT] NULL,
	[ITEMS_ITEM_NAME] [NVARCHAR](MAX) NULL,
	[unit] [VARCHAR](50) NULL,
	[PriceOne] [DECIMAL](18, 2) NULL,
	[Q] [INT] NULL,
	[TotalPrice] [DECIMAL](18, 2) NULL,
	[SN] [TEXT] NULL,
	[IsFast] [BIT] NULL DEFAULT ((0)),
	[IsHold] [INT] NULL,
	[Isprinted] [BIT] NULL DEFAULT ((0))
)
