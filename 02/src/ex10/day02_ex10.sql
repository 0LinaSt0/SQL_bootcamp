/*
STILL DONT WORK
NEED TO DELETE DUBLICATE
*/

select p1.name as person_name1,
	p2.name as person_name2,
    p1.address as common_address
from person as p1
	join person as p2 on p2.address = p1.address
where p1.name != p2.name
order by 1, 2
