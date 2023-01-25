-- ORDER BY - rules for sorting the result set returned from a query

select name, age from person
	where address = 'Kazan' AND gender = 'female'
	order by name;
