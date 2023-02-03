(
select pizzeria.name
from person_order
	join menu on menu.id = person_order.menu_id
	join pizzeria on pizzeria.id = menu.pizzeria_id
	join person on person.id = person_order.person_id
		and person.gender = 'female'
except
select pizzeria.name
from person_order
	join menu on menu.id = person_order.menu_id
	join pizzeria on pizzeria.id = menu.pizzeria_id
	join person on person.id = person_order.person_id
		and person.gender = 'male'
)
union
(
select pizzeria.name
from person_order
	join menu on menu.id = person_order.menu_id
	join pizzeria on pizzeria.id = menu.pizzeria_id
	join person on person.id = person_order.person_id
		and person.gender = 'male'
except
select pizzeria.name
from person_order
	join menu on menu.id = person_order.menu_id
	join pizzeria on pizzeria.id = menu.pizzeria_id
	join person on person.id = person_order.person_id
		and person.gender = 'female'
)
order by 1
