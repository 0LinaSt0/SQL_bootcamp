-- drop view if exists v_price_with_discount;

create view v_price_with_discount as (
	select person.name,
		menu.pizza_name,
		menu.price,
		(menu.price - menu.price*0.1)::integer as discount_price
	from person_order
		join person on person.id = person_order.person_id
		join menu on menu.id = person_order.menu_id
	order by 1, 2
);


-- CHECK CREATING
select * from v_price_with_discount;
