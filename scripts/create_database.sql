/*
================================================================
				  Create Database and Schemas
================================================================

Script Purpose:
	This scripts creates a new Databse named DataWarehouse after checking if it already exists.
	If the database does exist, it is dropped and recreated. Additionally, the script sets up three schemas within the database
	These schemas are: bronze, silver, and gold

**NOTE
This script will drop the entire DB if it exists
ALL data will be PERMENATLY deleted. Ensure you have proper backups before running this script

*/





IF EXISTS(select 1 from sys.databases where name = 'DataWarehouse')
	BEGIN
	USE master;

		ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE; --Rollback any transactions before Altering the DB
		DROP DATABASE DataWarehouse;

		CREATE DATABASE DataWarehouse;
	
	END
ELSE
	BEGIN
		CREATE DATABASE DataWarehouse;
		select name, 1 from sys.databases
	END
-------------------------------------- End of Creating Database--------------------------------
GO
--Create Schemas
	USE DataWarehouse;
	
	GO

	--Create Schemas

	CREATE SCHEMA bronze;
	GO

	CREATE SCHEMA silver;
	GO

	CREATE SCHEMA gold;
	GO
