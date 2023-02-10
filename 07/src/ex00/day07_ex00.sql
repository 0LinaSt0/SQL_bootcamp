select person.id as person_id,
	count(person_visits.person_id) as count_of_visits
from person
	join person_visits on person_visits.person_id = person.id
group by person.id, person_visits.person_id
order by 2 desc, 1 asc;
