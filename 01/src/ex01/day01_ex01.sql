/*
 * <union> ALL - retain the duplicate rows
 *
 * For returning ordered names in first time:
 * 	a) Created table with:
 * 		- 'object_name' - column with all pizzas and persons
 * 		- 'type_name' - column with type flag
 * 	b) Ordering this table from 'type_name' for doing names in first
 * 	c) Take just 'object_name' from this table
 */

select object_name
from(
	select
		pizza_name as object_name,
		'm' as type_name
		from menu
	union all
	select
		name as object_name,
		'p' as type_name
		from person
	order by type_name desc, object_name
) as t_orderly

