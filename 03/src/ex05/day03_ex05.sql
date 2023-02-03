select pizzeria.name as pizzeria_name
from person_visits
	join person on person.id = person_visits.person_id
		and person.name = 'Andrey'
	join pizzeria on pizzeria.id = person_visits.pizzeria_id
except
select pizzeria.name as pizzeria_name
from person_order
	join person on person.id = person_order.person_id
		and person.name = 'Andrey'
	join menu on menu.id = person_order.menu_id
	join pizzeria on pizzeria.id = menu.pizzeria_id
