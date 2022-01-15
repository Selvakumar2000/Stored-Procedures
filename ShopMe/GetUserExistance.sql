-- =======================================================
-- Author:		<Selvakumar Raman>
-- Create date: <17/11/2021>
-- Description:	<It is used to get the user existance>
-- =======================================================
DROP PROCEDURE IF EXISTS dbo.GetUserExistance
GO
CREATE PROCEDURE dbo.GetUserExistance
	
	@CurrentUserName varchar(100),
	@PhoneNumber varchar(20),
	@Email varchar(100)
AS
BEGIN

BEGIN TRY
	
	 ;WITH temp_users AS(SELECT * FROM dbo.AspNetUsers WHERE UserName<>@CurrentUserName) 
     SELECT 1 AS RecordExists FROM temp_users WHERE Email = @Email or PhoneNumber=@PhoneNumber;

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO