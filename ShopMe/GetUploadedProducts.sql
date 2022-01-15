-- ======================================================================
-- Author:		<Selvakumar Raman>
-- Create date: <19/11/2021>
-- Description:	<It is used to fetch the products uploaded by supplier>
-- ======================================================================
DROP PROCEDURE IF EXISTS dbo.GetUploadedProducts
GO
CREATE PROCEDURE dbo.GetUploadedProducts

	@SupplierId INT
AS
BEGIN

BEGIN TRY
	
	SELECT ProductId,ProductName,ProductBrand,ProductDescription,AmountRs,OriginalPrice,Discount,PhotoUrl,Category,Quantity
	FROM dbo.Products WHERE SupplierId = @SupplierId;

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO
