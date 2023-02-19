select person.name
from person_order
	join person on person.id = person_order.person_id
		and person.gender = 'male'
		and person.address in ('Moscow', 'Samara')
	join menu on menu.id = person_order.menu_id
		and menu.pizza_name in ('pepperoni pizza', 'mushroom pizza')
order by 1 desc;
