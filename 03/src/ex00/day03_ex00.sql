select menu.pizza_name,
	menu.price,
	pizzeria.name as pizzeria_name,
	person_visits.visit_date
from person_visits
	join person on person.id = person_visits.person_id
		and person.name = 'Kate'
	join pizzeria on pizzeria.id = person_visits.pizzeria_id
	join menu on menu.pizzeria_id = pizzeria.id
		and menu.price between 800 and 1000
order by 1, 2, 3;
