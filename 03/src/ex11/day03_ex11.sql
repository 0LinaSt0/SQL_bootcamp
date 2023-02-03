/*
 * It's possible to calculate new price as:
 *
 * 		 ___________________________
 * 		| price = price-price*0.1	|
 * 		 ---------------------------
 */

update menu
set price = (price - (price/10))::integer
where pizza_name = 'greek pizza'
