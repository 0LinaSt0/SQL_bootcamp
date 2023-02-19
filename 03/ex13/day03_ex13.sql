delete from person_order
where order_date = '2022-02-25';

delete from menu
where pizza_name = 'greek pizza';


-- CHECK INSERTING
select count(*) as "2022-02-25"
from person_order 
where order_date = '2022-02-25';
select count(*) as "greek pizza"
from menu 
where pizza_name = 'greek pizza';
