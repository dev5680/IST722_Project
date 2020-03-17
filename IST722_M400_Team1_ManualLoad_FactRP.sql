if exists (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StgFactRecommendationPlan') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
	drop table StgFactRecommendationPlan;
/*
select
	fmc.customer_firstname,
	fmc.customer_lastname,
	fmc.customer_email,
	fmo.[customer_id],
	fmod.product_id,
	ffa.account_opened_on,
	ffp.plan_id,
	ffp.plan_price,
	fft.title_id,
	fft.title_name,
	fft.[title_avg_rating],
	fft.[title_runtime]
--into [dbo].[StgFactRecommendationPlan]
from  [fudgemart_v3].[dbo].[fm_customers] fmc
join [fudgemart_v3].[dbo].[fm_orders] fmo 
	on fmo.customer_id = fmc.customer_id
join [fudgemart_v3].[dbo].[fm_order_details] fmod 
	on fmod.order_id = fmo.order_id
join [fudgeflix_v3].[dbo].[ff_accounts] ffa
	on fmc.customer_email = ffa.account_email
join [fudgeflix_v3].[dbo].[ff_plans] ffp
	on ffp.[plan_id] = ffa.account_plan_id
join [fudgeflix_v3].[dbo].[ff_account_titles] ffat
	on ffat.at_account_id = ffa.account_id
join [fudgeflix_v3].[dbo].[ff_titles] fft
	on fft.[title_id] = ffat.[at_title_id];
--(9,325,206 rows affected) --
--(381619 rows affected)
*/
select count(*) from dbo.StgFactRecommendationPlan;
select top 500 * from dbo.StgFactRecommendationPlan;

select * from dbo.StgFactRecommendationPlan where title_id is null;

select DATEDIFF(year, account_opened_on, getdate())
from dbo.StgFactRecommendationPlan

select
	fmc.customer_firstname,
	fmc.customer_lastname,
	fmc.customer_email,
	fmc.[customer_id], -- <--- changed from fmo to fmc
	--fmod.product_id, <-- Doesn't look like we need this any more
	ffa.account_opened_on,
	ffp.plan_id,
	ffp.plan_price,
	fft.title_id,
	fft.title_name,
	fft.[title_avg_rating],
	fft.[title_runtime]
into [dbo].[StgFactRecommendationPlan]
from  [fudgemart_v3].[dbo].[fm_customers] fmc
join [fudgeflix_v3].[dbo].[ff_accounts] ffa
	on fmc.customer_email = ffa.account_email
join [fudgeflix_v3].[dbo].[ff_plans] ffp
	on ffp.[plan_id] = ffa.account_plan_id
join [fudgeflix_v3].[dbo].[ff_account_titles] ffat
	on ffat.at_account_id = ffa.account_id
join [fudgeflix_v3].[dbo].[ff_titles] fft
	on fft.[title_id] = ffat.[at_title_id]; --891