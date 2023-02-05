/*
 * REFRESH MATERIALIZED VIEW - to load data into a materialized view if there are some 
 * 							   data changes in using tables in materialized view
 */

-- <UNCOMMENT LIENS 19 FOR start.sql SCRIPT>

-- create new Dmitriy's visit
insert into person_visits values (
	(select (max(id) + 1) from person_visits),
	(select id from person where name = 'Dmitriy'),
	(select id from pizzeria where name = 'Best Pizza'),
	'2022-01-08'
) ;

-- update mv_dmitriy_visits_and_eats
refresh materialized view mv_dmitriy_visits_and_eats;

-- select * from mv_dmitriy_visits_and_eats;