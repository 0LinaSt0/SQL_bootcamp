create or replace function fnc_trg_person_delete_audit() returns trigger as
$$
begin
	insert into person_audit(created, type_event, row_id, name, age, gender, address)
		values (now(), 'D', old.id, old.name, old.age, old.gender, old.address);
	return new;
end;
$$ language plpgsql;


create trigger trg_person_delete_audit
	after delete on person
	for each row
	execute procedure fnc_trg_person_delete_audit();

delete from person where id = 10;

select * from person_audit;
