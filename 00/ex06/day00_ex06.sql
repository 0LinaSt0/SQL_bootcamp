/*
 * <select> CASE - execute statements based on a certain condition
 *
 * Syntax:
 * 	CASE search-expression
 * 	WHEN expression_1 [, expression_2, ...] THEN
 * 		when-statements
 * 	[ ... ]
 * 	ELSE
 * 		else-statements
 * 	END
 *
 *
 * In this exercise:
 * 	a. in FROM we create output table with valid names and call it
 * 		"table_with_valid_names".
 * 	b. in SELECT we select all fields (*) from "table_with_valid_names"
 * 		and add new calculated column "check_name" if result from CASE
 */

select name,
	(case name
		when 'Denis' then
			'true'
		else
			'false'
		end
	) as check_name
from (
	select
	(select name from person
		where id = person_order.person_id
	) as Name
	from person_order
	where (menu_id=13 or menu_id=14 or menu_id=18)
		and order_date='2022-01-07'
) as od;
