/*
 * About DDL: https://habr.com/ru/post/255361/
 *
 *
 * In this file useded DDL' for table creation with INSERT's of data
 *
 * 	________________________________________________________________________________
 * 	'DDL – Data Definition Language (for creating/changing/dropping tables and links)
 * 
 * About recurtion:
 * https://habr.com/ru/post/269497/
 * 
 * About recursive view:
 * https://www.geeksforgeeks.org/postgresql-create-recursive-views/
 * 
 * Difference between DDL and DML:
 * https://www.geeksforgeeks.org/difference-between-ddl-and-dml-in-dbms/
 *
 * Work with strings:
 * https://postgrespro.ru/docs/postgrespro/9.6/functions-string
 */

create table nodes (
	node1 bpchar not null,
	node2 bpchar not null,
	cost integer not null
) ;

insert into nodes values ('a', 'b', 10);
insert into nodes values ('a', 'd', 20);
insert into nodes values ('a', 'c', 15);
insert into nodes values ('b', 'a', 10);
insert into nodes values ('b', 'c', 35);
insert into nodes values ('b', 'd', 25);
insert into nodes values ('c', 'a', 15);
insert into nodes values ('c', 'b', 35);
insert into nodes values ('c', 'd', 30);
insert into nodes values ('d', 'a', 20);
insert into nodes values ('d', 'b', 25);
insert into nodes values ('d', 'c', 30);

create recursive view v_recursive_salesman(i_loop, total_cost, node1, node2, tour) as (
	select
		1 as i_loop,
		cost as total_cost,
		node1 as node1,
		node2 as node2,
		node1 as tour
	from nodes
	where node1 = 'a'
	union
	select 
		i_loop+1 as i_loop,
		v_recursive_salesman.total_cost + nd.cost as total_cost,
		nd.node1 as node1,
		nd.node2 as node2,
		(v_recursive_salesman.tour || nd.node1) as tour
	from nodes nd
		join v_recursive_salesman on v_recursive_salesman.node2 = nd.node1 and nd.node2 != v_recursive_salesman.node1
			and (position(nd.node2 in tour) = 0
			or (char_length(tour) = 3 and nd.node2 = 'a'))
);
