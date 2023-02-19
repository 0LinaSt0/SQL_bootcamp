
--truncate person_discounts; delete from person_discounts;

insert into person_discounts(id, person_id, pizzeria_id, discount)
	select
		row_number() over () as is,
		person_order.person_id,
		menu.pizzeria_id,
		(case
			when count(*) = 1 then 10.5
			when count(*) = 2 then 22
			else 30
		end)
	from person_order
		join menu on menu.id = person_order.menu_id
	group by person_id, pizzeria_id;

 select * from person_discounts;


