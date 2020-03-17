/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ProductKey]
      ,[ProductID]
      ,[ProductName]
      ,[ProductDepartment]
      ,[RowIsCurrent]
      ,[RowStartDate]
      ,[RowEndDate]
      ,[RowChangeReason]
  FROM [ist722_grblock_oa1_dw].[dbo].[DimProduct];

alter table [dbo].[DimProduct]
	alter column [RowStartDate] datetime  null;

alter table [dbo].[DimProduct]
	alter column [RowEndDate] datetime null;

alter table [dbo].[DimProduct]
	alter column [RowChangeReason] varchar(200) null;

alter table [dbo].[DimMovie]
	alter column [RowStartDate] datetime  null;

alter table [dbo].[DimMovie]
	alter column [RowEndDate] datetime null;

alter table [dbo].[DimMovie]
	alter column [RowChangeReason] varchar(200) null;

alter table [dbo].[DimPlan]
	alter column [RowStartDate] datetime  null;

alter table [dbo].[DimPlan]
	alter column [RowEndDate] datetime null;

alter table [dbo].[DimPlan]
	alter column [RowChangeReason] varchar(200) null;

alter table [dbo].[DimCustomer]
	alter column [RowStartDate] datetime  null;

alter table [dbo].[DimCustomer]
		alter column [RowEndDate] datetime null;

alter table [dbo].[DimCustomer]
	alter column [RowChangeReason] varchar(200) null;
	
