-- <UNCOMMENT LIENS 3 and 28 FOR start.sql SCRIPT>

-- drop view if exists v_symmetric_union;

create view v_symmetric_union as (
	select (
			select person_id as pi1
			from person_visits 
			where visit_date = '2022-01-02'
		) - (
			select person_id as pi2
			from person_visits 
			where visit_date = '2022-01-06'
		) as formula_result
	union
	select (
			select person_id as pi1
			from person_visits 
			where visit_date = '2022-01-06'
		) - (
			select person_id as pi2
			from person_visits 
			where visit_date = '2022-01-02'
		) as formula_result
	order by 1
);

-- select * from v_symmetric_union;