/*
create or replace sequence seq_fibonacci
	start 0
	increment 1;

create or replace function fnc_fibonacci (pstop integer default 10)
	returns table(number bigint) as
$$
begin
	return query (
		select
	)
end;
$$ language plpgsql;
*/


create or replace function fnc_fibonacci (pstop integer default 10)
	returns table(number bigint) as
$$
	with recursive count as (
		select
			0 as number1,
			1 as number2
	union all
		select
			(c.number1 + c.number2) as number1,
			c.number1 as number2
		where number1 < pstop
	)
	select number1 as number from count limit 10
$$ language sql;


select * from fnc_fibonacci();
