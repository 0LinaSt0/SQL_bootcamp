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
 * 		 _______________________________________________________________
 * 		| $ \i /Users/msalena/Desktop/SQL_bootcamp/team01/src/start.sql	|
 * 		 ---------------------------------------------------------------
 */

-- SET VARIABLES
\set project_path /Users/msalena/Desktop/SQL_bootcamp/team01

\set utilst_path :project_path / ../utils
\set recreate_db_path :utilst_path /recreate_sql_db.sql

\set model_path :utilst_path rush01_model.sql
\set src_folder :project_path /src

\set day_variable team01_
--


 -- REFRESH DATABASE
\i :recreate_db_path
\i :model_path
--


-- EXECUTE EXERCISES
\echo '\n\t\033[0;32m~~~~EXERCISE_00~~~~\033[0m'
\set full_path :src_folder /ex00/ :day_variable ex00.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_01~~~~\033[0m'
\set full_path :src_folder /ex01/ :day_variable ex01.sql
\i :full_path
--



