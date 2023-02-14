/*
 * About multi triggers (check Example 43.4.):
 * https://www.postgresql.org/docs/current/plpgsql-trigger.html#PLPGSQL-DML-TRIGGER
 */


-- delete triggers, trigger functions and clean 'person_audit' table
drop trigger if exists trg_person_insert_audit on person;
drop trigger if exists trg_person_update_audit on person;
drop trigger if exists trg_person_delete_audit on person;

drop function if exists
	fnc_trg_person_insert_audit(),
	fnc_trg_person_update_audit(),
	fnc_trg_person_delete_audit();

delete from person_audit;
--


-- create multi trigger and trigger function
create or replace function fnc_trg_person_audit() returns trigger as
$$
begin
	if (tg_op = 'INSERT') then
		insert into person_audit (created, type_event, row_id, name, age, gender, address)
			values (now(), 'I', new.id, new.name, new.age, new.gender, new.address);
	elsif (tg_op = 'UPDATE') then
		insert into person_audit (created, type_event, row_id, name, age, gender, address)
			values (now(), 'U', old.id, old.name, old.age, old.gender, old.address);
	elsif (tg_op = 'DELETE') then
		insert into person_audit (created, type_event, row_id, name, age, gender, address)
			values (now(), 'D', old.id, old.name, old.age, old.gender, old.address);
	end if;
	return new;

end;
$$ language plpgsql;

create trigger trg_person_audit
after insert or update or delete on person
	for each row
	execute function fnc_trg_person_audit();
--


-- re-apply the set of DML statements
insert into person (id, name, age, gender, address)
	values (10, 'Damir', 22, 'male', 'Irkutsk');

update person set name = 'Bulat' where id = 10;
update person set name = 'Damir' where id = 10;

delete from person where id = 10;
--

-- check 'person_audit'
select * from person_audit;
