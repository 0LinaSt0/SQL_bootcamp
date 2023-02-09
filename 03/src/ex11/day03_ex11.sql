/*
 * It's possible to calculate new price as:
 *
 * 		 ___________________________
 * 		| price = price-price/10	|
 * 		 ---------------------------
 */

update menu
set price = (price - price*0.1)::bigint
where pizza_name = 'greek pizza';

-- <UNCOMMENT FOR start.sql SCRIPT>
-- select * from menu;
