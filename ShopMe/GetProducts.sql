-- =============================================
-- Author:		<Selvakumar Raman>
-- Create date: <09/11/2021>
-- Description:	<It is used to fetch products>
-- =============================================
DROP PROCEDURE IF EXISTS dbo.GetProducts
GO
CREATE PROCEDURE dbo.GetProducts

    @Category VARCHAR(100),
	@MinPrice INT,
	@MaxPrice INT,
	@Gender VARCHAR(100)
AS
BEGIN

BEGIN TRY
	
	SELECT ProductId,ProductName,ProductBrand,ProductDescription,AmountRs,OriginalPrice,Discount,PhotoUrl,Category
	FROM dbo.Products WHERE Gender = @Gender AND Category = @Category AND AmountRs >= @MinPrice AND AmountRs <= @MaxPrice;

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO


