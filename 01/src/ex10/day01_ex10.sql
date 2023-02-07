/*
 * It's possible to use 'NATURALE JOIN':
 *
 * 		 ____________________________________________________________________
 * 		| select name as person_name,										 |
 * 		| 	pizza_name as pizza_name,										 |
 * 		| 	pizzeria_name as pizzeria										 |
 * 		| from person_order													 |
 * 		| 	natural join person as prs(person_id, name, age, gender)		 |
 * 		| 	natural join menu as mn(menu_id, pizzeria_id, pizza_name, price) |
 * 		| 	natural join pizzeria as pzz(pizzeria_id, pizzeria_name, rating) |
 * 		| order by 1, 2, 3													 |
 * 		 --------------------------------------------------------------------
 */


select person.name as person_name,
	pizza_name,
	pizzeria.name as pizzeria
from person_order
	join person on person.id = person_order.person_id
	join menu on menu.id = person_order.menu_id
	join pizzeria on pizzeria.id = menu.pizzeria_id
order by 1, 2, 3 asc;
