--!!!!!
--CANNOT create



insert into person_order(id, person_id, menu_id, order_date)
select *
from (
	select
		generate_series(max(person_order.id), (max(person_order.id) + max(person.id)))
			as g_id,
		person.id as p_id,
		menu.id as menu_id,
		'2022-02-25' as data
	from person_order
		join person on person.id = person_order.id
		join menu on menu.id = person_order.menu_id
			and menu.pizza_name = 'greek pizza'
) adding

