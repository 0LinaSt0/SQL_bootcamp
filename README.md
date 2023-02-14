

---

Useful command:

1. Connect to DB:
	```shell
	$ /Users/$USER/.brew/opt/postgresql@14/bin/postgres -D /Users/$USER/.brew/var/postgresql@14
	```
2. Start DB:
	```shell
	$ psql postges
	```
3. View all commands and flags:
	```shell
	$ \h;
	$ \?;
	```
4. Create user:
	```shell
	$ create user <username> with encrypted password <'mypass'>;
	```
5. Create database:
	```shell
	$ create database <db_name>;
	```
6. Give all privelegs by database for user:
	```shell
	$ grant all privileges on database <db_name> to <username>;
	```
7. Go to database:
	```shell
	$ \c <db_name>;
	```
8. Execute file:
	```shell
	$ \i <file_name>;
	```
9. Delete all content from tables:
	```shell
	$ truncate <table_1>, <table_2>, …, <table_n>;
	```
