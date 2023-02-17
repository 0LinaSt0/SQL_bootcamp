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
 * 		 ___________________________________________________________
 * 		| $ \i /Users/msalena/Desktop/SQL_bootcamp/09/src/start.sql	|
 * 		 -----------------------------------------------------------
 */

-- SET VARIABLES
\set project_path /Users/msalena/Desktop/SQL_bootcamp/09

\set utilst_path :project_path / ../utils
\set recreate_db_path :utilst_path /recreate_sql_db.sql
\set day03_changes :utilst_path /changes_of_day03.sql
\set day04_changes :utilst_path /changes_of_day04.sql

\set model_path :project_path /materials/model.sql
\set src_folder :project_path /src

\set day_variable day09_
--


 -- REFRESH DATABASE
\i :recreate_db_path
\i :model_path

\echo '*****************Update table with day03-04****************'
\i :day03_changes
\i :day04_changes
\echo '************************************************************'
--


-- EXECUTE EXERCISES
\echo '\n\t\033[0;32m~~~~EXERCISE_00~~~~\033[0m'
\set full_path :src_folder /ex00/ :day_variable ex00.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_01~~~~\033[0m'
\set full_path :src_folder /ex01/ :day_variable ex01.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_02~~~~\033[0m'
\set full_path :src_folder /ex02/ :day_variable ex02.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_03~~~~\033[0m'
\set full_path :src_folder /ex03/ :day_variable ex03.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_04~~~~\033[0m'
\set full_path :src_folder /ex04/ :day_variable ex04.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_05~~~~\033[0m'
\set full_path :src_folder /ex05/ :day_variable ex05.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_06~~~~\033[0m'
\set full_path :src_folder /ex06/ :day_variable ex06.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_07~~~~\033[0m'
\set full_path :src_folder /ex07/ :day_variable ex07.sql
\i :full_path

\echo '\n\t\033[0;32m~~~~EXERCISE_08~~~~\033[0m'
\set full_path :src_folder /ex08/ :day_variable ex08.sql
\i :full_path
--



