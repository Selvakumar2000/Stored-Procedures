-- ===================================================
-- Author:		<Selvakumar Raman>
-- Create date: <09/11/2021>
-- Description:	<It is used to remove cart product>
-- ===================================================
DROP PROCEDURE IF EXISTS dbo.RemoveCartProduct
GO
CREATE PROCEDURE dbo.RemoveCartProduct

	@BuyerID     INT,
	@ProductID   INT
AS
BEGIN

	DECLARE @Status	INT

BEGIN TRY
	
	SET @Status = (SELECT IsBuyed FROM dbo.OrderManagement WHERE BuyerId = @BuyerId AND ProductId = @ProductID);
	IF @Status=0
	BEGIN
		DELETE FROM dbo.OrderManagement WHERE BuyerId = @BuyerId AND ProductId = @ProductID;
	END
	ELSE
	BEGIN
		UPDATE dbo.OrderManagement SET IsCart=0 WHERE BuyerId = @BuyerId AND ProductId = @ProductID;
	END

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO