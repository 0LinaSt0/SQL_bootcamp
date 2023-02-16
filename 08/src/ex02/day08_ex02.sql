/*
 * Repeatable read - the same as 'Read committed' but in this case if
 * 					 row was updated in between by another transaction
 * 					 there not be changes in current transaction.
 * 					 It decides non-repeatable problem.
 */


-- SESSION #1

/*step_1*/ \echo "====> SESSION #1";

/*step_2*/ begin transaction isolation level repeatable read;

/*step_3*/ select * from pizzeria where name = 'Pizza Hut';
/*step_4*/ update pizzeria set raitin = 4 where name = 'Pizza Hut';
/*step_5*/ commit;
/*step_6*/ select * from pizzeria where name = 'Pizza Hut';


-- SESSION #2

/*step_1*/ \echo "====> SESSION #2";

/*step_2*/ begin transaction isolation level repeatable read;

/*step_3*/ select * from pizzeria where name = 'Pizza Hut';
/*step_4*/ update pizzeria set raitin = 3.6 where name = 'Pizza Hut';
/*step_5*/ commit;
/*step_6*/ select * from pizzeria where name = 'Pizza Hut';
