/*
***Updates to StgMovies to Re-load DimMovie***
select * from StgMovies;
alter table StgMovies
	add director_name varchar(255) null;

update StgMovies
set director_name = ffp.people_name
from [fudgeflix_v3].[dbo].[ff_people] ffp 
join StgMovies on [dbo].[StgMovies].[director_people_id] = ffp.people_id

alter table stgMovies
	add AvgRating decimal(18,2) null;


alter table [ist722_grblock_oa1_stage].[dbo].[StgMovies]
	alter column title_id
		 VARCHAR(20) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL;

update StgMovies
set AvgRating = fft.title_avg_rating
from [fudgeflix_v3].[dbo].ff_titles fft
join StgMovies on [dbo].[StgMovies].[title_id] = fft.title_id

*/

truncate table [dbo].[FactRecommendationPlan];
select * from FactRecommendationPlan;

alter table [dbo].[FactRecommendationPlan]
	drop constraint [PK_dbo.FactRecommendationPlan];

alter table [dbo].[FactRecommendationPlan]
	drop constraint [FK_dbo_FactRecommendationPlan_ProductKey]; 

alter table [dbo].[FactRecommendationPlan]
	drop column ProductKey;

alter table [dbo].[FactRecommendationPlan]
	add constraint [PK_dbo.FactRecommendationPlan]
		primary key ([CustomerKey], [MovieKey], [PlanKey]);

alter table [ist722_grblock_oa1_stage].[dbo].[StgFactRecommendationPlan]
	alter column [title_id]
		 VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL;

alter table [ist722_grblock_oa1_dw].[dbo].[DimMovie]
	alter column MovieID
		 VARCHAR(20) COLLATE Latin1_General_CI_AS NOT NULL;

alter table [dbo].[FactRecommendationPlan]
	drop constraint [FK_dbo_FactRecommendationPlan_MovieKey];

truncate table DimMovie;

select * from DimMovie;

alter table DimMovie
	alter column RowIsCurrent char(1) null;

alter table [dbo].[FactRecommendationPlan]
	add constraint [FK_dbo_FactRecommendationPlan_MovieKey]
		foreign key (MovieKey)
		references DimMovie (MovieKey);

alter table DimMovie
	add AvgRating decimal(18,2) null;

alter table DimMovie
	alter column MovieDirector varchar(255) not null;
--Reload DimMovie
insert into [dbo].[DimMovie](
	MovieID,
	MovieName,
	MovieRating,
	MovieGenre,
	MovieDirector,
	AvgRating
)
select 
	title_id MovieID,
	title_name MovieName,
	title_rating MovieRating,
	tg_genre_name MovieGenre,
	people_name MovieDirector,
	AvgRating AvgRating
from [ist722_grblock_oa1_stage].[dbo].[StgMovies]; --(27829 rows affected)

alter table [dbo].[FactRecommendationPlan]
 add AvgRating decimal (18,2) null;

alter table [dbo].[FactRecommendationPlan]
	drop column MovieTitle;

alter table [dbo].[FactRecommendationPlan]
	drop column CustomerFirstName;

alter table [dbo].[FactRecommendationPlan]
	drop column CustomerLastName;

alter table [dbo].[FactRecommendationPlan]
	drop column MovieID;

alter table [dbo].[FactRecommendationPlan]
	drop column MovieAvgRating;

alter table [dbo].[FactRecommendationPlan]
	drop column AvgRating;

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


/*
What's up with dim movie

select stg.title_name, m.MovieName, m.MovieKey, m.MovieID, stg.title_id
from [ist722_grblock_oa1_dw].[dbo].[DimMovie] M
join [ist722_grblock_oa1_stage].[dbo].[StgFactRecommendationPlan] Stg
on m.MovieID = Stg.title_id
where MovieKey < '7185';

select title_name, count(title_name) ct_title
from [ist722_grblock_oa1_stage].[dbo].[StgFactRecommendationPlan]
group by title_name
order by ct_title
*/
