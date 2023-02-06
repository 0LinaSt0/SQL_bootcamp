select n_person as person_name,
	n_pizzeria as pizzeria_name
from (
	select (
			select name
			from person_name
			where id = person_visits.person_id
		) as n_person,
		(
			select name
			from pizzeria
			where id = person_visits.pizzeria_id
		) as n_pizzeria
	from person_visits
	where visit_date between '2022-01-07'
		and '2022-01-09'
) as pv
order by 1 asc, 2 desc;
