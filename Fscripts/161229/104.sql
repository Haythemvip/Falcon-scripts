

CREATE PROCEDURE [dbo].[SP_InsertUpdateTransportOrder]
	@ID bigint,
	@CustomerID bigint,
	@StorageFeesStartDate date,
	@Place_transport nvarchar(150),
	@PortID bigint,
	@No_container nvarchar(150),
	@Status bit
AS

SET NOCOUNT ON

IF EXISTS(SELECT [ID] FROM [dbo].[Transport_Order] WHERE [ID] = @ID)
BEGIN
	UPDATE [dbo].[Transport_Order] SET
		[CustomerID] = @CustomerID,
		[StorageFeesStartDate] = @StorageFeesStartDate,
		[Place_transport] = @Place_transport,
		[PortID] = @PortID,
		[No_container] = @No_container,
		[Status] = @Status
	WHERE
		[ID] = @ID
END
ELSE
BEGIN
	INSERT INTO [dbo].[Transport_Order] (
		[ID],
		[CustomerID],
		[StorageFeesStartDate],
		[Place_transport],
		[PortID],
		[No_container],
		[Status]
	) VALUES (
		@ID,
		@CustomerID,
		@StorageFeesStartDate,
		@Place_transport,
		@PortID,
		@No_container,
		@Status
	)
END

GO


