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

with cte_visiters as (
	select visit_date
	from person_visits
	where person_id = 1 or person_id = 2
)
select d::date as missing_date
from
	generate_series('2022-01-01'::timestamp, '2022-01-10'::timestamp, '1 day'::interval) as d
	left join cte_visiters on d::date = visit_date
where cte_visiters.visit_date is null
order by 1
