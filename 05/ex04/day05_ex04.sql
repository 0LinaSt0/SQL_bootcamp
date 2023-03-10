/*
 * https://www.postgresqltutorial.com/postgresql-indexes/postgresql-unique-index/
 *
 * UNIQUE index enforces the uniqueness of values in one or multiple columns
 */


create unique index if not exists idx_menu_unique
	on menu (pizzeria_id, pizza_name);

set enable_seqscan = off;

explain analyze select *
from menu where pizzeria_id = 1;
