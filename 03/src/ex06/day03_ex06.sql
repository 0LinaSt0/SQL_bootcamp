select m2.pizza_name,
	p1.name as pizzeria_name1,
	p2.name as pizzeria_name2,
	m2.price
from menu m1
	join menu m2 on m1.id > m2.id
		and m2.price = m1.price
		and m2.pizza_name = m1.pizza_name
	join pizzeria p1 on p1.id = m1.pizzeria_id
	join pizzeria p2 on p2.id = m2.pizzeria_id
		and p2.name != p1.name
order by 1;
