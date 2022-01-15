-- =============================================
-- Author:		<Selvakumar Raman>
-- Create date: <09/11/2021>
-- Description:	<It is used to add products>
-- =============================================
DROP PROCEDURE IF EXISTS dbo.AddProduct
GO
CREATE PROCEDURE dbo.AddProduct

	@ProductName VARCHAR(100),
	@SupplierId INT, 
	@SupplierName VARCHAR(100),
	@ProductBrand VARCHAR(100),
	@ProductDescription VARCHAR(500),
	@AmountRs INT,
	@OriginalPrice INT,
	@Discount INT,
	@Category VARCHAR(100),
	@Gender VARCHAR(100),
	@PhotoUrl VARCHAR(5000),
	@PhotoPublicId VARCHAR(5000),
    @Quantity INT
AS
BEGIN

BEGIN TRY
	
	INSERT INTO dbo.Products
	       VALUES (@ProductName,@SupplierId,@SupplierName,@ProductBrand,@ProductDescription,@AmountRs,
		           @OriginalPrice,@Discount,@Category,@Gender,@PhotoUrl,@PhotoPublicId,@Quantity);

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO


