/*
 * https://postgrespro.ru/docs/postgresql/9.5/functions-srf
 *
 * generate_series(start, stop, step) - returns set which includes interval
 * 										[start; stop] with interval 'step'
 * overloads:
 * 	- generate_series(start, stop) - [int || bigint || numeric]
 * 	- generate_series(start, stop, step) - [int || bigint || numeric]
 * 	- generate_series(start, stop, step interval) - [timestamp || timestamp
 * 													with time zone]
 *
 *
 * In this case we used casting in generate_series for generating dates.
 * Created set includes date and time but we need to take just date that's
 * why there used casting '...::date'.
 */

select visit_date::date as missing_date
from generate_series('2022-01-01'::timestamp,
		'2022-01-10'::timestamp, '1 day'::interval)
		as visit_date
		left join (
			select * from person_visits where person_id = 1 or person_id = 2
		) as person_visits using(visit_date)
where person_visits.id is NULL
order by 1 asc;

