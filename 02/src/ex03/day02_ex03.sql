/*
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-cte/
 *
 * CTE(common table expressions) - temporary result set which you can reference within
 * 								   another SQL statement including SELECT, INSERT, UPDATE
 * 								   or DELETE
 *
 * 		 ___________________________________
 * 		| WITH cte_name (column_list) AS (	|
 * 		| 	CTE_query_definition			|
 * 		| )									|
 * 		| statement;						|
 * 		 -----------------------------------
 */

 
with cte_day_generator as (
	select generate_series('2022-01-01'::timestamp,
		'2022-01-10'::timestamp, '1 day'::interval)
	as visit_date
)

select visit_date::date as missing_date
from cte_day_generator
		left join (
			select * from person_visits where person_id = 1 or person_id = 2
		) as person_visits using(visit_date)
where person_visits.id is NULL
order by 1 asc;

