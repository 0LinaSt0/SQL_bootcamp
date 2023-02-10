/*
 * https://www.geeksforgeeks.org/postgresql-create-recursive-views/
 *
 * Recursive Managing Views - can store recursive queries
 *
 * In this case - after calling 'v_generated_dates' - there will be
 * created table with dates from 2022-01-01 to 2022-01-31
 *
 *
 * Another solution with recurtion generator:

	create recursive view v_generated_dates(generated_date) as (
		select '2022-01-01'::date as generated_date
		union all
		select (generated_date + interval '1' day)::date
		from v_generated_dates
		where generated_date < '2022-01-31'::date
	);
 */


-- drop view if exists v_generated_dates;

create view v_generated_dates as (
	select generate_series('2022-01-01', '2022-01-31', '1 day'::interval)::date
		as generated_date
	order by 1
);


-- CHECK CREATING
select * from v_generated_dates;
