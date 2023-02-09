comment on table person_discounts
	is 'It stores the discount amount of a specific order for a person';

comment on column person_discounts.id
	is 'Identifier for row: it''s primary key';

comment on column person_discounts.person_id
	is 'Identifier for person';

comment on column person_discounts.pizzeria_id
	is 'Identifier for pizzeria';

comment on column person_discounts.discount
	is 'Percentage discount per person';

comment on constraint fd_person_discounts_person_id on person_discounts
	is 'Constraint for person_id column (foreign key to referens to the person.id)';

comment on constraint fd_person_discounts_pizzeria_id on person_discounts
	is 'Constraint from pizzeria_id colimn (foreign key to reference to the pizzeria.id)';


-- check all constraints for table
-- \dt+ person_discounts;
