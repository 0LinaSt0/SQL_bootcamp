/*
 * <select "column_name or formula"> AS - assign a new temporary name for column
 * 										with values or expressions in select list
 *
 *
 * It's possible to do formula with CONCAT():
 * CONCAT(name, ' (age:', age, ',gender:''', gender, ''',address:''', address, ''')')
 */

select name || ' (age:' || age || ',gender:''' || gender
		|| ''',address:''' || address || ''')'
		as person_information
	from person
	order by person_information;
