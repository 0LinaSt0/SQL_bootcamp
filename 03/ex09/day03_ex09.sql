/*
 * Another solution:
 *
 * 		 ___________________________________________________________________
 * 		| insert into person_visits(id, person_id, pizzeria_id, visit_date)	|
 * 		| 	values															|
 * 		| 		(															|
 * 		| 			(select (max(id) + 1) from person_visits),				|
 * 		| 			(select id from person where name = 'Denis'),			|
 * 		| 			(select id from pizzeria where name = 'Dominos'),		|
 * 		| 			'2022-02-24'											|
 * 		| 		)															|
 * 		| insert into person_visits(id, person_id, pizzeria_id, visit_date)	|
 * 		| 	values															|
 * 		| 		(															|
 * 		| 			(select (max(id) + 1) from person_visits),				|
 * 		| 			(select id from person where name = 'Irina'),			|
 * 		| 			(select id from pizzeria where name = 'Dominos'),		|
 * 		| 			'2022-02-24'											|
 * 		| 		)															|
 * 		 -------------------------------------------------------------------
 */


insert into person_visits 
	values 
	(
		(select max(id) + 1 from person_visits),
		(select id from person where name = 'Denis'),
		(select id from pizzeria where name = 'Dominos'),
		'2022-02-24'
	),
	(
		(select max(id) + 2 from person_visits),
		(select id from person where name = 'Irina'),
		(select id from pizzeria where name = 'Dominos'),
		'2022-02-24'
	);


-- CHECK INSERTING
select * 
from person_visits 
where person_id = 4 and pizzeria_id = 2 
	and visit_date = '2022-02-24'
union all 
select * 
from person_visits 
where person_id = 6 and pizzeria_id = 2 
	and visit_date = '2022-02-24';
