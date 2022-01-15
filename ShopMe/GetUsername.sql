-- ==================================================
-- Author:		<Selvakumar Raman>
-- Create date: <09/11/2021>
-- Description:	<It is used to fetch the username>
-- =================================================
DROP PROCEDURE IF EXISTS dbo.GetUsername
GO
CREATE PROCEDURE dbo.GetUsername

	@Username VARCHAR(100)

AS
BEGIN

BEGIN TRY
	
	SELECT Username FROM dbo.AspNetUsers WHERE UserName=@Username;
	
END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO


