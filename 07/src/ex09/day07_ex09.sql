/*
 * Decision without CASE statment:
	select *,
		formula > average as comparison
	from (
		select address,
			round((max(age)::numeric - min(age)::numeric / max(age)::numeric), 2) as formula,
			round(avg(age), 2) as average
		from person
		group by address
		order by 1
	) as calculations;
 */


select *,
	(case
			when formula > average  then 'true'
			else 'false'
		end
	) as comparision
from(
	select address,
		trim_scale(round((max(age)::numeric - min(age)::numeric/max(age)::numeric), 2)) as formula,
		trim_scale(round(avg(age), 2)) as average
	from person
	group by address
) as adr
order by 1;
