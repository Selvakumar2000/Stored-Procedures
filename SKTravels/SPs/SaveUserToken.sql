-- ====================================================
-- Author:		<Selvakumar Raman>
-- Create date: <28/01/2022>
-- Description:	<It is used to fetch the fullname>
-- ====================================================
DROP PROCEDURE IF EXISTS dbo.SaveUserToken
GO
CREATE PROCEDURE dbo.SaveUserToken

	@Email VARCHAR(200),
	@Token VARCHAR(200)
AS
BEGIN
		DECLARE @FullName VARCHAR(100)
BEGIN TRY
	
		IF EXISTS(SELECT 'X' FROM dbo.Users WHERE Email=@Email)
		BEGIN
			UPDATE dbo.Users SET UniqueToken=@Token WHERE Email=@Email;
			SET @FullName=(SELECT FullName FROM dbo.Users WHERE Email = @Email);
			SELECT @FullName as 'FullName';
		END

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO