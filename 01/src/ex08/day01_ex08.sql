/*
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-natural-join/
 *
 * 't1' NATURAL [INNER, LEFT, RIGHT] JOIN 't2' (default INNER JOING)
 * 			- implicit join based on the same column names in the joined
 *			  tables
 *
 * In this case 'NATURAL <inner> JOIN' joins tables from column with same
 * name. But in this case 'id' in table 'person_order' keeping information
 * about order id (not about person id) - that's wrong way.
 * That's why we redefine names of columns in 'person_order'. And now 'id'
 * column is column with person id
 */


select order_date,
	(name || ' (age:' || age || ')') as person_information
from
	person_order as person_order(t_id, id, menu_id, order_date)
	natural join person
order by 1 asc, 2 asc
