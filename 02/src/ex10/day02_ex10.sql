/*
 * Another solution (find least and greates elem in two column):
 *
 * 		 ___________________________________________________________
 * 		| select distinct least(p1.name, p2.name) as person_name1,	|
 * 		| 	greatest(p2.name, p1.name) as person_name2,				|
 * 		| 	p1.address as common_address							|
 * 		| from person as p1											|
 * 		| 	join person as p2 on p2.address = p1.address			|
 * 		| where p1.name != p2.name									|
 * 		| order by 1, 2, 3											|
 * 		 -----------------------------------------------------------
 */

select pr1.name as person_name1,
	pr2.name as person_name2,
	pr1.address as common_address
from person as pr1
	join person as pr2 on pr2.address = pr1.address
		and pr2.id < pr1.id
order by 1, 2, 3;



