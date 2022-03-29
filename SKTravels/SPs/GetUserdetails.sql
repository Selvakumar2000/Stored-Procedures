-- ====================================================
-- Author:		<Selvakumar Raman>
-- Create date: <15/01/2022>
-- Description:	<It is used to fetch the user details>
-- ====================================================
DROP PROCEDURE IF EXISTS dbo.GetUserDetails
GO
CREATE PROCEDURE dbo.GetUserdetails

	@Email VARCHAR(200)
AS
BEGIN

BEGIN TRY
	
		SELECT UserID,Email,FullName,PasswordHash,PasswordSalt FROM dbo.Users WHERE Email = @Email;

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO