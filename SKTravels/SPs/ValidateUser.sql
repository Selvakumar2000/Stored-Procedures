-- ====================================================
-- Author:		<Selvakumar Raman>
-- Create date: <28/01/2022>
-- Description:	<It is used to fetch the fullname>
-- ====================================================
DROP PROCEDURE IF EXISTS dbo.ValidateUser
GO
CREATE PROCEDURE dbo.ValidateUser

	@Email VARCHAR(200),
	@Token VARCHAR(200),
	@PasswordHash VARBINARY(1000),
	@PasswordSalt VARBINARY(1000)

AS
BEGIN
		DECLARE @checktoken VARCHAR(100)
BEGIN TRY
	
		IF EXISTS(SELECT 'X' FROM dbo.Users WHERE Email=@Email)
		BEGIN
			SET @checktoken=(SELECT UniqueToken FROM dbo.Users WHERE Email = @Email);
			IF @checktoken=@Token
			BEGIN
				UPDATE dbo.Users SET PasswordHash=@PasswordHash, PasswordSalt=@PasswordSalt WHERE Email=@Email;
				SELECT 1 as 'Out';
			END
			ELSE
			BEGIN
				SELECT 0 AS 'Out';
			END
		END

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO