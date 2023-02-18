/*
Output Column	Formula (pseudocode)

name			source: user.name if user.name is NULL then return not defined value
lastname		source: user.lastname if user.lastname is NULL then return not defined value
currency_name	source: currency.name
currency_in_usd	involved sources: currency.rate_to_usd, currency.updated, balance.updated.
				Take a look at a graphical interpretation of the formula below.
*/


-- INSERING STATEMENTS FROM SUBJECT
insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');
--

create or replace function fnc_find_nearest_pass_rate(current_currency_id bigint, balance_update timestamp)
	returns numeric as
$$
begin
	return (
		select rate_to_usd
		from currency
		where id = current_currency_id and updated < balance_update
		order by (balance_update - updated)
		limit 1
	);
end;
$$ language plpgsql;


create or replace function fnc_find_nearest_future_rate(current_currency_id bigint, balance_update timestamp)
	returns numeric as
$$
begin
	return (
		select rate_to_usd
		from currency
		where id = current_currency_id and updated >= balance_update
		order by (updated - balance_update)
		limit 1
	);
end;
$$ language plpgsql;


create or replace function fnc_find_nearest_rate(current_currency_id bigint, balance_update timestamp)
	returns numeric as
$$
declare
	pass_rate numeric := fnc_find_nearest_pass_rate(current_currency_id, balance_update);
begin
	if (pass_rate is not null) then return pass_rate; end if;
	return fnc_find_nearest_future_rate(current_currency_id, balance_update);
end;
$$ language plpgsql;


select coalesce(u.name, 'not defined') as name,
	coalesce(u.lastname, 'not defined') as lastname,
	c_id.name as currency_name,
	(fnc_find_nearest_rate(b.currency_id, b.updated) * b.money)::real as currency_in_usd
from balance b
	join (select distinct id as currency_id, name from currency) as c_id using(currency_id)
	left join "user" as u on u.id = b.user_id
order by 1 desc, 2 asc, 3 asc;


	