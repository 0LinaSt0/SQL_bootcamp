/*
 * Another desicion:
 *
 * 		 _______________________________________________________
 * 		| with cte_orders as (									|
 * 		| 	select m_id											|
 * 		| 	from (												|
 * 		| 		select (										|
 * 		| 			select name as person_name					|
 * 		| 			from person									|
 * 		| 			where id = person_order.person_id			|
 * 		| 			) as person_name,							|
 * 		| 			menu_id as m_id								|
 * 		| 		from person_order								|
 * 		| 	) as p_id											|
 * 		| 	where person_name = 'Denis' or person_name = 'Anna'	|
 * 		| )														|
 * 		| select pizzas.pizza_name,								|
 * 		| 	pizzeria.name as pizzeria_name						|
 * 		| from pizzeria											|
 * 		| 	join (												|
 * 		| 		select *										|
 * 		| 		from (											|
 * 		| 			select (									|
 * 		| 				select m_id								|
 * 		| 				from cte_orders							|
 * 		| 				where m_id = menu.id					|
 * 		| 				) as m_id,								|
 * 		| 				pizzeria_id,							|
 * 		| 				pizza_name								|
 * 		| 			from menu									|
 * 		| 		) as m											|
 * 		| 		where m_id is not null							|
 * 		| 	) as pizzas											|
 * 		| 	on pizzeria.id = pizzas.pizzeria_id					|
 * 		| order by 1, 2											|
 * 		 -------------------------------------------------------
 */


select pizza_name,
	pizzeria.name as pizzeria_name
from person_order
	join menu on menu.id = person_order.menu_id
	join pizzeria on pizzeria.id = menu.pizzeria_id
	join person on person.id = person_order.person_id
where person.name = 'Anna' or person.name = 'Denis'
order by 1, 2;

