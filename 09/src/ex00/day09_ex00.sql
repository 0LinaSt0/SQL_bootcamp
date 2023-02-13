/*
 * - The TIMESTAMPTZ datatype is the timestamp with the time zone
 *
 *
 */

create table person_audit (
	createad timestamptz not null,
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

create or replace function fnc_trg_person_insert_audit() returns trigger as
$$
begin
	insert into person_audit(created, type_event, row_id, name, age, gender, address)
		values (now(), 'I', new.id, new.name, new.age, new.gender, new.address);
	return new;
end;
$$ language plpgsql;

create trigger trg_person_insert_audit
	after insert on person for each row
	execute procedure fnc_trg_person_insert_audit();


insert into person(id, name, age, gender, address)
	values (10, 'Damir', 22, 'male', 'Irkutsk');


select * from person_audit;
select * from person;


