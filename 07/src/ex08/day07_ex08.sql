select person.address,
	pizzeria.name,
	count(person_id) as count_of_orders
from person_order
	join person on person.id = person_order.person_id
	join menu on menu.id = person_order.menu_id
	join pizzeria on pizzeria.id = menu.pizzeria_id
group by pizzeria.name, person.address
order by 1, 2;
