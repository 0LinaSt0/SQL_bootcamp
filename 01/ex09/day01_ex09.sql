/*
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-exists/
 *
 * <NOT> EXISTS (subquery) - if the subquery returns at least one row,
 * 							 the result of EXISTS is true.
 *
 *
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-in/
 *
 * <NOT> IN (list) - returns true if the value matches any value in
 * 					 the list (which could be subquery)
 */


-- EXISTS
select name
from pizzeria p
where not exists (
	select 1
	from person_visits pv
	where p.id = pv.pizzeria_id
);

-- IN
select name
from pizzeria
where id not in (
	select pizzeria_id
	from person_visits
);
