/*
 * RECREATE DATABASE SQL
 *
 * 	You should change variables:
 * 	- 'db_user' which must be the name of user
 * 	- 'db_name' which must be the name of database
 */

\set db_user msalena
\set db_name '\'sql\''


\c postgres;

-- to close all opened connections
select (case
		when (
			select numbackends
			from pg_stat_database
			where datname=:db_name and numbackends != 0
		) != 0 then (
			select pg_terminate_backend(pid)
			from pg_stat_activity
			where datname=:db_name
		)
		end
	) as is_connections;

drop database sql;
create database sql;
grant all privileges on database sql to :db_user;
\c sql;

