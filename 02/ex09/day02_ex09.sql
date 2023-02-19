/*
 * Desition with using Grop by (checks if person - ordered some of the pizza - is
 * twice in the set (cliets) then person should be in the final set):
 *
 * 		 ___________________________________________________________________________
 * 		| select name																|
 * 		| from (																	|
 * 		| 	select name, count(name) as names_count									|
 * 		| 	from (																	|
 * 		| 		select person.name, menu.pizza_name									|
 * 		| 			from person_order												|
 * 		| 					join person on person.id = person_order.person_id		|
 * 		| 					join menu on menu.id = person_order.menu_id				|
 * 		| 			where person.gender = 'female' and								|
 * 		| 					menu.pizza_name in ('pepperoni pizza', 'cheese pizza')	|
 * 		| 		) as clients														|
 * 		| 		group by name														|
 * 		| 	) as names																|
 * 		| where names_count > 1														|
 * 		| order by 1																|
 * 		 ---------------------------------------------------------------------------
 */


select person.name as person_name
from person_order
	join person on person.id = person_order.person_id
		and person.gender = 'female'
	join menu on menu.id = person_order.menu_id
		and menu.pizza_name = 'pepperoni pizza'
intersect
select person.name as person_name
from person_order
	join person on person.id = person_order.person_id
		and person.gender = 'female'
	join menu on menu.id = person_order.menu_id
		and menu.pizza_name = 'cheese pizza'
order by 1;
