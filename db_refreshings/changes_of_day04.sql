/*
 * Apply change of day04
 */

\i /Users/msalena/Desktop/SQL_bootcamp/04/src/ex07/day04_ex07.sql






/* For online db:

	insert into person_visits values (
		(select (max(id) + 1) from person_visits),
		(select id from person where name = 'Dmitriy'),
		(select id from pizzeria where name = 'Best Pizza'),
		'2022-01-08'
	) ;
 */

