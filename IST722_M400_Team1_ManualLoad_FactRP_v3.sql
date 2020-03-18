drop table [dbo].[FactRecommendationPlan];

create table FactRecommendationPlan(
	CustomerKey int not null,
	MovieKey int not null,
	PlanKey int not null,
	PlanID int null,
	MovieRuntime int null,
	YearsOld int null,
	PlanPrice money null,
	MonthsOpened int null,
	InsertAuditKey int null,
	UpdateAuditKey int null
);

alter table [dbo].[FactRecommendationPlan]
	add constraint [PK_dbo.FactRecommendationPlan]
		primary key ([CustomerKey], [MovieKey], [PlanKey]);

alter table [dbo].[FactRecommendationPlan]
	add constraint [FK_dbo_FactRecommendationPlan_MovieKey]
		foreign key (MovieKey)
		references DimMovie (MovieKey);

alter table [dbo].[FactRecommendationPlan]
	add constraint [FK_dbo_FactRecommendationPlan_CustomerKey]
		foreign key (CustomerKey)
		references DimCustomer (CustomerKey);

alter table [dbo].[FactRecommendationPlan]
	add constraint [FK_dbo_FactRecommendationPlan_PlanKey]
		foreign key (PlanKey)
		references DimPlan (PlanKey);

alter table [dbo].[FactRecommendationPlan]
	drop constraint [FK_dbo_FactRecommendationPlan_PlanKey];

alter table [dbo].[FactItemAnalysis]
	drop constraint [FK_dbo_FactItemAnalysis_PlanKey]

truncate table [dbo].[DimPlan];

select * from DimPlan;

alter table DimPlan
	alter column [RowIsCurrent] varchar(1) null;


insert into DimPlan(
	[PlanID],
	[PlanName],
	[PlanCurrent]
)
select 
	[plan_id] PlanID,
	[plan_name] PlanName,
	[plan_current] PlanCurrent
from [ist722_grblock_oa1_stage].[dbo].[stgPlan];


alter table [dbo].[FactRecommendationPlan]
	add constraint [FK_dbo_FactRecommendationPlan_PlanKey]
		foreign key (PlanKey)
			references DimPlan (PlanKey);
	
alter table [dbo].[FactItemAnalysis]
	add constraint [FK_dbo_FactItemAnalysis_PlanKey]
		foreign key (PlanKey)
			references DimPlan (PlanKey);

insert into [dbo].[FactRecommendationPlan](
	[CustomerKey],
	[MovieKey],
	[PlanKey],
	[PlanID],
	[MovieRuntime],
	[YearsOld],
	[PlanPrice],
	[MonthsOpened]
)
select distinct
	C.CustomerKey CustomerKey,
	M.MovieKey MovieKey,
	Pl.PlanID PlanID,
	Pl.PlanKey PlanKey,
	Stg.title_runtime MovieRuntime,
	DATEDIFF(year, stg.account_opened_on, getdate()) YearsOld,
	Stg.plan_price PlanPrice,
	DATEDIFF(month, stg.account_opened_on, GETDATE()) MonthsOpened
from 
	[ist722_grblock_oa1_stage].[dbo].[StgFactRecommendationPlan] Stg
	join [ist722_grblock_oa1_dw].[dbo].[DimCustomer] C
	on Stg.customer_id = C.CustomerID
	join [ist722_grblock_oa1_dw].[dbo].[DimMovie] M
	on Stg.title_id = M.MovieID
	join [ist722_grblock_oa1_dw].[dbo].[DimPlan] Pl
	on Stg.plan_id = Pl.PlanID

select * from FactRecommendationPlan;

/*
select a.CustomerKey, COUNT(a.CustomerKey) ct_custkey
from (
select distinct
	C.CustomerKey CustomerKey,
	M.MovieKey MovieKey,
	Pl.PlanID PlanID,
	Pl.PlanKey PlanKey,
	Stg.title_runtime MovieRuntime,
	DATEDIFF(year, stg.account_opened_on, getdate()) YearsOld,
	Stg.plan_price PlanPrice,
	DATEDIFF(month, stg.account_opened_on, GETDATE()) MonthsOpened
from 
	[ist722_grblock_oa1_stage].[dbo].[StgFactRecommendationPlan] Stg
	join [ist722_grblock_oa1_dw].[dbo].[DimCustomer] C
	on Stg.customer_id = C.CustomerID
	join [ist722_grblock_oa1_dw].[dbo].[DimMovie] M
	on Stg.title_id = M.MovieID
	join [ist722_grblock_oa1_dw].[dbo].[DimPlan] Pl
	on Stg.plan_id = Pl.PlanID) a
group by a.CustomerKey

select a.MovieKey, COUNT(a.MovieKey) ct_Moviekey
from (
select distinct
	C.CustomerKey CustomerKey,
	M.MovieKey MovieKey,
	Pl.PlanID PlanID,
	Pl.PlanKey PlanKey,
	Stg.title_runtime MovieRuntime,
	DATEDIFF(year, stg.account_opened_on, getdate()) YearsOld,
	Stg.plan_price PlanPrice,
	DATEDIFF(month, stg.account_opened_on, GETDATE()) MonthsOpened
from 
	[ist722_grblock_oa1_stage].[dbo].[StgFactRecommendationPlan] Stg
	join [ist722_grblock_oa1_dw].[dbo].[DimCustomer] C
	on Stg.customer_id = C.CustomerID
	join [ist722_grblock_oa1_dw].[dbo].[DimMovie] M
	on Stg.title_id = M.MovieID
	join [ist722_grblock_oa1_dw].[dbo].[DimPlan] Pl
	on Stg.plan_id = Pl.PlanID) a
group by a.MovieKey


select a.PlanKey, COUNT(a.PlanKey) ct_Plankey
from (
select distinct
	C.CustomerKey CustomerKey,
	M.MovieKey MovieKey,
	Pl.PlanID PlanID,
	Pl.PlanKey PlanKey,
	Stg.title_runtime MovieRuntime,
	DATEDIFF(year, stg.account_opened_on, getdate()) YearsOld,
	Stg.plan_price PlanPrice,
	DATEDIFF(month, stg.account_opened_on, GETDATE()) MonthsOpened
from 
	[ist722_grblock_oa1_stage].[dbo].[StgFactRecommendationPlan] Stg
	join [ist722_grblock_oa1_dw].[dbo].[DimCustomer] C
	on Stg.customer_id = C.CustomerID
	join [ist722_grblock_oa1_dw].[dbo].[DimMovie] M
	on Stg.title_id = M.MovieID
	join [ist722_grblock_oa1_dw].[dbo].[DimPlan] Pl
	on Stg.plan_id = Pl.PlanID) a
group by a.PlanKey

*/