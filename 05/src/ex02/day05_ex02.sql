/*
 * https://habr.com/ru/company/quadcode/blog/696498/ <find "upper">
 *
 * This is example of the functional index - index which bases
 * on some function (upper() in this case).
 * Now for index searching we should remember that all indexes
 * in upper way.
 */

create index if not exists idx_person_name on person (upper(name));

set enable_seqscan = off;

explain analyze select *
from person
where upper(name) = 'DMITRIY';
