/*
 * EXECUTE EXERCISES
 *
 * !   !   ! Please, check that paths are correct !   !   !
 *
 * 	You should change variable 'project_path' which must be
 * 	a absolute path to the root folder of the checking day
 * !   !   !   !   !   !   !   !   !   !   !   !   !   !   !
 *
 * For starting script to execute command '\i' with absolute path
 * to this file as example below:
 * 	_________________________________________________________
 * 	$ \i /Users/msalena/Desktop/SQL_bootcamp/team01/start.sql
 * 	---------------------------------------------------------
 */

-- SET VARIABLES
\set project_path /Users/msalena/Desktop/SQL_bootcamp/team01

\set utilst_path :project_path / ../utils
\set recreate_db_path :utilst_path /recreate_sql_db.sql

\set model_path :utilst_path /rush01_model.sql

\set day_variable team01_
--


 -- REFRESH DATABASE
\i :recreate_db_path
\i :model_path
\echo '************************************************************'
--


-- EXECUTE EXERCISES
\echo '\n\t\033[0;34mEXERCISE_00\033[0m'
\set full_path :project_path /ex00/ :day_variable ex00.sql
\i :full_path

\echo '\n\t\033[0;34mEXERCISE_01\033[0m'
\set full_path :project_path /ex01/ :day_variable ex01.sql
\i :full_path
--



