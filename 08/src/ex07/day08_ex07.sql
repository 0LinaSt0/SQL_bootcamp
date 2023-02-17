/*
 * Deadlocks explanation:
 * https://www.cybertec-postgresql.com/en/postgresql-understanding-deadlocks/
 *
 *
 * session #1 (x)
 * 	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * 		 		 update 		  update
 * 	begin		where id=1		 where id=2		  COMMIT
 * 	  | 		    | 				 |				|
 * ---x--o----------x-----o----------x-----o--------x---o---> time_scale
 * 		 | 			  	  |				   |			|
 * 	   begin 		   update			 update		  COMMIT
 * 		 			 where id=2			where id=1
 * 	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * session #2 (o)
 * ______________________________________
 * Finale Caps Lock COMMITs give deadlock
 */


-- SESSION #1

/*step_1*/	\echo "====> SESSION #1"

/*step_2*/	show transaction isolation level;
/*step_3*/	begin;

/*step_4*/	update pizzeria set rating = 0 where id = 1;
/*step_6*/	update pizzeria set rating = 0 where id = 2;
/*step_8*/	commit;


-- SESSION #2

/*step_1*/	\echo "====> SESSION #2"

/*step_2*/	show transaction isolation level;
/*step_3*/	begin;

/*step_5*/	update pizzeria set rating = 0 where id = 2;
/*step_7*/	update pizzeria set rating = 0 where id = 1;
/*step_9*/	commit;
