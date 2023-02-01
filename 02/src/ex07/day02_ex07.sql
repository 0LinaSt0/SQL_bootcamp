select pz.name
from person_visits pv
	join person pr on pr.id = pv.person_id
	join pizzeria pz on pz.id = pv.pizzeria_id
	join menu m on m.pizzeria_id = pz.id
where pr.name = 'Dmitriy' and
	pv.visit_date = '2022-01-08' AND
	m.price < 800
