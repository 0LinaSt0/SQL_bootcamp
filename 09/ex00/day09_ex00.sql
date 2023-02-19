/*
 * - The TIMESTAMPTZ datatype is the timestamp with the time zone
 *
 * - For row level triggers returned a row of the table on which the
 * 	 trigger is defined (it's NEW). The return value is ignored for row
 * 	 level AFTER triggers, so you may as well return NULL in that case.
 * 	 That leaves row level BEFORE triggers as the only interesting case.
 *
 * About triggers:
 * https://www.tutorialspoint.com/postgresql/postgresql_triggers.htm#
 * https://www.postgresqltutorial.com/postgresql-triggers/creating-first-trigger-postgresql/
 *
 * About returns and NEW/OLD:
 * https://www.cybertec-postgresql.com/en/what-to-return-from-a-postgresql-row-level-trigger/
 */

-- create table
create table person_audit (
	created timestamptz not null,
	type_event char(1) not null,
	row_id bigint not null,
	name varchar,
	age integer,
	gender varchar,
	address varchar
);

alter table person_audit
	add constraint ch_type_event
	check (type_event in ('I', 'U', 'D'));


-- create trigger function
create or replace function fnc_trg_person_insert_audit() returns trigger as
$$
begin
	insert into person_audit(created, type_event, row_id, name, age, gender, address)
		values (now(), 'I', new.id, new.name, new.age, new.gender, new.address);
	return new;
end;
$$ language plpgsql;

-- create trigger
create trigger trg_person_insert_audit
	after insert on person
	for each row
	execute procedure fnc_trg_person_insert_audit();


-- add new person to person table
insert into person(id, name, age, gender, address)
	values (10, 'Damir', 22, 'male', 'Irkutsk');


-- check inserting
select * from person_audit;


