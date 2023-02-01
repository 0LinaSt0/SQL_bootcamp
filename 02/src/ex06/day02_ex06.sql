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


select m.pizza_name,
	pz.name as pizzeria_name
from person_order as po
	join person as pr on po.person_id = pr.id
	join menu as m on po.menu_id = m.id
    join pizzeria as pz on m.pizzeria_id = pz.id
where pr.name = 'Denis' or pr.name = 'Anna'
order by 1, 2

