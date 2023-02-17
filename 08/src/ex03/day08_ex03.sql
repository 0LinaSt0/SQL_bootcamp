/*
 * NON_REPEATABLE ANOMALY:
 * 	Then transaction read a row and then reads it again a bit later
 * 	but gets a different result because row was updated in between
 * 	by another transaction
 *
 *
 * session #1 (x)
 * 	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * 	begin 		 select 			select  commit  SELECT
 * 	  | 		    | 				   | 	  | 	  |
 * ---x---o---------x--o-------o-------x------x-------x---o--> time_scale
 * 		  | 		   | 	   | 						  |
 * 		begin 		 update  commit 					SELECT
 * 	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * session #2 (o)
 * ______________________________
 * Finale Caps Lock SELECTS are finale result
 */


-- SESSION #1

/*step_1*/	\echo "====> SESSION #1"

--possible to write just begin because read committed is default way
/*step_2*/	begin transaction isolation level read committed;

/*step_3*/	select rating from pizzeria where name = 'Pizza Hut';

/*step_6*/	select rating from pizzeria where name = 'Pizza Hut';
/*step_7*/	commit;
/*step_8*/	select rating from pizzeria where name = 'Pizza Hut';


-- SESSION #2

/*step_1*/	\echo "====> SESSION #2"

--possible to write just begin because read committed is default way
/*step_2*/	begin transaction isolation level read committed;

/*step_4*/	update pizzeria set rating = 3.6 where name = 'Pizza Hut';
/*step_5*/	commit;

/*step_9*/	select rating from pizzeria where name = 'Pizza Hut';
