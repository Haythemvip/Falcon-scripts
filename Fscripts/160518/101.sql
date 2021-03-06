 

ALTER PROCEDURE [dbo].[Item_Card_Add]
    @store_id BIGINT ,
    @Item_Id BIGINT ,
    @VenderOrCustomer VARCHAR(50) ,
    @EznNO BIGINT = 0 ,
    @InvNO BIGINT = 0 ,
    @ActionDate DATE ,
    @QCome FLOAT ,
    @PriceCome FLOAT ,
    @AllPriceCome FLOAT ,
    @Qout FLOAT ,
    @PriceOut FLOAT ,
    @AllPriceOut FLOAT ,
    @CostAllItemOut FLOAT ,
    @Year BIGINT ,
    @VallItemsInStores FLOAT ,
    @Maksab FLOAT ,
    @ActionName VARCHAR(50) ,
    @SN NVARCHAR(MAX) = '0',
    @FirstStokID INT = 0 ,
    @EsnSarfID INT = 0 ,
    @EznEdafaID INT = 0 ,
    @InvtaxID INT = 0 ,
    @ByanID INT = 0 ,
    @TaswyaEdafaID INT = 0 ,
    @TaswyaKhasmID INT = 0 ,
    @ConvertBetwenStores INT = 0 ,
    @TagmeaSanf INT = 0 ,
    @TalabMowadID INT = 0 ,
    @Mardodat_inv_ID INT = 0 ,
    @Mardoat_byan_id INT = 0 ,
    @Inv_com_ID INT = 0 ,
    @Inv_com_noTax_ID INT = 0 ,
    @Mardodat_Inv_Com_Id INT = 0 ,
    @Mardodat_Inv_Com_Nottax_ID INT = 0 ,
    @Srial INT = 0,
	@TalabMowadINDEX INT = 0
	,@MoveType NVARCHAR(50)= 0

AS
    INSERT  INTO [dbo].[Item_Card]
            ( [store_id] ,
              [Item_Id] ,
              [VenderOrCustomer] ,
              [EznNO] ,
              [InvNO] ,
              [ActionDate] ,
              [QCome] ,
              [PriceCome] ,
              [AllPriceCome] ,
              [Qout] ,
              [PriceOut] ,
              [AllPriceOut] ,
              [CostAllItemOut] ,
              [Year] ,
              [VallItemsInStores] ,
              [Maksab] ,
              [ActionName] ,
              [SN] ,
              [FirstStokID] ,
              [EsnSarfID] ,
              [EznEdafaID] ,
              [InvtaxID] ,
              [ByanID] ,
              [TaswyaEdafaID] ,
              [TaswyaKhasmID] ,
              [ConvertBetwenStores] ,
              [TagmeaSanf] ,
              [TalabMowadID] ,
              [Mardodat_inv_ID] ,
              [Mardoat_byan_id] ,
              [Inv_com_ID] ,
              [Inv_com_noTax_ID] ,
              [Mardodat_Inv_Com_Id] ,
              [Mardodat_Inv_Com_Nottax_ID] ,
              [Srial] ,
			   [TalabMowadINDEX],
			   [MoveType]

            )
    VALUES  ( @store_id ,
              @Item_Id ,
              @VenderOrCustomer ,
              @EznNO ,
              @InvNO ,
              @ActionDate ,
              @QCome ,
              @PriceCome ,
              @AllPriceCome ,
              @Qout ,
              @PriceOut ,
              @AllPriceOut ,
              @CostAllItemOut ,
              @Year ,
              @VallItemsInStores ,
              @Maksab ,
              @ActionName ,
              @SN ,
              @FirstStokID ,
              @EsnSarfID ,
              @EznEdafaID ,
              @InvtaxID ,
              @ByanID ,
              @TaswyaEdafaID ,
              @TaswyaKhasmID ,
              @ConvertBetwenStores ,
              @TagmeaSanf ,
              @TalabMowadID ,
              @Mardodat_inv_ID ,
              @Mardoat_byan_id ,
              @Inv_com_ID ,
              @Inv_com_noTax_ID ,
              @Mardodat_Inv_Com_Id ,
              @Mardodat_Inv_Com_Nottax_ID ,
              @Srial  ,
			  @TalabMowadINDEX,@MoveType
            )
 



