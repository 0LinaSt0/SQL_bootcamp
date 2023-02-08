/*
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-full-outer-join/
 *
 * FULL <outer> JOIN - combines the results of both the left join and the right join.
 * 					   If the rows in the joined table do not match, the FULL JOIN
 * 					   sets NULL values for every column of the table that does not
 * 					   have the matching row.
 *
 *
 * Representation of set after FULL JOIN using Euler diagram:
 *
 * 		   _____  _____
 * 		 /++++++\/++++++\
 * 		|++++++++++++++++|
 * 		|++++++++++++++++|
 * 		 \±±±±±±/\±±±±±±/
 *
 *
 *
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-coalesce/
 *
 * COALESCE(argument_1, argument_2, …) - function evaluates arguments from left to right
 * 										  until it finds the first non-null argument. If
 *										  all arguments are null, the function returns null
 */

select coalesce(person.name, '-') as person_name,
		visit_date,
		coalesce(pizzeria.name, '-') as pizzeria_name
from person
		full join (
			select *
			from person_visits
			where visit_date between '2022-01-01' and '2022-01-03'
		) as person_visits on person_visits.person_id = person.id
		full join pizzeria on pizzeria.id = person_visits.pizzeria_id
order by 1, 2, 3;
