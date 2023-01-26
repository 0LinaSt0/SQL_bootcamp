/*
 * Ex about Cartesian Product: when we SELECT table from two other tables,
 * SELEC merge every row of first table with every row of second one
 *
 * In this case it's possible to write just 'SELECT *' which just take all
 * rows from 'person' and 'pizzeria', but then there will be default names
 * of columns in resultin table
 */

select
	person.id as "person.id", person.name as "person.name", person.age as "age",
	person.gender as "gender", person.address as "address", pizzeria.id as "pizzeria.id",
	pizzeria.name as "pizzeria.name", pizzeria.rating as "raiting"
from person, pizzeria
order by person.id, pizzeria.id
