drop view if exists v_personal_order;

create view v_personal_order as (
	select sum(person_id)
	from person_order
	group by person_id
);

insert into person_discounts values (
	(
		select
			row_number() over (
				partition by id
			) as id
		from person_order
	),
	(select person_id from person_order),
	(
		select pizzeria_id
		from person_order
			join menu on menu.id = person_order.menu_id
	),
	(
		select case
				when (
					select * from v_personal_order
				) = 1 then 10.5
				when (
					select * from v_personal_order
				) = 2 then 22
				else 30
			end
	)
);


