/*
 * About variatic (check 35.4.5.):
 * https://postgrespro.ru/docs/postgresql/9.5/xfunc-sql?lang=en
 *
 * Type of notations (positional, named, mixed) in calling functions:
 * https://postgrespro.ru/docs/postgresql/9.5/sql-syntax-calling-funcs?lang=en#sql-syntax-calling-funcs-named
 *
 * Array functions and operators:
 * https://postgrespro.ru/docs/postgrespro/9.5/functions-array?lang=en
 */


create or replace function func_minimum (variadic arr numeric[])
	returns numeric as
$$
begin
	return (select min(m) from unnest(arr) as m);
end;
$$ language plpgsql;


select func_minimum(variadic arr => array[10.0, -1.0, 5.0, 4.4]);
