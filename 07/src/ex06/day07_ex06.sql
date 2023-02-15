select pizzeria.name,
	count(menu.pizzeria_id) as count_of_order,
	trim_scale(round(avg(menu.price), 2)) as average_price,
	max(menu.price) as max_price,
	min(menu.price) as min_price
from person_order
	join menu on menu.id = person_order.menu_id
	join pizzeria on pizzeria.id = menu.pizzeria_id
group by pizzeria.name
order by 1;
