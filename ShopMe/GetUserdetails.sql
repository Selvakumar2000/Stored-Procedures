-- ====================================================
-- Author:		<Selvakumar Raman>
-- Create date: <23/11/2021>
-- Description:	<It is used to fetch the user details>
-- ====================================================
DROP PROCEDURE IF EXISTS dbo.GetUserdetails
GO
CREATE PROCEDURE dbo.GetUserdetails

	@UserName VARCHAR(100)
AS
BEGIN

BEGIN TRY
	
	SELECT Fullname,Email,PhoneNumber,City,State,Country,PhotoUrl 
	FROM dbo.AspNetUsers WHERE UserName = @Username;

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO