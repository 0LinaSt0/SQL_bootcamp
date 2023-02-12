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