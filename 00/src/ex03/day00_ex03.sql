/*
 * <select> DISTINCT - option for returning only unique values
 * <order by> DESC - option for sorting rows in descending order
 */

select distinct person_id
from person_visits
where visit_date
	between '2022-01-06' and '2022-01-09'
	or pizzeria_id = 2
order by person_id desc;
