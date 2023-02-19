/*
 * Decision without HAVING and WHERE:
 *
	select distinct person.name,
		c.count_of_visits
	from person_visits
		join person on person.id = person_visits.person_id
		join (
			select person_id,
				count(person_id) as count_of_visits
			from person_visits
			group by person_id
		) as c on person_visits.person_id = c.person_id
			and count_of_visits > 3
	order by 2 desc
*/


select person.name,
	count(person_visits.person_id) as count_of_visits
from person_visits
	join person on person.id = person_visits.person_id
group by person.name
having count(person_visits.person_id) > 3;
