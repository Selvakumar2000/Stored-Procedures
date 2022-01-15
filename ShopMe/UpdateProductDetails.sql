-- =============================================
-- Author:		<Selvakumar Raman>
-- Create date: <03/01/2022>
-- Description:	<update product details>
-- =============================================
DROP PROCEDURE IF EXISTS dbo.UpdateProductDetails
GO
CREATE PROCEDURE dbo.UpdateProductDetails

	@ProductId INT,
	@ProductName VARCHAR(100),
	@ProductDescription VARCHAR(200),
	@AmountRs INT,
	@Discount INT,
	@Quantity INT

AS
BEGIN

BEGIN TRY
	
	UPDATE dbo.Products SET ProductName=@ProductName, ProductDescription=@ProductDescription, AmountRs=@AmountRs,
	OriginalPrice=@AmountRs-200, Discount=@Discount, Quantity=@Quantity WHERE ProductId = @ProductId;

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO


