/*
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-left-join/
 *
 * LEFT <outer> JOIN - starts selecting data from the left table. For each row
 * 					   in the left table, it compares the column's values of
 * 					   left table with column's values of right values (look
 * 					   at statement after ON)
 *
 *
 * Representation of set after LEFT JOIN using Euler diagram:
 *
 * 		   _____  _____
 * 		 /+++++++\      \
 * 		|+++++++++|      |
 * 		|+++++++++|      |
 * 		 \±±±±±±±/ -----/
 *
 *
 * In this case we created the set which includes pizzerias' names with
 * their rating for every row in 'person_visits' table. Despite, nobody
 * visited "DoDoPizza", it's anyway in our created set but it has
 * NULL in pizzeria_id column. That's why we can add condition WHERE
 * and our set will include just pizzerias where were nobody - just
 * "DoDoPizza".
 */


select name, rating
from pizzeria
	left join person_visits on pizzeria.id = person_visits.pizzeria_id
where person_visits.id is null;
