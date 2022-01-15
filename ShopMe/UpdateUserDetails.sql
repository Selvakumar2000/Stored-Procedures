-- ==================================================
-- Author:		<Selvakumar Raman>
-- Create date: <09/11/2021>
-- Description:	<It is used to update user details>
-- ===================================================
DROP PROCEDURE IF EXISTS dbo.UpdateUserDetails
GO
CREATE PROCEDURE dbo.UpdateUserDetails

	@UserId INT,
	@Fullname VARCHAR(100),
	@Email VARCHAR(100),
	@PhoneNumber VARCHAR(50),
	@City VARCHAR(100),
	@State VARCHAR(100),
	@Country VARCHAR(100),
	@PhotoUrl VARCHAR(100) = Null,
	@PublicId VARCHAR(100) = Null
AS
BEGIN

BEGIN TRY
	
	UPDATE dbo.AspNetUsers SET Fullname=@Fullname, Email=@Email, PhoneNumber=@PhoneNumber,
	City=@City, State=@State, Country=@Country, PhotoUrl=@PhotoUrl, PublicId=@PublicId WHERE Id = @UserId;

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO