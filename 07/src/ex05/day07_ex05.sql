select distinct person.name
from person_order
	join person on person.id = person_order.person_id
order by 1;