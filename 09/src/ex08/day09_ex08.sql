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
		from count as c
		where (c.number1 + c.number2) < pstop
	)
	select number1 as number from count
$$ language sql;


select * from fnc_fibonacci();
select * from fnc_fibonacci(100);
