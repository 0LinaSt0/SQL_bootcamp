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
 * 	_____________________________________________________
 * 	$ \i /Users/msalena/Desktop/SQL_bootcamp/04/start.sql
 * 	-----------------------------------------------------
 */

-- SET VARIABLES
\set project_path /Users/msalena/Desktop/SQL_bootcamp/04

\set utilst_path :project_path / ../utils
\set recreate_db_path :utilst_path /recreate_sql_db.sql
\set day03_changes :utilst_path /changes_of_day03.sql

\set model_path :utilst_path /model.sql

\set day_variable day04_
--


 -- REFRESH DATABASE
\i :recreate_db_path
\i :model_path

\echo '*******************Update table with day03******************'
\i :day03_changes
\echo '************************************************************'
--


-- EXECUTE EXERCISES
\echo '\n\t\033[0;32m~~~~EXERCISE_00~~~~\033[0m'
\set full_path :project_path /ex00/ :day_variable ex00.sql
\i :full_path
\i :print_indexes_list

\echo '\n\t\033[0;32m~~~~EXERCISE_01~~~~\033[0m'
\set full_path :project_path /ex01/ :day_variable ex01.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_02~~~~\033[0m'
\set full_path :project_path /ex02/ :day_variable ex02.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_03~~~~\033[0m'
\set full_path :project_path /ex03/ :day_variable ex03.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_04~~~~\033[0m'
\set full_path :project_path /ex04/ :day_variable ex04.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_05~~~~\033[0m'
\set full_path :project_path /ex05/ :day_variable ex05.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_06~~~~\033[0m'
\set full_path :project_path /ex06/ :day_variable ex06.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_07~~~~\033[0m'
\set full_path :project_path /ex07/ :day_variable ex07.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_08~~~~\033[0m'
\set full_path :project_path /ex08/ :day_variable ex08.sql
\i :full_path
--



