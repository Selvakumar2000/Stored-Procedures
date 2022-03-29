-- =======================================================
-- Author:		<Selvakumar Raman>
-- Create date: <15/01/2022>
-- Description:	<It is used to get the user existance>
-- =======================================================
DROP PROCEDURE IF EXISTS dbo.GetUserExistance
GO
CREATE PROCEDURE dbo.GetUserExistance
	
	@Email VARCHAR(200)
AS
BEGIN

BEGIN TRY
	
	 IF EXISTS(SELECT '1' FROM dbo.Users WHERE Email=@Email)
	 BEGIN
		SELECT 1 AS 'Out';
	 END
	 ELSE
	 BEGIN
		SELECT 0 AS 'Out';
	 END

END TRY

BEGIN CATCH
	SELECT 'ER-21','DB-ERROR'
END CATCH

END
GO