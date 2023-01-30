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


select prs.name as person_name,
	mn.pizza_name as pizza_name,
	pzz.name as pizzeria
from person_order
	join person as prs
		on person_order.person_id = prs.id
	join menu as mn
		on person_order.menu_id = mn.id
	join pizzeria as pzz
		on mn.pizzeria_id = pzz.id
order by 1, 2, 3
