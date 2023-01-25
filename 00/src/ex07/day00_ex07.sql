/*
 * <order by> ASC - option for sorting rows in ascending order
 *
 * Possible to use CASE without <search-expression>
 */


select id, name,
		(case
			when age between 10 and 20 then
				'interval #1'
			when age > 20 and age < 24 then
				'interval #2'
			else
				'interval #3'
		end) as interval_info
	from person
	order by interval_info asc;
