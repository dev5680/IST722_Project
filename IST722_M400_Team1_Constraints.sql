use [ist722_grblock_oa1_dw]
alter table [dbo].[FactRecommendationPlan]
	add MovieTitle varchar(255) null;

alter table [dbo].[FactRecommendationPlan]
	drop constraint [PK_dbo.FactRecommendationPlan];

alter table [dbo].[FactRecommendationPlan]
	add PlanKey int not null;

alter table [dbo].[FactRecommendationPlan]
	add constraint [PK_dbo.FactRecommendationPlan]
		primary key ([CustomerKey], [MovieKey], [ProductKey], [PlanKey]);

alter table [dbo].[FactRecommendationPlan]
	drop column MonthsOpened;

alter table [dbo].[FactRecommendationPlan]
	add [MonthsOpened] int null; 

alter table [dbo].[FactRecommendationPlan]
	add CustomerName varchar(255) null;

alter table [dbo].[FactRecommendationPlan]
	drop column CustomerName;

alter table [dbo].[FactRecommendationPlan]
	add CustomerFirstName varchar(255) null;

alter table [dbo].[FactRecommendationPlan]
	add CustomerLastName varchar(255) null;
------------------------------------------------------
alter table [dbo].[FactRecommendationPlan]
	drop constraint [PK_dbo.FactRecommendationPlan];

alter table [dbo].[FactRecommendationPlan]
	drop constraint [FK_dbo_FactRecommendationPlan_MovieKey]; 

alter table [FactRecommendationPlan]
	alter column MovieKey int not null;

alter table [dbo].[FactRecommendationPlan]
	add constraint [PK_dbo.FactRecommendationPlan]
		primary key ([CustomerKey], [MovieKey], [ProductKey], [PlanKey]);

alter table [dbo].[FactRecommendationPlan]
	add MovieID varchar(20) not null;

alter table [dbo].[DimMovie]
	drop constraint [PK_dbo.DimMovie];

alter table [dbo].[DimMovie]
	alter column [MovieID] varchar(20) null;

alter table [dbo].[DimMovie]
	add constraint [PK_dbo.DimMovie]
		primary key ([MovieKey]);

alter table [dbo].[FactRecommendationPlan]
	add constraint [FK_dbo_FactRecommendationPlan_MovieKey]
		foreign key (MovieKey)
		references DimMovie (MovieKey);