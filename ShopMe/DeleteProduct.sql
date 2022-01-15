-- ===================================================
-- Author:		<Selvakumar Raman>
-- Create date: <03/01/2022>
-- Description:	<It is used to delete the product>
-- ===================================================
DROP PROCEDURE IF EXISTS dbo.DeleteProduct
GO
CREATE PROCEDURE dbo.DeleteProduct

	@ProductId INT
AS
BEGIN

BEGIN TRY
	
	DELETE FROM dbo.Products WHERE ProductId=@ProductId;

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO