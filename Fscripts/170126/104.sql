 


ALTER PROCEDURE [dbo].[Sp_InsertUpdateWayBill]
	@WaybillID int,
	@CompanyID int,
	@BranchID int,
	@date date,
	@UserID int,
	@LoadingPoint nvarchar(50),
	@LoadSeaport bit,
	@LoadTerminal bit,
	@LoadWhouse bit,
	@LoadAirport bit,
	@ArrivalPoint nvarchar(50),
	@ArrivalSeaport bit,
	@ArrivalTerminal bit,
	@ArrivalWhouse bit,
	@ArrivalAirport bit,
	@CustomerID bigint,
	@Quantity nvarchar(50),
	@ReceivedID bigint,
	@CarrierID bigint,
	@ShipmentID bigint,
	@TruckNumber nvarchar(50),
	@DriverID bigint,
	@TransportAmount decimal(18, 2),
	@Demurrage decimal(18, 2),
	@Other decimal(18, 2),
	@SubTotal decimal(18, 2),
	@LoadArrivalDate date,
	@LoadArrivalTime time,
	@LoadDepartureDate date,
	@LoadDepartureTime time,
	@DeliveryArrivalDate date,
	@DeliveryArrivalTime time,
	@DeliveryunLoadingDate date,
	@DeliveryunLoadingTime TIME,
	@UseJournal INT 

AS

SET NOCOUNT ON

IF EXISTS(SELECT [WaybillID] FROM [dbo].[WayBill] WHERE [WaybillID] = @WaybillID)
BEGIN



IF @UseJournal = 1

BEGIN 



	UPDATE [dbo].[WayBill] SET
		[CompanyID] = @CompanyID,
		[BranchID] = @BranchID,
		[date] = @date,
		[UserID] = @UserID,
		[LoadingPoint] = @LoadingPoint,
		[LoadSeaport] = @LoadSeaport,
		[LoadTerminal] = @LoadTerminal,
		[LoadWhouse] = @LoadWhouse,
		[LoadAirport] = @LoadAirport,
		[ArrivalPoint] = @ArrivalPoint,
		[ArrivalSeaport] = @ArrivalSeaport,
		[ArrivalTerminal] = @ArrivalTerminal,
		[ArrivalWhouse] = @ArrivalWhouse,
		[ArrivalAirport] = @ArrivalAirport,
		[CustomerID] = @CustomerID,
		Quantity=@Quantity,
		[ReceivedID] = @ReceivedID,
		[CarrierID] = @CarrierID,
		[ShipmentID] = @ShipmentID,
		[TruckNumber] = @TruckNumber,
		[DriverID] = @DriverID,
		[TransportAmount] = @TransportAmount,
		[Demurrage] = @Demurrage,
		[Other] = @Other,
		[SubTotal] = @SubTotal,
		[LoadArrivalDate] = @LoadArrivalDate,
		[LoadArrivalTime] = @LoadArrivalTime,
		[LoadDepartureDate] = @LoadDepartureDate,
		[LoadDepartureTime] = @LoadDepartureTime,
		[DeliveryArrivalDate] = @DeliveryArrivalDate,
		[DeliveryArrivalTime] = @DeliveryArrivalTime,
		[DeliveryunLoadingDate] = @DeliveryunLoadingDate,
		[DeliveryunLoadingTime] = @DeliveryunLoadingTime
	WHERE
		[WaybillID] = @WaybillID

END 







IF @UseJournal = 0

BEGIN 



	UPDATE [dbo].[WayBill] SET
		[CompanyID] = @CompanyID,
		[BranchID] = @BranchID,
		[date] = @date,
		[UserID] = @UserID,
		[LoadingPoint] = @LoadingPoint,
		[LoadSeaport] = @LoadSeaport,
		[LoadTerminal] = @LoadTerminal,
		[LoadWhouse] = @LoadWhouse,
		[LoadAirport] = @LoadAirport,
		[ArrivalPoint] = @ArrivalPoint,
		[ArrivalSeaport] = @ArrivalSeaport,
		[ArrivalTerminal] = @ArrivalTerminal,
		[ArrivalWhouse] = @ArrivalWhouse,
		[ArrivalAirport] = @ArrivalAirport,
		[CustomerID] = @CustomerID,
		Quantity=@Quantity,
		[ReceivedID] = @ReceivedID,
		[CarrierID] = @CarrierID,
		[ShipmentID] = @ShipmentID,
		[TruckNumber] = @TruckNumber,
		[DriverID] = @DriverID,
		
		[LoadArrivalDate] = @LoadArrivalDate,
		[LoadArrivalTime] = @LoadArrivalTime,
		[LoadDepartureDate] = @LoadDepartureDate,
		[LoadDepartureTime] = @LoadDepartureTime,
		[DeliveryArrivalDate] = @DeliveryArrivalDate,
		[DeliveryArrivalTime] = @DeliveryArrivalTime,
		[DeliveryunLoadingDate] = @DeliveryunLoadingDate,
		[DeliveryunLoadingTime] = @DeliveryunLoadingTime
	WHERE
		[WaybillID] = @WaybillID

END 







END
ELSE
BEGIN
	INSERT INTO [dbo].[WayBill] (
		[WaybillID],
		[CompanyID],
		[BranchID],
		[date],
		[UserID],
		[LoadingPoint],
		[LoadSeaport],
		[LoadTerminal],
		[LoadWhouse],
		[LoadAirport],
		[ArrivalPoint],
		[ArrivalSeaport],
		[ArrivalTerminal],
		[ArrivalWhouse],
		[ArrivalAirport],
		[CustomerID],
		[Quantity],
		[ReceivedID],
		[CarrierID],
		[ShipmentID],
		[TruckNumber],
		[DriverID],
		[TransportAmount],
		[Demurrage],
		[Other],
		[SubTotal],
		[LoadArrivalDate],
		[LoadArrivalTime],
		[LoadDepartureDate],
		[LoadDepartureTime],
		[DeliveryArrivalDate],
		[DeliveryArrivalTime],
		[DeliveryunLoadingDate],
		[DeliveryunLoadingTime]
	) VALUES (
		@WaybillID,
		@CompanyID,
		@BranchID,
		@date,
		@UserID,
		@LoadingPoint,
		@LoadSeaport,
		@LoadTerminal,
		@LoadWhouse,
		@LoadAirport,
		@ArrivalPoint,
		@ArrivalSeaport,
		@ArrivalTerminal,
		@ArrivalWhouse,
		@ArrivalAirport,
		@CustomerID,
		@Quantity,
		@ReceivedID,
		@CarrierID,
		@ShipmentID,
		@TruckNumber,
		@DriverID,
		@TransportAmount,
		@Demurrage,
		@Other,
		@SubTotal,
		@LoadArrivalDate,
		@LoadArrivalTime,
		@LoadDepartureDate,
		@LoadDepartureTime,
		@DeliveryArrivalDate,
		@DeliveryArrivalTime,
		@DeliveryunLoadingDate,
		@DeliveryunLoadingTime
	)
END

--endregion


;


