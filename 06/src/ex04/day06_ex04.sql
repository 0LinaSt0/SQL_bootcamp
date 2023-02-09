/*
 * All modes of ALTER TABLE:
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-alter-table/
 *
 * ADD CONSTRAINT ... CHECK:
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-check-constraint/
 *
 * To remove a check constraint from a table and all its children:
 * 		 ___________________________________________________________
 * 		| ALTER TABLE your_table DROP CONSTRAINT constraint_name;	|
 * 		 -----------------------------------------------------------
 */


-- drop constraints if they exists altready
/*
alter table person_discounts
drop constraint if exists ch_nn_person_id;
alter table person_discounts
drop constraint if exists ch_nn_pizzeria_id;
alter table person_discounts
drop constraint if exists ch_nn_discount;
alter table person_discounts
drop constraint if exists ch_range_discount;
*/

alter table person_discounts
add constraint ch_nn_person_id check(person_id is not null);

alter table person_discounts
add constraint ch_nn_pizzeria_id check(pizzeria_id is not null);

alter table person_discounts
add constraint ch_nn_discount check(discount is not null);

alter table person_discounts
add constraint ch_range_discount check(discount between 0 and 100);

alter table person_discounts
alter column discount
set default 0;


-- check all constraints for table
-- \d+ person_discounts;
