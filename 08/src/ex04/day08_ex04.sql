/*
 * SERIALIZABLE - this isolation level provides the strictest transaction isolation:
 * 				  emulates serial transaction execution for all committed transactions.
 * 				  as if transactions had been executed one after another, serially,
 * 				  rather than concurrently.
 * 				  It works exactly the same as Repeatable Read except that it monitors
 * 				  for conditions which could make execution of a concurrent set of serializable
 * 				  transactions.
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

/*step_1*/ \echo "====> SESSION #1"

/*step_2*/ 	begin transaction isolation level serializable;

/*step_3*/	select rating from pizzeria where name = 'Pizza Hut';

/*step_6*/	select rating from pizzeria where name = 'Pizza Hut';
/*step_7*/	commit;
/*step_8*/	select rating from pizzeria where name = 'Pizza Hut';


-- SESSION #2

/*step_1*/	\echo "====> SESSION #2"

/*step_2*/	begin transaction isolation level serializable;

/*step_4*/	update pizzeria set rating = 3.6 where name = 'Pizza Hut';
/*step_5*/	commit;

/*step_9*/	select rating from pizzeria where name = 'Pizza Hut';
