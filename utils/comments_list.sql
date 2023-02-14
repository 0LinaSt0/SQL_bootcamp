
select obj_description('public.person_discounts'::regclass);

select
	cols.column_name,
	(
		select
			pg_catalog.col_description(c.oid, cols.ordinal_position::int)
		from pg_catalog.pg_class c
		where
			c.oid = (select cols.table_name::regclass::oid) and
			c.relname = cols.table_name
	) as column_comment
 
from information_schema.columns cols
where
	cols.table_catalog = 'sql' and
	cols.table_schema = 'public' and
	cols.table_name = 'person_discounts';