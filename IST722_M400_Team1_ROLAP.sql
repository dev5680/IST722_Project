/****** Object:  Database ist722_mojoyner_dw    Script Date: 3/1/2020 4:31:26 PM ******/
/*
Kimball Group, The Microsoft Data Warehouse Toolkit
Generate a database from the datamodel worksheet, version: 4

You can use this Excel workbook as a data modeling tool during the logical design phase of your project.
As discussed in the book, it is in some ways preferable to a real data modeling tool during the inital design.
We expect you to move away from this spreadsheet and into a real modeling tool during the physical design phase.
The authors provide this macro so that the spreadsheet isn't a dead-end. You can 'import' into your
data modeling tool by generating a database using this script, then reverse-engineering that database into
your tool.

Uncomment the next lines if you want to drop and create the database
*/
/*
DROP DATABASE UNKNOWN
GO
CREATE DATABASE UNKNOWN
GO
ALTER DATABASE UNKNOWN
SET RECOVERY SIMPLE
GO
*/
USE ist722_mojoyner_dw
;
IF EXISTS (SELECT Name from sys.extended_properties where Name = 'Description')
    EXEC sys.sp_dropextendedproperty @name = 'Description'
EXEC sys.sp_addextendedproperty @name = 'Description', @value = 'Default description - you should change this.'
;





/* Drop table dbo.DimDate */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimDate') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimDate 
;

/* Create table dbo.DimDate */
CREATE TABLE dbo.DimDate (
   [DateKey]  int   NOT NULL
,  [Date]  date   NULL
,  [FullDateUSA]  nchar(11)   NOT NULL
,  [DayOfWeek]  tinyint   NOT NULL
,  [DayName]  nchar(10)   NOT NULL
,  [DayOfMonth]  tinyint   NOT NULL
,  [DayOfYear]  smallint   NOT NULL
,  [WeekOfYear]  tinyint   NOT NULL
,  [MonthName]  nchar(10)   NOT NULL
,  [MonthOfYear]  tinyint   NOT NULL
,  [Quarter]  tinyint   NOT NULL
,  [QuarterName]  nchar(10)   NOT NULL
,  [Year]  smallint   NOT NULL
,  [IsWeekday]  bit  DEFAULT 0 NOT NULL
, CONSTRAINT [PK_dbo.DimDate] PRIMARY KEY CLUSTERED 
( [DateKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Date', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Date dimension contains one row for every day, may also be rows for "hasn''t happened yet."', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
;

INSERT INTO dbo.DimDate (DateKey, Date, FullDateUSA, DayOfWeek, DayName, DayOfMonth, DayOfYear, WeekOfYear, MonthName, MonthOfYear, Quarter, QuarterName, Year, IsWeekday)
VALUES (-1, '', 'Unk date', 0, 'Unk date', 0, 0, 0, 'Unk month', 0, 0, 'Unk qtr', 0, 0)
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FullDateUSA', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDateUSA'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayOfWeek', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayOfMonth', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WeekOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MonthName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MonthOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Quarter', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'QuarterName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'QuarterName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'IsWeekday', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsWeekday'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Full date as a SQL date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'String expression of the full date, eg MM/DD/YYYY', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDateUSA'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Number of the day of week; Sunday = 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Day name of week, eg Monday', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Number of the day in the month', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Number of the day in the year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Week of year, 1..53', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Month name, eg January', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Month of year, 1..12', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Calendar quarter, 1..4', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Quarter name eg. First', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'QuarterName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Calendar year, eg 2010', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is today a weekday', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsWeekday'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'20041123', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'38314', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'23-Nov-2004', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDateUSA'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1..7', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Sunday', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1..31', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1..365', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1..52 or 53', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'November', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, …, 12', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3, 4', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'November', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'QuarterName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2004', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 0', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsWeekday'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDateUSA'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'QuarterName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsWeekday'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDateUSA'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Calendar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Calendar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Calendar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Calendar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Calendar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'QuarterName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Calendar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsWeekday'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'In the form: yyyymmdd', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDateUSA'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'QuarterName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsWeekday'; 
;
--select * from DimDate;




/* Drop table dbo.DimCustomer */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimCustomer') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimCustomer 
;

/* Create table dbo.DimCustomer */
CREATE TABLE dbo.DimCustomer (
   [CustomerKey]  int IDENTITY  NOT NULL
,  [CustomerID]  int   NOT NULL
,  [CustomerEmail]  nvarchar(255)   NOT NULL
,  [CustomerFirstName]  nvarchar(255)   NOT NULL
,  [CustomerLastName]  nvarchar(255)   NOT NULL
,  [CustomerAddress]  nvarchar(255)   NULL
,  [CustomerCity]  nvarchar(255)   NULL
,  [CustomerState]  nvarchar(255)   NULL
,  [CustomerZip]  nvarchar(255)   NULL
,  [RowIsCurrent]  nchar(255)   NOT NULL
,  [RowStartDate]  datetime   NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NOT NULL
, CONSTRAINT [PK_dbo.DimCustomer] PRIMARY KEY CLUSTERED 
( [CustomerKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimCustomer', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'FM Customers', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
;

SET IDENTITY_INSERT dbo.DimCustomer ON
;
INSERT INTO dbo.DimCustomer (CustomerKey, CustomerID, CustomerEmail, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerCity, CustomerState, CustomerZip, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, -1, 'Unk Attribute1', 'Unk Attribute2', 'Unk Attribute3', 'Unk Attribute4', 'Unk Attribute5', 'Unk Attribute6', 'Unk Attribute7', 'Y', '12/31/1899', '12/31/9999', 'N/A')
;
SET IDENTITY_INSERT dbo.DimCustomer OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerEmail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerEmail'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerFirstName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFirstName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerLastName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLastName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerAddress', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerAddress'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerCity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerState', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerZip', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZip'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer email address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerEmail'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'First name of customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFirstName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Last name of customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLastName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer ship to address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerAddress'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer ship to city', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer ship to state', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer ship to zip', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZip'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'lkarforless@superrito.com', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerEmail'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Lisa', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFirstName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Karorless', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLastName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1555 W Lane Ave', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerAddress'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Seattle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'WA', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'43221', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZip'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerEmail'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFirstName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLastName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerAddress'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZip'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerEmail'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFirstName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLastName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerAddress'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZip'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerEmail'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLastName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerAddress'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZip'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerEmail'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLastName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerAddress'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZip'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_email', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerEmail'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_firstname', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_lastname', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLastName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerAddress'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_city', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_state', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_zip', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZip'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerEmail'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerLastName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerAddress'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerCity'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'char', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerState'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerZip'; 
;

--select * from DimCustomer;



/* Drop table dbo.DimProduct */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimProduct') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimProduct 
;

/* Create table dbo.DimProduct */
CREATE TABLE dbo.DimProduct (
   [ProductKey]  int IDENTITY  NOT NULL
,  [ProductID]  int   NOT NULL
,  [ProductName]  nvarchar(50)   NOT NULL
,  [ProductDepartment]  nvarchar(20)   NOT NULL
,  [RowIsCurrent]  nchar(1)   NOT NULL
,  [RowStartDate]  datetime   NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NOT NULL
, CONSTRAINT [PK_dbo.DimProduct] PRIMARY KEY CLUSTERED 
( [ProductKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimProduct
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Blank', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimProduct
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'FM Product', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimProduct
;

SET IDENTITY_INSERT dbo.DimProduct ON
;
INSERT INTO dbo.DimProduct ([ProductKey], ProductID, ProductName, ProductDepartment, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, -1, 'Unk Attribute1', 'Unk Attribute2', 'Y', '12/31/1899', '12/31/9999', 'N/A')
; --added brackets to ProductKey [ProductKey]
SET IDENTITY_INSERT dbo.DimProduct OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductDepartment', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDepartment'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Department category for product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDepartment'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDepartment'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDepartment'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDepartment'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDepartment'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'product_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'product_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'product_department', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDepartment'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDepartment'; 
;

--select * from DimProduct;



/* Drop table dbo.DimPlan */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimPlan') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimPlan 
;

/* Create table dbo.DimPlan */
CREATE TABLE dbo.DimPlan (
   [PlanKey]  int IDENTITY  NOT NULL
,  [PlanID]  int   NOT NULL
,  [PlanName]  nvarchar(50)   NOT NULL
,  [PlanCurrent]  tinyint   NOT NULL
,  [RowIsCurrent]  nchar(1)   NOT NULL
,  [RowStartDate]  datetime   NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NOT NULL
, CONSTRAINT [PK_dbo.DimPlan] PRIMARY KEY CLUSTERED 
( [PlanKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimPlan
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimPlan', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimPlan
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'FF subscription plan dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimPlan
;

SET IDENTITY_INSERT dbo.DimPlan ON
;
INSERT INTO dbo.DimPlan (PlanKey, PlanID, PlanName, PlanCurrent, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, -1, 'Unk Attribute1', 1, 'Y', '12/31/1899', '12/31/9999', 'N/A')
; --added '' to Unk Attribute2 'Unk Attribute2'
SET IDENTITY_INSERT dbo.DimPlan OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PlanKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PlanID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PlanName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PlanCurrent', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of subscription plan', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Flag to determine if plan is available to customers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Basic Rental', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 0', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgeflix_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgeflix_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgeflix_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ff_plans', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ff_plans', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ff_plans', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'plan_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'plan_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'plan_current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPlan', @level2type=N'COLUMN', @level2name=N'PlanCurrent'; 
;

--select * from DimPlan



/* Drop table dbo.DimMovie */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimMovie') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimMovie 
;

/* Create table dbo.DimMovie */
CREATE TABLE dbo.DimMovie (
   [MovieKey]  int IDENTITY  NOT NULL
,  [MovieID]  nvarchar(10)   NOT NULL
,  [MovieName]  nvarchar(50)   NOT NULL
,  [MovieRating]  nvarchar(50)   NOT NULL
,  [MovieGenre]  nvarchar(50)   NOT NULL
,  [MovieDirector] nvarchar(50)    NULL
,  [RowIsCurrent]  nchar(1)   NOT NULL
,  [RowStartDate]  datetime   NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NOT NULL
, CONSTRAINT [PK_dbo.DimMovie] PRIMARY KEY CLUSTERED 
( [MovieKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimMovie
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Dim_Movie', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimMovie
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'FF Movie Dimension - Titles + Genres', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimMovie
;

SET IDENTITY_INSERT dbo.DimMovie ON
;
INSERT INTO dbo.DimMovie (MovieKey, MovieID, MovieName, MovieRating, MovieGenre, MovieDirector, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason)
VALUES (-1, '-1', 'Unk Attribute1', 'Unk Attribute2', 'Unk Attribute3', 'Unk Attribute4', 'Y', '12/31/1899', '12/31/9999', 'N/A')
; --added '' to Unk Attribute4 'Unk Attribute4'
SET IDENTITY_INSERT dbo.DimMovie OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MovieKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MovieID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MovieName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MovieRating', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieRating'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MovieGenre', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieGenre'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MovieDirector', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieDirector'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Change Reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Unique identifier of film title', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Film name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'File rating', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieRating'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Film genre', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieGenre'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Director of film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieDirector'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Dark City', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'PG-13', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieRating'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Action & Adventure', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieGenre'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Jim Abrahams', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieDirector'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/24/2011', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieKey'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieRating'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieGenre'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieDirector'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD Type 2 Metadata', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgeflix_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgeflix_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgeflix_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieRating'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgeflix_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieGenre'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgeflix_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieDirector'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieRating'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieGenre'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieDirector'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ff_titles', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ff_titles', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ff_titles', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieRating'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ff_title_genres', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieGenre'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ff_people', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieDirector'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'title_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'title_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'title_rating', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieRating'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'tg_genre_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieGenre'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'people_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieDirector'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchat', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieRating'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieGenre'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimMovie', @level2type=N'COLUMN', @level2name=N'MovieDirector'; 
;

--select * from DimMovie;

--all dimensions successfully created

/* Drop table dbo.FactRecommendationPlan */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactRecommendationPlan') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactRecommendationPlan 
;

/* Create table dbo.FactRecommendationPlan */
CREATE TABLE dbo.FactRecommendationPlan (
   [CustomerKey]  int   NOT NULL
,  [MovieKey]   int  NULL
,  [ProductKey]  int   NOT NULL
,  [InsertAuditKey]  int  NOT NULL
,  [UpdateAuditKey]  int   NOT NULL
,  [PlanID]   int  NULL
,  [MovieAvgRating]  decimal (18,2)   NULL
,  [MovieRuntime]  int   NULL
,  [YearsOld]  int   NULL
,  [PlanPrice]  money   NULL
,  [MonthsOpened]  int   NULL
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactRecommendationPlan
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactRecommendationPlan', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactRecommendationPlan
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Plan and recommendation measures', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactRecommendationPlan
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MovieKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Dim2 Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Insert Audit Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Update Audit Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PlanID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'PlanID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MovieAvgRating', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieAvgRating'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MovieRuntime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieRuntime'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'YearsOld', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'YearsOld'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PlanPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MonthsOpened', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MonthsOpened'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimCustomer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimMovie', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimPriduct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row insertion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row update', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The natural key for the fact table, if any (eg order number)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'PlanID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Average customer rating for film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieAvgRating'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Title length in seconds', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieRuntime'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'CurrentYear - ReleaseYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'YearsOld'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Subscription plan price in $', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'derived value (current date - account_opened_on)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MonthsOpened'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'PlanID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'3.6', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieAvgRating'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'10860', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieRuntime'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'13', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'YearsOld'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'12.99', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'12, 8', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MonthsOpened'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exlcude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'PlanID'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieAvgRating'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieRuntime'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'YearsOld'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MonthsOpened'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimCustomer.CustomerKey ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimMovie.MovieKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimProduct.ProductKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgeflix_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieAvgRating'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgeflix_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieRuntime'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgeflix_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgeflix_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MonthsOpened'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieAvgRating'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieRuntime'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MonthsOpened'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ff_titles', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieAvgRating'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ff_titles', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieRuntime'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ff_plans', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ff_accounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MonthsOpened'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'title_avg_rating', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieAvgRating'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'title_runtime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieRuntime'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'plan_price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'decimal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieAvgRating'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MovieRuntime'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRecommendationPlan', @level2type=N'COLUMN', @level2name=N'MonthsOpened'; 
;





/* Drop table dbo.FactSalesFulfillment */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactSalesFulfillment') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactSalesFulfillment 
;

/* Create table dbo.FactSalesFulfillment */
CREATE TABLE dbo.FactSalesFulfillment (
   [CustomerKey]  int   NOT NULL
,  [ProductKey]  int   NOT NULL
,  [OrderDateKey]  int   NULL
,  [ShippedDatekey]  int   NULL
,  [InsertAuditKey]  int   NOT NULL
,  [UpdateAuditKey]  int   NOT NULL
,  [OrderID]  int   NULL
,  [SalesRevenue]  decimal(30,4)   NULL
,  [SalesProfit]  decimal(30,4)   NULL
,  [SalesQuantity]  float   NULL
,  [RetailPrice]  money   NULL
,  [WholeSalePrice]  money   NULL
,  [FillRate]  int   NULL
,  [ShippedVia]  varchar(20)   NULL
, CONSTRAINT [PK_dbo.FactSalesFulfillment] PRIMARY KEY NONCLUSTERED 
( [CustomerKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactSalesFulfillment
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactSalesFulfillment', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactSalesFulfillment
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Fact table to store measures across sales and order fulfillment', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactSalesFulfillment
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderDateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'OrderDateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ShippedDateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ShippedDatekey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Insert Audit Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Update Audit Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'OrderID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SalesRevenue', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesRevenue'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SalesProfit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesProfit'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SalesQuantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesQuantity'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RetailPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WholeSalePrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'WholeSalePrice'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FillRate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'FillRate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ShippedVia', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ShippedVia'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimCustomers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimProduct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimDate (for Orders)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'OrderDateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimDate (for Shipped)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ShippedDatekey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row insertion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row update', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The natural key for the fact table, if any (eg order number)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'OrderID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'RetailPrice * Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesRevenue'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'(RetailPrice - WholesalePrice) * Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesProfit'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Number of items of a product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesQuantity'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Retail price of a product in $', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Wholesale price of a product in $', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'WholeSalePrice'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'ShippedDate - OrderDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'FillRate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Company used to ship order (mini dimension)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ShippedVia'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3 ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'OrderDateKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3 ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ShippedDatekey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'35.96', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesRevenue'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'24', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesProfit'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'4', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesQuantity'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'8.99', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2.99', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'WholeSalePrice'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'FillRate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'JiffyEx', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ShippedVia'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'OrderDateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ShippedDatekey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'OrderID'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesRevenue'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesProfit'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesQuantity'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'WholeSalePrice'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'FillRate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ShippedVia'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimCustomer.CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimProduct.ProductKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimDate.DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'OrderDateKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimDate.DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ShippedDatekey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesRevenue'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesProfit'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesQuantity'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'WholeSalePrice'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'FillRate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ShippedVia'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesRevenue'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesProfit'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesQuantity'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'WholeSalePrice'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'FillRate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ShippedVia'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_order_details, fm_orders', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesRevenue'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_order_details, fm_orders', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesProfit'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_order_details', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesQuantity'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'WholeSalePrice'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_orders', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'FillRate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_shipvia_lookup', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ShippedVia'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'RetailPrice * Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesRevenue'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'(RetailPrice - WholesalePrice) * Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesProfit'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'order_qty', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesQuantity'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'product_retail_price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'product_wholesale_price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'WholeSalePrice'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'(shipped_date - order_date)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'FillRate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ship_via', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ShippedVia'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesRevenue'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesProfit'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'SalesQuantity'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'WholeSalePrice'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'FillRate'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar(20)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactSalesFulfillment', @level2type=N'COLUMN', @level2name=N'ShippedVia'; 
;





/* Drop table dbo.FactItemAnalysis */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactItemAnalysis') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactItemAnalysis 
;

/* Create table dbo.FactItemAnalysis */
CREATE TABLE dbo.FactItemAnalysis (
   [CustomerKey]  int   NOT NULL
,  [ProductKey]  int  NOT NULL
,  [PlanKey]  int  NOT NULL
,  [InsertAuditKey]  int   NOT NULL
,  [UpdateAuditKey]  int   NOT NULL
,  [ItemAnalysisKey]  int   NULL
,  [RetailPrice]  decimal   NULL
,  [PlanPrice]  decimal (3,2)   NULL
, CONSTRAINT [PK_dbo.FactItemAnalysis] PRIMARY KEY NONCLUSTERED 
( [CustomerKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactItemAnalysis
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactItemAnalysis', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactItemAnalysis
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Measures for products and plans across customers', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactItemAnalysis
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PlanKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'PlanKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Update Audit Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Insert Audit Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ItemAnalysisKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'ItemAnalysisKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RetailPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PlanPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimCustomer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimProduct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to DimSubscrptionPlan', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'PlanKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row update', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The natural key for the fact table, if any (eg order number)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'ItemAnalysisKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Retail price of a product in $', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Subscription plan price in $', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3 ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3 ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3 ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'PlanKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'8.99', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'12.99', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'PlanKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'ItemAnalysisKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts & rates', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimCustomer.CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimProduct.ProductKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimSubscriptionPlan.PlanKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'PlanKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgemart_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'fudgeflix_v3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'fm_products', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ff_plans', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'product_retail_price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'plan_price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'RetailPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactItemAnalysis', @level2type=N'COLUMN', @level2name=N'PlanPrice'; 
;
ALTER TABLE dbo.FactRecommendationPlan ADD CONSTRAINT
   FK_dbo_FactRecommendationPlan_CustomerKey FOREIGN KEY
   (
   CustomerKey
   ) REFERENCES DimCustomer
   ( CustomerKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactRecommendationPlan ADD CONSTRAINT
   FK_dbo_FactRecommendationPlan_ProductKey FOREIGN KEY
   (
   [ProductKey]
   ) REFERENCES DimProduct
   ( [ProductKey] )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;

ALTER TABLE dbo.FactRecommendationPlan ADD CONSTRAINT
   FK_dbo_FactRecommendationPlan_MovieKey FOREIGN KEY
   (
   MovieKey
   ) REFERENCES DimMovie
   ( MovieKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSalesFulfillment ADD CONSTRAINT
   FK_dbo_FactSalesFulfillment_CustomerKey FOREIGN KEY
   (
   CustomerKey
   ) REFERENCES DimCustomer
   ( CustomerKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSalesFulfillment ADD CONSTRAINT
   FK_dbo_FactSalesFulfillment_ProductKey FOREIGN KEY
   (
   ProductKey
   ) REFERENCES DimProduct
   ( ProductKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSalesFulfillment ADD CONSTRAINT
   FK_dbo_FactSalesFulfillment_OrderDateKey FOREIGN KEY
   (
   OrderDateKey
   ) REFERENCES DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactSalesFulfillment ADD CONSTRAINT
   FK_dbo_FactSalesFulfillment_ShippedDatekey FOREIGN KEY
   (
   ShippedDatekey
   ) REFERENCES DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
 
ALTER TABLE dbo.FactItemAnalysis ADD CONSTRAINT
   FK_dbo_FactItemAnalysis_CustomerKey FOREIGN KEY
   (
   CustomerKey
   ) REFERENCES DimCustomer
   ( CustomerKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactItemAnalysis ADD CONSTRAINT
   FK_dbo_FactItemAnalysis_ProductKey FOREIGN KEY
   (
   ProductKey
   ) REFERENCES DimProduct
   ( ProductKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactItemAnalysis ADD CONSTRAINT
   FK_dbo_FactItemAnalysis_PlanKey FOREIGN KEY
   (
   PlanKey
   ) REFERENCES DimPlan
   ( PlanKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 

