select total_cost,
	(
		'{' || substring(tour, 1, 1) || ',' || substring(tour, 2, 1) || ',' 
		|| substring(tour, 3, 1) || ',' || substring(tour, 4, 1) || ',' 
		|| 'a' || '}'
	) as tour
from v_recursive_salesman
where char_length(tour) = 4
order by 1, 2;

