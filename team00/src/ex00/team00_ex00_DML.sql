/*
 * https://habr.com/ru/post/255361/
 * 
 *
 * In this file useded SQL DML statement for
 *
 * 	__________________________________________________________________________
 * 	DML – Data Manipulation Language (for selecting/adding/refreshing/deleting
 * 		  table's datas)
 *
 * 
 * Another solution with JOINs:
 *
	select (
		nd1.cost + nd2.cost + nd3.cost + nd4.cost
	) as total_cost,
	(
		'{' || nd1.node1 || ',' || nd1.node2 || ',' || nd3.node1
		|| ',' || nd3.node2 || ',' || nd4.node2 || '}'
	) as tour
	from nodes as nd1
		join nodes as nd2 on nd2.node1 = nd1.node2 and nd2.node2 != nd1.node1
		join nodes as nd3 on nd3.node1 = nd2.node2 and nd3.node2 != nd2.node1
			and nd3.node2 != nd1.node1
		join nodes as nd4 on nd4.node1 = nd3.node2 and nd4.node2 = nd1.node1
	where nd1.node1 = 'A'
	order by 1, 2;
 
 */


select total_cost,
	(
		'{' || substring(tour, 1, 1) || ',' || substring(tour, 2, 1) || ',' 
		|| substring(tour, 3, 1) || ',' || substring(tour, 4, 1) || ',' 
		|| 'a' || '}'
	) as tour
from v_recursive_salesman
where char_length(tour) = 4 and 
	total_cost = (select min(total_cost) from v_recursive_salesman where char_length(tour) = 4)
order by 1, 2;
