/*
 * All about sequences:
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-sequences/
 *
 * About setval:
 * https://postgrespro.ru/docs/postgrespro/9.5/functions-sequence
 */


create sequence if not exists seq_person_discounts
	start 1
	increment 1;

alter table person_discounts
alter column id
set default nextval('seq_person_discounts');
select setval('seq_person_discounts', ((select count(*) from person_discounts) + 1));



