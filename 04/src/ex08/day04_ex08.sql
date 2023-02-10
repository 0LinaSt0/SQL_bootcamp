drop view if exists
	v_persons_female,
	v_persons_male,
	v_generated_dates,
	v_symmetric_union,
	v_price_with_discount;

drop materialized view if exists
	mv_dmitriy_visits_and_eats;



-- CHECK DROPING
select 'v_persons_female' as view,
	(case
		when not exists (
			select relname from pg_class where relname='v_persons_female'
		) then 'not exists' else 'exists'
	end
	) as "is found"
union
select 'v_persons_male' as view,
	(case
		when not exists (
			select relname from pg_class where relname='v_persons_male'
		) then 'not exists' else 'exists'
	end
	) as "is found"
union
select 'v_symmetric_union' as view,
	(case
		when not exists (
			select relname from pg_class where relname='v_symmetric_union'
		) then 'not exists' else 'exists'
	end
	) as "is found"
union
select 'mv_dmitriy_visits_and_eats' as view,
	(case
		when not exists (
			select relname from pg_class where relname='mv_dmitriy_visits_and_eats'
		) then 'not exists' else 'exists'
	end
	) as "is found";
