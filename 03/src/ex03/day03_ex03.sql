select pizzeria.name as pizzeria_name
from pizzeria
	join (
		select pizzeria.name
		from pizzeria
			join person_visits on person_visits.pizzeria_id = pizzeria.id
			join person on person.id = person_visits.person_id
				and gender = 'female'
		except all
		select pizzeria.name
		from pizzeria
			join person_visits on person_visits.pizzeria_id = pizzeria.id
			join person on person.id = person_visits.person_id
				and gender = 'male'
	) as p1 using(name)
union all
select pizzeria.name as pizzeria_name
from pizzeria
	join (
		select pizzeria.name
		from pizzeria
			join person_visits on person_visits.pizzeria_id = pizzeria.id
			join person on person.id = person_visits.person_id
				and gender = 'male'
		except all
		select pizzeria.name
		from pizzeria
			join person_visits on person_visits.pizzeria_id = pizzeria.id
			join person on person.id = person_visits.person_id
				and gender = 'female'
	) as p2 using(name)
order by 1;
