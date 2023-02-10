(
	select distinct pizzeria.name,
		count(pizzeria.id) over (
			partition by pizzeria.id
		) as count,
		'order' as action_type
	from person_order
		join menu on menu.id = person_order.menu_id
		join pizzeria on pizzeria.id = menu.pizzeria_id
	group by pizzeria.name
	order by count
	limit 3
)
union
(
	select distinct pizzeria.name,
		count(pizzeria.id) over (
			partition by pizzeria.id
		) as count,
		'visit' as action_type
	from person_visits
		join pizzeria on pizzeria.id = person_visits.pizzeria_id
	group by pizzeria.name
	order by count
	limit 3
)
order by 3 asc, 2 desc
