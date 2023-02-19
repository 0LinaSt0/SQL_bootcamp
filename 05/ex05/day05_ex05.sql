/*
 * It's possible to create unique index just for part of rows.
 * In this case unique indexes are set on just orders where
 * order_dare equal '2022-01-01'
 */

create unique index if not exists idx_person_order_order_date
	on person_order (person_id, menu_id)
	where order_date = '2022-01-01';

set enable_seqscan = off;

explain analyze select person_id
from person_order
where order_date = '2022-01-01';
