(
select pizzeria.name as pizzeria_name
from person_visits
	join person on person.id = person_visits.person_id
		and person.gender = 'female'
	join pizzeria on pizzeria.id = person_visits.pizzeria_id
except all
select pizzeria.name as pizzeria_name
from person_visits
	join person on person.id = person_visits.person_id
		and person.gender = 'male'
	join pizzeria on pizzeria.id = person_visits.pizzeria_id
)
union all
(
select pizzeria.name as pizzeria_name
from person_visits
	join person on person.id = person_visits.person_id
		and person.gender = 'male'
	join pizzeria on pizzeria.id = person_visits.pizzeria_id
except all
select pizzeria.name as pizzeria_name
from person_visits
	join person on person.id = person_visits.person_id
		and person.gender = 'female'
	join pizzeria on pizzeria.id = person_visits.pizzeria_id
)
order by 1
