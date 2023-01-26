select
	order_date as action_date,
	(select
		name from person
		where id = person_order.person_id
	) as person_name
	from person_order
intersect
select
	visit_date as action_date,
	(select
		name from person
		where id = person_visits.person_id
	) as person_name
	from person_visits
order by action_date asc, person_name desc;
