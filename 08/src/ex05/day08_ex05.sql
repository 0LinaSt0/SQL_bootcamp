/*
 * PHANTOM READS PATTERN:
 * 	Then run the same query twice (or two queries seeking the same data),
 * 	and you get different results
 *
 *
 * session #1 (x)
 * 	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * 		 		 select 			select  	    SELECT
 * 	begin		  sum()				 sum()	commit	 sum()
 * 	  | 		    | 				   | 	  | 	  |
 * ---x---o---------x--o-------o-------x------x-------x---o--> time_scale
 * 		  | 		   | 	   | 						  |
 * 		begin 		 update  commit 					SELECT
 * 		 												 sum()
 * 	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * session #2 (o)
 * ______________________________
 * Finale Caps Lock SELECTS are finale result
 */


-- SESSION #1

/*step_1*/ \echo "====> SESSION #1";

--possible to write just begin because read committed is default way
/*step_2*/	begin transaction isolation level read committed;

/*step_3*/	select sum(rating) from pizzeria where name = 'Pizza Hut';

/*step_6*/	select sum(rating) from pizzeria where name = 'Pizza Hut';
/*step_7*/	commit;
/*step_8*/	select sum(rating) from pizzeria where name = 'Pizza Hut';


-- SESSION #2

/*step_1*/	\echo "====> SESSION #2";

--possible to write just begin because read committed is default way
/*step_2*/	begin transaction isolation level read committed;

/*step_4*/	update pizzeria set rating = 1 where name = 'Pizza Hut';
/*step_5*/	commit;

/*step_9*/	select sum(rating) from pizzeria where name = 'Pizza Hut';
