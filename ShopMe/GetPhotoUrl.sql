-- =================================================
-- Author:		<Selvakumar Raman>
-- Create date: <23/11/2021>
-- Description:	<It is used to fetch the photoUrl>
-- =================================================
DROP PROCEDURE IF EXISTS dbo.GetPhotoUrl
GO
CREATE PROCEDURE dbo.GetPhotoUrl

	@UserId INT
AS
BEGIN

BEGIN TRY
	
	SELECT PhotoUrl FROM dbo.AspNetUsers WHERE Id = @UserId;

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO

