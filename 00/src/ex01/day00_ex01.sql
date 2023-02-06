-- ORDER BY - rules for sorting the result set returned from a query

select name, age
from person
where address = 'Kazan' and gender = 'female'
order by 1;
