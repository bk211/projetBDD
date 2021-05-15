\echo peuplement de la table personne_test
\i scripts/load_personne_test.sql


\echo peuplement de la table lieu_test
\i scripts/load_lieu_test.sql

\echo peuplement de la table test
\i scripts/load_test.sql

select fill_personne_test(1000);
select count(*) from personne_test;
select fill_lieu_test(100);
select count(*) from lieu_test;
select fill_test(1000);
select count(*) from test;