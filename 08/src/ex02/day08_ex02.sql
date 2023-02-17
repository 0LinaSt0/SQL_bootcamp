/*
 * Repeatable read - the same as 'Read committed' but in this case if
 * 					 row was updated in between by another transaction
 * 					 there not be changes in current transaction.
 * 					 It decides non-repeatable problem.
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

/*step_2*/	begin transaction isolation level repeatable read;

/*step_3*/	select * from pizzeria where name = 'Pizza Hut';
/*step_5*/	update pizzeria set raitin = 4 where name = 'Pizza Hut';
/*step_7*/	commit;
/*step_9*/	select * from pizzeria where name = 'Pizza Hut';


-- SESSION #2

/*step_1*/	\echo "====> SESSION #2";

/*step_2*/	begin transaction isolation level repeatable read;

/*step_4*/	select * from pizzeria where name = 'Pizza Hut';
/*step_6*/	update pizzeria set raitin = 3.6 where name = 'Pizza Hut';
/*step_8*/	commit;
/*step_10*/	select * from pizzeria where name = 'Pizza Hut';
