/*
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-joins/
 *
 * <t1> JOIN (or INNER JOIN) <t2> ON <condition between colums t1 & t2>
 * 			- JOIN every row from 't1' with 't2' which value passes
 * 			  condition after ON
 *
 *
 * In this case JOIN 'order_data' from  'person_order' table if 'name(age)'
 * from 'person' table if 'person_id' the same in both tables
 *
 *
 * It's possible to use 'JOIN person USING(id)' which will compare 'id'
 * in table 'person' and in table 'person_order', but the problem is that
 * the 'id' in 'person_order' means orders id (not people id). In this
 * situation we could redefine name of 'person_order' variables as:
 * 		 _______________________________________________________________
 * 		| FROM															|
 * 		| 	person_order AS person_order(t_id, id, menu_id, order_date)	|
 * 		| JOING person USING(id)										|
 * 		 ---------------------------------------------------------------
 */

select order_date,
	(name || ' (age:' || age || ')') as person_information
from
	person_order
	join person
	on person_order.person_id = person.id
order by 1 asc, 2 asc
