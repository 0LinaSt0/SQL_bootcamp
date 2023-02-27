
# SQL_BOOTCAMP
---
### Description
1. [DAY_00](https://github.com/0LinaSt0/SQL_bootcamp/tree/main/00):
	How to get needed data based on basic constructions of SQL
	> select, from, where, order by, case(when/there), subquery
2. [DAY_01](https://github.com/0LinaSt0/SQL_bootcamp/tree/main/01):
	How to get needed data based on sets constructions and simple JOINs
	> union [all], intersect [all], except [all], join (inner, cross, naturale)
3. [DAY_02](https://github.com/0LinaSt0/SQL_bootcamp/tree/main/02):
	How to get needed data based on different structures JOINs
	> join (inner, left, full), generate_series(), with .. as()
4. [DAY_03](https://github.com/0LinaSt0/SQL_bootcamp/tree/main/03):
	How to change data based on DML language
	> insert, update, set, delete; more practise with: joins, except/union/intersect
5. [DAY_04](https://github.com/0LinaSt0/SQL_bootcamp/tree/main/04):
	How to use a virtual view and physical snapshot of data
	> create/drop view, materialized view
6. [DAY_05](https://github.com/0LinaSt0/SQL_bootcamp/tree/main/05):
	How and when to create database indexes
	> create/drop index, multicolumn index, unique index explain analyze, enable_seqscan
7. [DAY_06](https://github.com/0LinaSt0/SQL_bootcamp/tree/main/06):
	How to add a new business feature into our data model
	> create/drop/delete table, alter, add, comment, sequence
8. [DAY_07](https://github.com/0LinaSt0/SQL_bootcamp/tree/main/07):
	How to use specific OLAP constructions to get a “Value” from data
	> group by, limit, coalesce(), count()/max()/min()/avg(), round(), trim_scale()
9. [DAY_08](https://github.com/0LinaSt0/SQL_bootcamp/tree/main/08):
	How database works with transactions and isolation levels
	> transaction isolation level read committed/repeatable read/serializable/
10. [DAY_09](https://github.com/0LinaSt0/SQL_bootcamp/tree/main/09):
	How to create and use functional blocks in Databases
	> create/drop function, trigger
11. [TEAM_00](https://github.com/0LinaSt0/SQL_bootcamp/tree/main/team00):
	Implementing a quick solution on SQL to achieve results of Traveling Salesman Problem
	> Understending DDL/DML consept, recursive view, function
12. [TEAM_01](https://github.com/0LinaSt0/SQL_bootcamp/tree/main/team01):
	What DWH is and how to create a first ETL process
	> DataWareHouse systems, ETL (extract, transform, and load)


---
### Execute sql scripts
*STEP_1*
clone repo as and go to cloned project:
```shell
git clone -b main git@github.com:0LinaSt0/SQL_bootcamp.git && cd SQL_bootcamp/
```
*STEP_2*
change variables in file 'utils/recreate_sql_db.sql' and 'utils/comments_list.sql':
```shell
in 'utils/recreate_sql_db.sql'
\set db_user <user_name>
\set db_name <database_name>

in 'utils/comments_list.sql'
\set table_catalog <database_name>
```

##### Execute all days
You shoud execute file 'execute_all.sql' (check example in comments of 'execute_all.sql'):
```shell
\i <absolute_path_to_the_'execute_all.sql'>
```

##### Execute concret day
You shoud execute file 'start.sql' in folder with concret day (check example in comments of 'start.sql' of concret day):
```shell
\i <absolute_path_to_the_'start.sql'_in_concret_day>
```

---
### Useful commands:

1. Connect to DB (if server was installed on school MAC and with using 'brew'):
	```shell
	/Users/$USER/.brew/opt/postgresql@14/bin/postgres -D /Users/$USER/.brew/var/postgresql@14
	```
2. Start DB:
	```shell
	psql <db_name> -U <username>
	```
3. View all commands and flags:
	```shell
	\h
	\?
	```
4. Create user:
	```shell
	create user <username> with encrypted password <'mypass'>
	```
5. Create database:
	```shell
	create database <db_name>
	```
6. Give all privelegs by database for user:
	```shell
	grant all privileges on database <db_name> to <username>
	```
7. Go to database:
	```shell
	\c <db_name>
	```
8. Execute file:
	```shell
	\i <file_name>
	```
9. Delete all content from tables:
	```shell
	truncate <table_1>, <table_2>, …, <table_n>;
	```
