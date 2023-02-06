create table nodes (
	node1 char(1) not null,
	node2 char(1) not null,
	cost integer not null
) ;

insert into nodes values ('A', 'B', 10);
insert into nodes values ('A', 'D', 20);
insert into nodes values ('A', 'C', 15);
insert into nodes values ('B', 'A', 10);
insert into nodes values ('B', 'C', 35);
insert into nodes values ('B', 'D', 25);
insert into nodes values ('C', 'A', 15);
insert into nodes values ('C', 'B', 35);
insert into nodes values ('C', 'D', 30);
insert into nodes values ('D', 'A', 20);
insert into nodes values ('D', 'B', 25);
insert into nodes values ('D', 'C', 30);
