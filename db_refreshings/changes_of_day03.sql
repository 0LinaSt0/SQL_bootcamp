/*
 * Apply all changes of day03
 */

\i /Users/msalena/Desktop/SQL_bootcamp/03/src/ex07/day03_ex07.sql
\i /Users/msalena/Desktop/SQL_bootcamp/03/src/ex08/day03_ex08.sql
\i /Users/msalena/Desktop/SQL_bootcamp/03/src/ex09/day03_ex09.sql
\i /Users/msalena/Desktop/SQL_bootcamp/03/src/ex10/day03_ex10.sql
\i /Users/msalena/Desktop/SQL_bootcamp/03/src/ex11/day03_ex11.sql
\i /Users/msalena/Desktop/SQL_bootcamp/03/src/ex12/day03_ex12.sql
\i /Users/msalena/Desktop/SQL_bootcamp/03/src/ex13/day03_ex13.sql




/* For online db:
	insert into menu values (19, 2, 'greek pizza', 800);

	insert into menu values (
		(select max(id) + 1 from menu),
		(select id from pizzeria where name = 'Dominos'),
		'sicilian pizza',
		900
	);

	insert into person_visits (id, person_id, pizzeria_id, visit_date)
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

	insert into person_order (id, person_id, menu_id, order_date)
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
			);

	update menu
	set price = (price - price*0.1)::bigint
	where pizza_name = 'greek pizza';

	insert into person_order
		select gs.i + (select max(id) from person_order) as id,
			person.id as person_id,
			(select menu.id from menu where pizza_name = 'greek pizza'),
			'2022-02-25' as order_date
		from person
			join (
			select generate_series(1, (select count(id) from person)) as i
			) as gs on gs.i = person.id ;

	delete from person_order
	where order_date = '2022-02-25';

	delete from menu
	where pizza_name = 'greek pizza';

*/
