
# SQL_BOOTCAMP
---
### Description
1. DAY_00:
	> How to get needed data based on basic constructions of SQL
2. DAY_01:
	> How to get needed data based on sets constructions and simple JOINs
3. DAY_02:
	> How to get needed data based on different structures JOINs

...

---
### Execute sql scripts
*STEP_1*
clone repo as:
```shell
git clone -b main git@github.com:0LinaSt0/SQL_bootcamp.git
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
