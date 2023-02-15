select p_v.name,
	(coalesce(count_pv, 0) + coalesce(count_po, 0)) as total_count
from (
		select pizzeria.name,
			count(pizzeria.id) as count_pv
		from person_visits
			join pizzeria on pizzeria.id = person_visits.pizzeria_id
		group by pizzeria.name
	) as p_v
	right join(
		select pizzeria.name,
			count(pizzeria.id) as count_po
		from person_order
			join menu on menu.id = person_order.menu_id
			join pizzeria on pizzeria.id = menu.pizzeria_id
		group by pizzeria.name
	) as p_o using(name)
order by 2 desc, 1 asc;
