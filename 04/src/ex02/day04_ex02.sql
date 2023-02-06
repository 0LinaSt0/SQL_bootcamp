/*
 * https://www.geeksforgeeks.org/postgresql-create-recursive-views/
 *
 * Recursive Managing Views - can store recursive queries
 *
 * In this case - after calling 'v_generated_dates' - there will be
 * created table with dates from 2022-01-01 to 2022-01-31
 */


-- <UNCOMMENT LIENS 13 and 23 FOR start.sql SCRIPT>

-- drop view if exists v_generated_dates;

create recursive view v_generated_dates(generated_date) as (
	select '2022-01-01'::date as generated_date
	union all
	select (generated_date + interval '1' day)::date
	from v_generated_dates
	where generated_date < '2022-01-31'::date
);

-- select * from v_generated_dates;