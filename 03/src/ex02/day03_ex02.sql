/*
 * Another solution:
 *
 * 		 ___________________________________________________
 * 		| select menu.pizza_name,							|
 * 		| 	menu.price,										|
 * 		| 	pizzeria.name as pizzeria_name					|
 * 		| from menu											|
 * 		| 	join (											|
 * 		| 	  select id as menu_id							|
 * 		| 	  from menu										|
 * 		| 	  except										|
 * 		| 	  select menu_id								|
 * 		| 	  from person_order								|
 * 		| 	  order by 1									|
 * 		| 	) as forgotten									|
 * 		| 	on menu.id = forgotten.menu_id					|
 * 		| 	join pizzeria on pizzeria.id = menu.pizzeria_id	|
 * 		| order by 1, 2										|
 * 		 ---------------------------------------------------
 */


with cte_forgotten as (
	select id as menu_id
	from menu
	except
	select menu_id
	from person_order
	order by 1
)
select menu.pizza_name,
	menu.price,
	pizzeria.name as pizzeria_name
from cte_forgotten
	join menu on menu.id = cte_forgotten.menu_id
	join pizzeria on pizzeria.id = menu.pizzeria_id
order by 1, 2
