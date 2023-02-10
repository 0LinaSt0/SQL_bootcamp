insert into person_order
	select gs.i + (select max(id) from person_order) as id,
		person.id as person_id,
		(select menu.id from menu where pizza_name = 'greek pizza'),
		'2022-02-25' as order_date
	from person
		join (
		select generate_series(1, (select count(id) from person)) as i
		) as gs on gs.i = person.id ;


-- CHECK INSERTING
select * 
from person_order
where (person_id between 1 and 9) and menu_id = 19
	and order_date = '2022-02-25';

