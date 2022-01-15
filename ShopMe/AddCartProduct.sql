-- ===========================================================
-- Author:		<Selvakumar Raman>
-- Create date: <09/11/2021>
-- Description:	<It is used to add product to cart section>
-- ============================================================
DROP PROCEDURE IF EXISTS dbo.AddCartProduct
GO
CREATE PROCEDURE dbo.AddCartProduct

	  @BuyerId INT, 
      @BuyerName VARCHAR(100),
      @BuyerRole VARCHAR(100),
      @ProductId INT,
      @ProductName VARCHAR(100),
      @ProductBrand VARCHAR(100),
      @ProductDescription VARCHAR(500),
      @AmountRs INT,
      @Discount INT,
      @Category VARCHAR(100),
      @ProductGender VARCHAR(100),
      @PhotoUrl VARCHAR(500),
      @AddedTime DATETIME,
      @IsCart INT
AS
BEGIN

BEGIN TRY
	
	INSERT INTO dbo.OrderManagement
	       VALUES ( @BuyerId,  @BuyerName,@BuyerRole,@ProductId, @ProductName,
					@ProductBrand,@ProductDescription, @AmountRs,@Discount,
                    @Category,@ProductGender, @PhotoUrl,@AddedTime, @IsCart,null,0);

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO