select person.name
from person_order
	join person on person.id = person_order.person_id
		and person.age > 25 and person.gender = 'female'
order by 1;
