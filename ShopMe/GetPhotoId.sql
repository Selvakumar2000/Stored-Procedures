-- =============================================
-- Author:		<Selvakumar Raman>
-- Create date: <23/11/2021>
-- Description:	<It is used to fetch the photoId>
-- =============================================
DROP PROCEDURE IF EXISTS dbo.GetPhotoId
GO
CREATE PROCEDURE dbo.GetPhotoId

	@UserId INT
AS
BEGIN

BEGIN TRY
	
	SELECT PublicId FROM dbo.AspNetUsers WHERE Id = @UserId;

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO

