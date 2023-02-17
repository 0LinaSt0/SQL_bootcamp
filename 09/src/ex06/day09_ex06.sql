/*
 * Vertion where printed two pizzerias:
 * ____________________________________________________________________________________________________
	create or replace function fnc_person_visits_and_eats_on_date(
		pperson varchar default 'Dmitriy', pprice numeric default 500, pdate date default '2022-01-08')
		returns table(pizzeria_name varchar) as
	$$
	begin
		return query (
			select pizzeria.name as pizzeria_name
			from person_visits
				join pizzeria on pizzeria.id = person_visits.pizzeria_id
				join person on person.id = person_visits.person_id
					and person.name = pperson
				left join (
					select pizzeria.id as pi, pizzeria.name, menu.price
					from person_order
						join menu on menu.id = person_order.menu_id
							and menu.price < pprice
						join pizzeria on pizzeria.id = menu.pizzeria_id
						join person on person.id = person_order.person_id
							and person.name = pperson
					where person_order.order_date = pdate
				) as s on pizzeria.id = s.pi
			where person_visits.visit_date = pdate and s.pi is not null
		);
	end;
	$$ language plpgsql;
*/


/*
*/
create or replace function fnc_person_visits_and_eats_on_date(
	pperson varchar default 'Dmitriy', pprice numeric default 500, pdate date default '2022-01-08')
	returns table(pizzeria_name varchar) as
$$
begin
	return query (
		(
			select pizzeria.name as pizzeria_name
			from person_visits
				join pizzeria on pizzeria.id = person_visits.pizzeria_id
				join person on person.id = person_visits.person_id
					and person.name = pperson
			where person_visits.visit_date = pdate
		)
		intersect
		(
			select pizzeria.name as pizzeria_name
			from person_order
				join menu on menu.id = person_order.menu_id
					and menu.price < pprice
				join pizzeria on pizzeria.id = menu.pizzeria_id
				join person on person.id = person_order.person_id
			where person_order.order_date = pdate
		)
	);
end;
$$ language plpgsql;


select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');





