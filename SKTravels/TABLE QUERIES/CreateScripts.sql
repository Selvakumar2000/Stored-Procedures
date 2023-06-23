--Create Table Queries For SK Travels Site--

-- Users Table --
DROP TABLE IF EXISTS dbo.Users
GO
CREATE TABLE dbo.Users
(
	UserID BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	FullName VARCHAR(200) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	PasswordHash VARBINARY(1000) NOT NULL,
	PasswordSalt VARBINARY(1000) NOT NULL,
	IsEmailSent INT NOT NULL
);

GO

ALTER TABLE dbo.Users ADD UniqueToken VARCHAR(200);
ALTER TABLE dbo.Users ADD UserState VARCHAR(100)
GO

-------------------------------------------------------------------------------------


-- MstMainCity Table --
DROP TABLE IF EXISTS dbo.MstMainCity
GO
CREATE TABLE dbo.MstMainCity
(
	MaincityID BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	CityName VARCHAR(100) NOT NULL,
	CreatedBy VARCHAR(200) NOT NULL,
	CreatedDate DATETIME NOT NULL
);

GO

--------------------------------------------------------------------------------------

-- MstVisitingCity Table --
DROP TABLE IF EXISTS dbo.MstVisitingCity
GO
CREATE TABLE dbo.MstVisitingCity
(
	VisitingcityID BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	CityName VARCHAR(100) NOT NULL,
	Price BIGINT,
	MaincityID BIGINT NOT NULL,
	CreatedBy VARCHAR(200) NOT NULL,
	CreatedDate DATETIME NOT NULL
);

GO

ALTER TABLE dbo.MstVisitingCity WITH CHECK ADD CONSTRAINT FK_MstVisitingCity_MainCity FOREIGN KEY(MaincityID)
REFERENCES dbo.MstMainCity (MaincityID);

GO

---------------------------------------------------------------------------------------


-- TravelDaysStaging Table --
DROP TABLE IF EXISTS dbo.TravelDaysStaging		
GO
CREATE TABLE dbo.TravelDaysStaging		
(
	TravelDaysStagingID BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	UserID BIGINT NOT NULL,
	MaincityID BIGINT NOT NULL,
	NumberOfDays INT NOT NULL,	
);

GO

ALTER TABLE dbo.TravelDaysStaging WITH CHECK ADD CONSTRAINT FK_TravelDaysStaging_UserID FOREIGN KEY(UserID)
REFERENCES dbo.Users(UserID);

GO 

ALTER TABLE dbo.TravelDaysStaging WITH CHECK ADD CONSTRAINT FK_TravelDaysStaging_MaincityID FOREIGN KEY(MaincityID)
REFERENCES dbo.MstMainCity(MaincityID);

GO

------------------------------------------------------------------------------------------------



-- VisitingCitiesStaging Table --
DROP TABLE IF EXISTS dbo.VisitingCitiesStaging		
GO
CREATE TABLE dbo.VisitingCitiesStaging		
(
	CityStagingID BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	UserID BIGINT NOT NULL,
	MaincityID BIGINT NOT NULL,
	TravelDaysStagingID BIGINT NOT NULL,
	VisitingCityID BIGINT NOT NULL,
	VisitingCityprice BIGINT NOT NULL,	
);

GO

ALTER TABLE dbo.VisitingCitiesStaging WITH CHECK ADD CONSTRAINT FK_VisitingCitiesStaging_UserID FOREIGN KEY(UserID)
REFERENCES dbo.Users(UserID);

GO 

ALTER TABLE dbo.VisitingCitiesStaging WITH CHECK ADD CONSTRAINT FK_VisitingCitiesStaging_MaincityID FOREIGN KEY(MaincityID)
REFERENCES dbo.MstMainCity(MaincityID);

GO

ALTER TABLE dbo.VisitingCitiesStaging WITH CHECK ADD CONSTRAINT FK_VisitingCitiesStaging_TravelDaysStagingID FOREIGN KEY(TravelDaysStagingID)
REFERENCES dbo.TravelDaysStaging(TravelDaysStagingID);

GO