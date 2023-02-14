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
