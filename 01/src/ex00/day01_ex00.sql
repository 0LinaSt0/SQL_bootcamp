/*
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-union/
 *
 * <select...> UNION <select...> - combines result sets of two or more
 * 								SELECT statements into a single result set
 *
 *
 * Representation of set after UNION two SELECTs using Euler diagram:
 *
 * 		  _______   _______
 * 		 /+++++++\ /+++++++\
 * 		|+++++++++++++++++++|
 * 		|+++++++++++++++++++|
 * 		 \±±±±±±±/ \±±±±±±±/
 *
 *
 * It's possible to use number of column instead of name in ORDER BY
 */

select
	id as object_id,
	pizza_name as object_name
	from menu
union
select
	id as object_id,
	name as object_name
	from person
order by 1, 2;
