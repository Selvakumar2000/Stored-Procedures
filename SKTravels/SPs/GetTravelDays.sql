-- =============================================
-- Author:		<Selvakumar Raman>
-- Create date: <01/03/2022>
-- Description:	<Get TravelDays>
-- =============================================
DROP PROCEDURE IF EXISTS dbo.GetTravelDays
GO
CREATE PROCEDURE dbo.GetTravelDays

	@UserID BIGINT,
	@MainCityID BIGINT,
	@AdditionalParam1 VARCHAR(10) = '' OUTPUT, 
	@ErrorParam VARCHAR(100) = '' OUTPUT

AS
BEGIN
	
BEGIN TRY

	IF NOT EXISTS(SELECT 1 FROM dbo.Users WHERE UserID = @UserID)
	BEGIN
		SET @ErrorParam = 'User Does Not Exists'
	END
	IF NOT EXISTS(SELECT 1 FROM dbo.MstMainCity WHERE MaincityID = @MainCityID)
	BEGIN
		SET @ErrorParam = 'City Name is Invalid'
	END

	IF @ErrorParam = NULL OR @ErrorParam = ''
	select @ErrorParam
	BEGIN
		SELECT NumberOfDays AS 'NumberOfDays' FROM dbo.TravelDaysStaging WHERE MaincityID=@MainCityID AND UserID=@UserID
	END	

END TRY

BEGIN CATCH

	SELECT 'Empty' AS 'Output'

END CATCH

OUTPUT:

	SELECT @ErrorParam
	SELECT @AdditionalParam1

END
GO


