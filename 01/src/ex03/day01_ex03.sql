/*
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-intersect/
 *
 * <select...> INTERSECT <select...> - combine result sets of two or more
 * 								SELECT statements, returning a single result
 * 								set that has the rows appear in both result
 * 								sets.
 *
 *
 * Representation of set after INTERSECT two SELECTs using Euler diagram:
 *
 * 		   _____  _____
 * 		 /      /\      \
 * 		|      |++|      |
 * 		|      |++|      |
 * 		 \_____ \/ _____/
 */


select
	visit_date as action_date,
	person_id as person_id
	from person_visits
intersect
select
	order_date as action_date,
	person_id as person_id
	from person_order
order by 1 asc, 2 desc;
