select person.name,
	menu.pizza_name,
	menu.price,
	(
		menu.price - (menu.price * person_discounts.discount / 100)::bigint
	) as discount_price,
	pizzeria.name as pizzeria_name
from person_order
	join menu on menu.id = person_order.menu_id
	join person on person.id = person_order.person_id
	join person_discounts on person_discounts.person_id = person_order.person_id
	join pizzeria on pizzeria.id = menu.pizzeria_id
order by 1, 2;
