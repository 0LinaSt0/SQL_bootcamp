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
