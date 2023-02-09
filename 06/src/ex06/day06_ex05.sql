/*
 * All about sequences:
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-sequences/
 *
 * About setval:
 * https://postgrespro.ru/docs/postgrespro/9.5/functions-sequence
 */


--drop sequence if exists seq_person_discounts cascade;


create sequence if not exists seq_person_discounts
	start 1
	increment 1;

-- Show all sequences in th database
--select relname sequence_name
--from pg_class
--where relkind = 'S';
--


alter table person_discounts
alter column id
set default nextval('seq_person_discounts');
select setval('seq_person_discounts', ((select count(*) from person_discounts) + 1));


--select * from person_discounts;
