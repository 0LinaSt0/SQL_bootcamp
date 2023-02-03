select menu.pizza_name,
	menu.price,
	pizzeria.name as pizzeria_name,
	pv.visit_date
from person_visits pv
	join person on person.id = pv.person_id
		and person.name = 'Kate'
	join pizzeria on pizzeria.id = pv.pizzeria_id
	join menu on menu.pizzeria_id = pizzeria.id
		and price between 800 and 1000
order by 1, 2, 3
