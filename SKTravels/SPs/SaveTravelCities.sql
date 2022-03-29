-- =============================================
-- Author:		<Selvakumar Raman>
-- Create date: <27/03/2022>
-- Description:	<Save TravelCities>
-- =============================================
DROP PROCEDURE IF EXISTS dbo.SaveTravelCities
GO
CREATE PROCEDURE dbo.SaveTravelCities

	@UserID					BIGINT,
	@MainCityID				BIGINT,
	@VisitingCities			NVARCHAR(100),
	@AdditionalParam1		VARCHAR(10) = '' OUTPUT, 
	@ErrorParam				VARCHAR(100) = '' OUTPUT

AS
BEGIN

	DECLARE @VisitingCityIDTbl		TABLE(CityID BIGINT, Price NVARCHAR(50))
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

	SELECT @TravelDaysID=TravelDaysStagingID FROM dbo.TravelDaysStaging WHERE UserID = @UserID AND MaincityID = @MainCityID
	
	--reference  https://docs.microsoft.com/en-us/sql/t-sql/functions/string-split-transact-sql?view=sql-server-ver15
	INSERT INTO @VisitingCityIDTbl(CityID) 
	SELECT
		VALUE 
	FROM STRING_SPLIT(@VisitingCities,',');

	UPDATE @VisitingCityIDTbl SET A.Price=b.Price 
	FROM @VisitingCityIDTbl A 
	INNER JOIN dbo.MstVisitingCity B
	on A.CityID=B.VisitingcityID

	IF NOT EXISTS(SELECT 1 FROM @VisitingCityIDTbl)
	BEGIN
		SET @ErrorParam = 'Please Choose Cities'
	END

	IF @ErrorParam = NULL OR @ErrorParam = ''
	select 1
	BEGIN
	
		IF NOT EXISTS (SELECT 1 FROM dbo.VisitingCitiesStaging WHERE UserID=@UserID AND MainCityID=@MainCityID AND TravelDaysStagingID=@TravelDaysID)
		BEGIN
			INSERT INTO dbo.VisitingCitiesStaging(UserID,MaincityID,TravelDaysStagingID,VisitingCityID,VisitingCityprice)
			SELECT
				@UserID,
				@MainCityID,
				@TravelDaysID,
				A.CityID,
				A.Price
			FROM @VisitingCityIDTbl A			

			SELECT @AdditionalParam1=SUM(VisitingCityprice) 
			FROM dbo.VisitingCitiesStaging 
			WHERE UserID=@UserID AND MaincityID=@MainCityID

		END
		ELSE
		BEGIN

			DELETE FROM dbo.VisitingCitiesStaging WHERE UserID=@UserID AND MainCityID=@MainCityID AND TravelDaysStagingID=@TravelDaysID

			INSERT INTO dbo.VisitingCitiesStaging(UserID,MaincityID,TravelDaysStagingID,VisitingCityID,VisitingCityprice)
			SELECT
				@UserID,
				@MainCityID,
				@TravelDaysID,
				A.CityID,
				A.Price
			FROM @VisitingCityIDTbl A			

			SELECT @AdditionalParam1=SUM(VisitingCityprice) 
			FROM dbo.VisitingCitiesStaging 
			WHERE UserID=@UserID AND MaincityID=@MainCityID

		END
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