select name as person_name,
		pizzeria as pizzeria_name
	from (
		select
			(select name from person
				where id = person_visits.person_id
			) as name,
			(select name from pizzeria
				where id = person_visits.pizzeria_id
			) as pizzeria
		from person_visits
		where visit_date between '2022-01-07' and '2022-01-09'
	) pv
	order by person_name ASC, pizzeria_name DESC
