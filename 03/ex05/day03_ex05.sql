select pizzeria.name as pizzeria_name
from person_visits 
	join pizzeria on pizzeria.id = person_visits.pizzeria_id
	join person on person.id = person_visits.person_id
		and person.name = 'Andrey'
except 
select pizzeria.name
from person_order
	join menu on menu.id = person_order.menu_id
	join pizzeria on pizzeria.id = menu.pizzeria_id
	join person on person.id = person_order.person_id
		and person.name = 'Andrey'
order by 1;

