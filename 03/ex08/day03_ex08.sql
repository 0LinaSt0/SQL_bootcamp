insert into menu values (
	(select max(id) + 1 from menu),
	(select id from pizzeria where name = 'Dominos'),
	'sicilian pizza',
	900
);


-- CHECK INSERTING
select * 
from menu 
where pizzeria_id = 2 and pizza_name = 'sicilian pizza'
	and price = 900;

