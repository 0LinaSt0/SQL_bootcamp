/*
 * About all types of scan in EXPLANE ANALYSE:
 * https://habr.com/ru/post/276973/
 *
 * "Index Only Scan" means we take data just from one column.
 * In this case the PostgreSQL planner perceices  3 arguments
 * in SELECT as one because there was created multicolumn index.
 */


create index if not exists idx_person_order_multi
	on person_order (person_id, menu_id, order_date);

set enable_seqscan = off;

explain analyze select
	person_id,
	menu_id,
	order_date
from person_order
where person_id = 8 and menu_id = 19;
