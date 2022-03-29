-- =============================================
-- Author:		<Selvakumar Raman>
-- Create date: <15/01/2022>
-- Description:	<User Registration>
-- =============================================
DROP PROCEDURE IF EXISTS dbo.Register
GO
CREATE PROCEDURE dbo.Register

	@FullName VARCHAR(100),
	@Email VARCHAR(100),
	@PasswordHash VARBINARY(1000),
	@PasswordSalt VARBINARY(1000),
    @IsEmailSent INT
AS
BEGIN

	DECLARE @UserID BIGINT

BEGIN TRY
	
	INSERT INTO dbo.Users(FullName,Email,PasswordHash,PasswordSalt,IsEmailSent)
	VALUES (@FullName,@Email,@PasswordHash,@PasswordSalt,@IsEmailSent);

	SET @UserID = SCOPE_IDENTITY();
	SELECT @UserID AS 'UserID';

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO


