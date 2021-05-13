\echo >Loading table test 
\echo >Make sure that you are currently at projet root
\echo 
\echo >Creating table, >!Old table will be droped!<
--\echo ;
DROP TABLE IF EXISTS test;
\echo >
CREATE TABLE test(
    id_test SERIAL PRIMARY KEY,
    id_lieu varchar,
    id_personne varchar,
    resultat int,
    variant varchar,
    date Date
);

