select person.name,
	menu.pizza_name,
	menu.price,
	trim_scale(menu.price - (menu.price * person_discounts.discount / 100))
		as discount_price,
	pizzeria.name as pizzeria_name
from person_order
	join person_discounts using(person_id)
	join person on person.id = person_order.person_id
	join menu on menu.id = person_order.menu_id
	join pizzeria on pizzeria.id = menu.pizzeria_id
order by 1, 2;
