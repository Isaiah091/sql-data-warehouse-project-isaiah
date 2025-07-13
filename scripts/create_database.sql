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



USE master;
GO

IF EXISTS (select 1 from sys.databases WHERE name = 'DataWarehouse') -- Check if the Data Warehouse exists. If true it will return 1
	BEGIN
	/*
	--SINGLE USER ensures that users already connected to the DB to not get disconnected when the Database is altered
	--When you run the ALTER DATABASE SET SINGLE_USER statement, it does not complete because the users are still connected to it.
	--WITH ROLLBACK IMMEDIATE: This option will rollback all the open transactions. It does not wait for the transaction to complete
	--WITH NO_WAIT: this will rollback the transactions only once they complete. If they do not complete, the ALTER DATABASE statements fails
	*/

		ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE; --Rollback any transactions before Altering the DB
		DROP DATABASE DataWarehouse;
	END;

GO

	--Create the DataWarehouse DB
	CREATE DATABASE DataWarehouse;
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
