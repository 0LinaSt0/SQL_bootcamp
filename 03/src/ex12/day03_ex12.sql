insert into person_order
	select gs.i + (select max(id) from person_order) as id,
		person.id as person_id,
		(select menu.id from menu where pizza_name = 'greek pizza'),
		'2022-02-25' as order_date
	from person
		join (
		select generate_series(1, (select count(id) from person)) as i
		) as gs on gs.i = person.id ;


-- <UNCOMMENT FOR start.sql SCRIPT>
-- select * from person_order;




/*
	Please register new orders from all persons for “greek pizza” by 25th of February 2022
*/

insert into person_order 
	select (SELECT * FROM generate_series(
			(SELECT MAX(id) + 1 FROM person_order),
			(SELECT MAX(person_order.id) + MAX(person.id) FROM person_order, person),
			1
		)) as GeneratedIdx,
		person.id as person_id,
		(select id as menu_id from menu where pizza_name = 'greek pizza'),
		'2022-02-25' as order_date
	from 



INSERT INTO person_order(id, person_id, menu_id, order_date)
	(SELECT * FROM generate_series(
		(SELECT MAX(id) + 1 FROM person_order),
		(SELECT MAX(person_order.id) + MAX(person.id) FROM person_order, person),
		1
	)) as GeneratedIdx,

	(SELECT id FROM person) as person_id,

	(SELECT id as menu_id FROM menu WHERE pizza_name = 'greek pizza') as pizza_time,

	(SELECT CAST('2022-02-25' AS DATE) as visit_date FROM person) as date_stuff;