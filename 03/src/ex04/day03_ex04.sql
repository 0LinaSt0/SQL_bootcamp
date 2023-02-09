/*
	select pizzeria.name as pizzeria_name
	from pizzeria
		join (
			select pizzeria.name
			from pizzeria
				join menu on menu.pizzeria_id = pizzeria.id
				join person_order on person_order.menu_id = menu.id
				join person on person.id = person_order.person_id
					and gender = 'female'
			except
			select pizzeria.name
			from pizzeria
				join menu on menu.pizzeria_id = pizzeria.id
				join person_order on person_order.menu_id = menu.id
				join person on person.id = person_order.person_id
					and gender = 'male'
		) as p1 using(name)
	union
	select pizzeria.name as pizzeria_name
	from pizzeria
		join (
			select pizzeria.name
			from pizzeria
				join menu on menu.pizzeria_id = pizzeria.id
				join person_order on person_order.menu_id = menu.id
				join person on person.id = person_order.person_id
					and gender = 'male'
			except
			select pizzeria.name
			from pizzeria
				join menu on menu.pizzeria_id = pizzeria.id
				join person_order on person_order.menu_id = menu.id
				join person on person.id = person_order.person_id
					and gender = 'female'
		) as p2 using(name)
	order by 1;
*/


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
order by 1;
