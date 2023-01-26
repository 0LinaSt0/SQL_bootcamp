
-- DIDNT CREATE
-- !!!!!!!!!!!!!!!!!!!
-- !!!!!!!!!!!!!!!!!!!
-- !!!!!!!!!!!!!!!!!!!
-- !!!!!!!!!!!!!!!!!!!
-- !!!!!!!!!!!!!!!!!!!
-- !!!!!!!!!!!!!!!!!!!
-- !!!!!!!!!!!!!!!!!!!
-- !!!!!!!!!!!!!!!!!!!

select *
from(
  select
    (select person_id
     	from person_order
    	where order_date = '2022-01-07'
	) as oreders_id,
  	(select person_id
     	from person_visits
    	where visit_date = '2022-01-07'
	) as visits_id
 ) as orders_visitors_ids




	select person_id as orders
	from person_order
	where order_date = '2022-01-07';

	select person_id as visitis
	from person_visits
	where visit_date = '2022-01-07'


	select person_order.person_id as orders, person_visits.person_id as visitors
from person_order, person_visits
where person_visits.visit_date = '2022-01-07' AND person_order.order_date = '2022-01-07'
limit (select count(person_id) from person_visits)
