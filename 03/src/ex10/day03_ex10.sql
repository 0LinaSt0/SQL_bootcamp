/*
 * Another solution:
 *
 * 		 _______________________________________________________________________
 * 		| insert into person_order(id, person_id, menu_id, person_order)		|
 * 		| 	values																|
 * 		| 		(																|
 * 		| 			(select (max(id) + 1) from person_order),					|
 * 		| 			(select id from person where name = 'Denis'),				|
 * 		| 			(select id from menu where pizza_name = 'sicilian pizza'),	|
 * 		| 			'2022-02-24'												|
 * 		| 		)																|
 * 		| insert into person_order(id, person_id, menu_id, person_order)		|
 * 		| 	values																|
 * 		| 		(																|
 * 		| 			(select (max(id) + 1) from person_order),					|
 * 		| 			(select id from person where name = 'Irina'),				|
 * 		| 			(select id from menu where pizza_name = 'sicilian pizza'),	|
 * 		| 			'2022-02-24'												|
 * 		| 		)																|
 * 		 -----------------------------------------------------------------------
 */


insert into person_order(id, person_id, menu_id, order_date)
	values
	(
		(select (max(id) + 1) from person_order),
		(select id from person where name = 'Denis'),
		(select id from menu where pizza_name = 'sicilian pizza'),
		'2022-02-24'
	),
	(
		(select (max(id) + 2) from person_order),
		(select id from person where name = 'Irina'),
		(select id from menu where pizza_name = 'sicilian pizza'),
		'2022-02-24'
	)
