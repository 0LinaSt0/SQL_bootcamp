select person.name,
	count(person_visits.visit_date) as count_of_visits
from person_visits
	join person on person.id = person_visits.person_id
group by person.name
order by 2 desc, 1 asc
limit 4;
