/*
 * https://www.postgresqltutorial.com/postgresql-views/managing-postgresql-views/
 * https://www.geeksforgeeks.org/differences-between-views-and-materialized-views-in-sql/
 *
 * Managing Views - a logical table that represents data of one or more underlying tables.
 *					Tuples of the view are not stored in the database system and tuples of
 *					the view are generated every time the view is accessed.
 */

create view v_persons_female as (
	select * from person
	where person.gender = 'female'
);

create view v_persons_male as (
	select * from person
	where person.gender = 'male'
);