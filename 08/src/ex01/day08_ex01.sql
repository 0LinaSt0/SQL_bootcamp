/*
 * LOST UPDATES ANOMALY:
 * 	Updates performed in one transaction can br lost or overwritten
 * 	by another transaction that happens to run concurrently
 *
 * Read committed - on this level query sees only data committed before
 * 					the query began. If ther was changed some row in another
 * 					transaction (with commit statement) reault will be updated
 * 					in current transaction too.
 */


-- SESSION #1

/*step_1*/ \echo "====> SESSION #1";

/*step_2*/ show transaction isolation level;

/*step_3*/ select * from pizzeria where name = 'Pizza Hut';
/*step_4*/ update pizzeria set raitin = 4 where name = 'Pizza Hut';
/*step_5*/ commit;
/*step_6*/ select * from pizzeria where name = 'Pizza Hut';


-- SESSION #2

/*step_1*/ \echo "====> SESSION #2";

/*step_2*/ show transaction isolation level;

/*step_3*/ select * from pizzeria where name = 'Pizza Hut';
/*step_4*/ update pizzeria set raitin = 3.6 where name = 'Pizza Hut';
/*step_5*/ commit;
/*step_6*/ select * from pizzeria where name = 'Pizza Hut';
