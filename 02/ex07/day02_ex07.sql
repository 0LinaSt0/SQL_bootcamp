select pizzeria.name as pizzeria_name
from person_visits
	join pizzeria on pizzeria.id = person_visits.pizzeria_id
	join menu on menu.pizzeria_id = person_visits.pizzeria_id
		and menu.price < 800
	join person on person.id = person_visits.person_id
		and person.name = 'Dmitriy'
where person_visits.visit_date = '2022-01-08';
