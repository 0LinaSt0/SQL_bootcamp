/*
 * https://www.postgresqltutorial.com/postgresql-views/postgresql-materialized-views/
 * https://www.geeksforgeeks.org/differences-between-views-and-materialized-views-in-sql/
 *
 * Managing Materialized Views - cache the result of a complex and expensive query and allow
 *								 you to refresh this result periodically. The results of a
 *								 view expression are stored in a database system
 */

-- <UNCOMMENT LIENS 12 and 24 FOR start.sql SCRIPT>

-- drop materialized view if exists mv_dmitriy_visits_and_eats;

create materialized view mv_dmitriy_visits_and_eats as (
	select pizzeria.name
	from person_visits
		join person on person.id = person_visits.person_id
			and person.name = 'Dmitriy'
		join pizzeria on pizzeria.id = person_visits.pizzeria_id
		join menu on menu.pizzeria_id = pizzeria.id
			and menu.price < 800
	where visit_date = '2022-01-08'
);

-- select * from mv_dmitriy_visits_and_eats;
