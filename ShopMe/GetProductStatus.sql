-- ======================================================
-- Author:		<Selvakumar Raman>
-- Create date: <17/11/2021>
-- Description:	<It is used to fetch the product status>
-- ======================================================
DROP PROCEDURE IF EXISTS dbo.GetProductStatus
GO
CREATE PROCEDURE dbo.GetProductStatus

	@ProductId INT,
	@BuyerId INT,
	@BuyerName VARCHAR(100),
	@BuyerRole VARCHAR(100)
AS
BEGIN

BEGIN TRY
	
	SELECT 1 AS RecordExists FROM dbo.OrderManagement
	WHERE ProductId = @ProductId and BuyerId = @BuyerId and BuyerName = @BuyerName and BuyerRole = @BuyerRole;

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO
