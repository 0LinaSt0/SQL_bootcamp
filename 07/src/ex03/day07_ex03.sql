select pv.name,
	(coalesce(pv.count, 0) + coalesce(po.count, 0)) as total_count
from (
	select pizzeria.name,
		count(pizzeria.id) as count
	from person_order
		join menu on menu.id = person_order.menu_id
		join pizzeria on pizzeria.id = menu.pizzeria_id
	group by pizzeria.name, pizzeria.id
) as po
	right join (
		select pizzeria.name,
			count(pizzeria.id) as count
		from person_visits
			join pizzeria on pizzeria.id = person_visits.pizzeria_id
		group by pizzeria.name, pizzeria.id
	) as pv using(name)
order by 2 desc, 1 asc;