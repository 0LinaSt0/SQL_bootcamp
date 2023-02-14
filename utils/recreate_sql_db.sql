/*
 * RECREATE DATABASE SQL
 */


\c postgres;

-- to close all opened connections
select (case
		when (
			select numbackends
			from pg_stat_database
			where datname='sql' and numbackends != 0
		) != 0 then (
			select pg_terminate_backend(pid)
			from pg_stat_activity
			where datname='sql'
		)
		end
	) as is_connections;

drop database sql;
create database sql;
grant all privileges on database sql to msalena;
\c sql;

