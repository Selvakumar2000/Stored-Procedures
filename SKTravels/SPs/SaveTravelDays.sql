-- =============================================
-- Author:		<Selvakumar Raman>
-- Create date: <01/03/2022>
-- Description:	<Save TravelDays>
-- =============================================
DROP PROCEDURE IF EXISTS dbo.SaveTravelDays
GO
CREATE PROCEDURE dbo.SaveTravelDays

	@UserID BIGINT,
	@NumberOfDays INT,
	@MainCityID BIGINT,
	@AdditionalParam1 VARCHAR(10) = '' OUTPUT,
	@AdditionalParam2 VARCHAR(50) = '' OUTPUT, 
	@ErrorParam VARCHAR(100) = '' OUTPUT

AS
BEGIN

	DECLARE @TravelDaysID		    BIGINT
	
BEGIN TRY

	IF NOT EXISTS(SELECT 1 FROM dbo.Users WHERE UserID = @UserID)
	BEGIN
		SET @ErrorParam = 'User Does Not Exists'
	END
	IF NOT EXISTS(SELECT 1 FROM dbo.MstMainCity WHERE MaincityID = @MainCityID)
	BEGIN
		SET @ErrorParam = 'City Name is Invalid'
	END
	
	IF(@NumberOfDays = 1)
	BEGIN
		SET @AdditionalParam1='3'
	END
	IF(@NumberOfDays = 2)
	BEGIN
		SET @AdditionalParam1='5'
	END
	IF(@NumberOfDays = 3)
	BEGIN
		SET @AdditionalParam1='7'
	END
	IF(@NumberOfDays = 4)
	BEGIN
		SET @AdditionalParam1='10'
	END
	IF(@NumberOfDays = 5)
	BEGIN
		SET @AdditionalParam1='10'
	END
	IF(@NumberOfDays = 6)
	BEGIN
		SET @AdditionalParam1='10'
	END
	IF(@NumberOfDays = 7)
	BEGIN
		SET @AdditionalParam1='10'
	END
	
	SELECT @TravelDaysID=TravelDaysStagingID FROM dbo.TravelDaysStaging WHERE UserID=@UserID AND MaincityID=@MainCityID

	IF @ErrorParam = NULL OR @ErrorParam = ''
	select 1
	BEGIN
	
		IF NOT EXISTS (SELECT 1 FROM dbo.TravelDaysStaging WHERE UserID=@UserID AND MainCityID=@MainCityID)
		BEGIN
			INSERT INTO dbo.TravelDaysStaging(UserID,MaincityID,NumberOfDays)
			VALUES (@UserID,@MainCityID,@NumberOfDays);
			
			SELECT
				VisitingcityID AS 'VisitingcityID',
				CityName AS 'CityName',
				Price AS 'Price',
				MaincityID AS 'MaincityID'
			FROM dbo.MstVisitingCity
			WHERE MaincityID=@MainCityID

		END
		ELSE
		BEGIN
			UPDATE dbo.TravelDaysStaging SET NumberOfDays=@NumberOfDays
			WHERE UserID=@UserID AND MainCityID=@MainCityID

			SELECT
				VisitingcityID AS 'VisitingcityID',
				CityName AS 'CityName',
				Price AS 'Price',
				MaincityID AS 'MaincityID'
			FROM dbo.MstVisitingCity
			WHERE MaincityID=@MainCityID

			SET @AdditionalParam2 = '['+STUFF((SELECT ','+CONVERT(NVARCHAR(50),A.VisitingCityID)
										FROM 
											dbo.VisitingCitiesStaging A
										WHERE 
											A.TravelDaysStagingID=@TravelDaysID
										FOR XML PATH('')),1,1,'')+']' 

		END
	END	

END TRY

BEGIN CATCH

	SELECT 'Empty' AS 'Output'

END CATCH

OUTPUT:

	SELECT @ErrorParam
	SELECT @AdditionalParam1
	SELECT @AdditionalParam2

END
GO


