/*
 * LOST UPDATES ANOMALY:
 * 	Updates performed in one transaction can br lost or overwritten
 * 	by another transaction that happens to run concurrently
 *
 * Read committed - on this level query sees only data committed before
 * 					the query began. If ther was changed some row in another
 * 					transaction (with commit statement) reault will be updated
 * 					in current transaction too.
 *
 *
 * session #1 (x)
 * 	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * 	begin 	   select 	   update 		commit 		SELECT
 * 	  | 		  | 		  | 		   | 		   |
 * ---x---o-------x--o--------x--o---------x--o--------x--o--> time_scale
 * 		  | 		 | 			 | 			  |  		  |
 * 		begin 	   select 	   update 		commit 		SELECT
 * 	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * session #2 (o)
 * ______________________________
 * Finale Caps Lock SELECTS are finale result
 */


-- SESSION #1

/*step_1*/	\echo "====> SESSION #1";

/*step_2*/	show transaction isolation level;
/*step_3*/	begin;

/*step_4*/	select * from pizzeria where name = 'Pizza Hut';
/*step_6*/	update pizzeria set raitin = 4 where name = 'Pizza Hut';
/*step_8*/	commit;
/*step_10*/	select * from pizzeria where name = 'Pizza Hut';


-- SESSION #2

/*step_1*/	\echo "====> SESSION #2";

/*step_2*/	show transaction isolation level;
/*step_3*/	begin;

/*step_5*/	select * from pizzeria where name = 'Pizza Hut';
/*step_7*/	update pizzeria set raitin = 3.6 where name = 'Pizza Hut';
/*step_9*/	commit;
/*step_11*/	select * from pizzeria where name = 'Pizza Hut';
