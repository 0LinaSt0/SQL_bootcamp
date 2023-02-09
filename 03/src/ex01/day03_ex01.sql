/*
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-except/
 *
 * <select...> EXCEPT <select...> - returns distinct rows from the first (left)
 * 								query that are not in the output of the second
 * 								(right) query.
 *
 *
 * Representation of set after EXCEPT two SELECTs using Euler diagram:
 *
 * 		   _____  _____
 * 		 /++++++/\      \
 * 		|++++++|  |      |
 * 		|++++++|  |      |
 * 		 \±±±±± \/ _____/
 */


select id as menu_id
from menu
except
select menu_id
from person_order
order by 1;
