/*
 * Transaction explanation:
 * https://www.tutorialspoint.com/postgresql/postgresql_transactions.htm
 * https://pgdash.io/blog/postgres-transactions.html
 * https://postgrespro.ru/docs/postgrespro/9.5/transaction-iso?lang=en
 */


-- SESSION #1

/*step_1*/ \echo "====> SESSION #1"

--possible to write just begin because read committed is default way
/*step_2*/ begin transaction isolation level read committed;

/*step_3*/ select * from pizzeria where name = 'Pizza Hut';
/*step_4*/ update pizzeria set rating = 5 where name = 'Pizza Hut';
/*step_5*/ commit;
/*step_6*/ select * from pizzeria where name = 'Pizza Hut';


-- SESSION #2

/*step_1*/ \echo "====> SESSION #2"

--possible to write just begin because read committed is default way
/*step_2*/ begin transaction isolation level read committed;

/*step_3*/ select * from pizzeria where name = 'Pizza Hut';
/*step_7*/ select * from pizzeria where name = 'Pizza Hut';
/*step_8*/ commit;


