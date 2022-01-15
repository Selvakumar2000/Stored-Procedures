-- ====================================================
-- Author:		<Selvakumar Raman>
-- Create date: <09/11/2021>
-- Description:	<It is used to fetch product details>
-- ====================================================
DROP PROCEDURE IF EXISTS dbo.GetCartProducts
GO
CREATE PROCEDURE dbo.GetCartProducts

	@BuyerId INT

AS
BEGIN

BEGIN TRY
	
	SELECT ProductId,ProductName,ProductBrand,ProductDescription,AmountRs, Discount,PhotoUrl,Category
	FROM dbo.OrderManagement WHERE BuyerId = @BuyerId and IsCart = 1;

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO

