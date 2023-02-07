/*
 * All about foreign keys:
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-foreign-key/
 *
 * About primary key:
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-primary-key/
 *
 * About data types:
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-data-types/
 */


create table person_discounts (
	id bigint primary key,
	person_id bigint not null,
	pizzeria_id bigint not null,
	discount numeric not null,
	constraint fd_person_discounts_person_id
		foreign key (person_id)
		references person (id),
	constraint fd_person_discounts_pizzeria_id
		foreign key (pizzeria_id)
		references pizzeria (id)
);
