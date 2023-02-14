/*
 * Apply change of day04
 */

\i /Users/msalena/Desktop/SQL_bootcamp/04/src/ex06/day04_ex06.sql
\i /Users/msalena/Desktop/SQL_bootcamp/04/src/ex07/day04_ex07.sql


/* For online db:

insert into person_visits (id, person_id, pizzeria_id, visit_date)
	values (
		(select (max(id) + 1) from person_visits),
		(select id from person where name = 'Dmitriy'),
		(
			select pizzeria.id
			from pizzeria
				join menu on menu.pizzeria_id = pizzeria.id
					and menu.price < 800
			where pizzeria.name != 'Papa Johns'
			limit 1
		),
		'2022-01-08'
);
 */

