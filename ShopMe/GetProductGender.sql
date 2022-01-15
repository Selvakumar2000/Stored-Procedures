-- ======================================================
-- Author:		<Selvakumar Raman>
-- Create date: <09/11/2021>
-- Description:	<It is used to fetch the product gender>
-- ======================================================
DROP PROCEDURE IF EXISTS dbo.GetProductGender
GO
CREATE PROCEDURE dbo.GetProductGender

	@ProductId INT
AS
BEGIN

BEGIN TRY
	
	SELECT Gender FROM dbo.Products WHERE ProductId = @ProductId;

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO


