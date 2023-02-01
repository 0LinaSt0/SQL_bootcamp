/*
 * It's possible to do with CTE pattern:
 *
 * 		 _________________________________________________________________________
 * 		| with cte_pizzas as (														|
 * 		| 	select pizza_name, price,												|
 * 		| 	pizzeria_id as id														|
 * 		| 	from menu																|
 * 		| 	where pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza'	|
 * 		| )																			|
 * 		| select cte_pizzas.pizza_name as pizza_name,								|
 * 		| 	pizzeria.name as pizzeria_name,											|
 * 		| 	cte_pizzas.price as price												|
 * 		| from pizzeria																|
 * 		| 	join cte_pizzas using(id)												|
 * 		| order by 1, 2																|
 * 		 ---------------------------------------------------------------------------
 */


select menu.pizza_name as pizza_name,
	pizzeria.name as pizzeria_name,
	menu.price as price
from pizzeria
	join menu on pizzeria.id = menu.pizzeria_id
where menu.pizza_name = 'mushroom pizza' or menu.pizza_name = 'pepperoni pizza'
order by 1, 2
