select person.id as person_id,
	count(person_visits.person_id) as count_of_visits
from person_visits
	join person on person.id = person_visits.person_id
group by person.id
order by 2 desc, 1 asc;

