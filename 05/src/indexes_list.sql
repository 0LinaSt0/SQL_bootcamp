/*
 * The script to show the indexes list of all the tables in schema(s)
 * from program. All the information is on hand in the catalog.
 */

select
	n.nspname as "Schema",
	t.relname as "Table",
	c.relname as "Index"
from
	pg_catalog.pg_class c
	join pg_catalog.pg_namespace n on n.oid = c.relnamespace
	join pg_catalog.pg_index i on i.indexrelid = c.oid
	join pg_catalog.pg_class t on i.indrelid = t.oid
where
	c.relkind = 'i'
	and n.nspname not in ('pg_catalog', 'pg_toast')
	and pg_catalog.pg_table_is_visible(c.oid)
order by
	n.nspname,
	t.relname,
	c.relname;
