/*
 * https://habr.com/ru/post/275851/
 *
 * PostgreSQL is unique because it can check all possible scenaries
 * of searching the requested memory area. It knows how much rows
 * you have and how much rows will be used during the execution of
 * the request. That's why PostgreSQL take desicion about which way
 * of searching data to use.
 *
 * EXPLAIN show us which decision for searching was choosed.
 *
 * Standart EXPLAIN shows abstract and rough estimate which based on
 * random examples.
 *
 * EXPLAIN ANALYSE shows the actual time, number of rows, execution
 * time
 *
 *
 * https://habr.com/ru/post/282011/ || https://postgresqlco.nf/doc/en/param/enable_seqscan/
 *
 * There are some important configurations in 'postgresql.conf' one
 * of which is 'enable_seqscan' setting.
 * This mode tells the planner to use of sequential scan plan types.
 * But it's possible to 'off' it and then the planner will use everything
 * it can to avoid sequential scans
 */


set enable_seqscan = off;

explain analyze select
	menu.pizza_name,
	pizzeria.name as pizzeria_name
from menu
	join pizzeria on pizzeria.id = menu.pizzeria_id;


