\i scripts/create_test.sql
\i scripts/load_prepares.sql

\echo demo test
truncate table test;

select * from test limit 10 ;
select insert_test(2, 1, 1, 'CN', '2020-06-01');
select insert_test(2, 2, 1, 'FR', '2020-09-01');
select insert_test(2, 3, 0, 'US', '2020-07-01');
select insert_test(2, 4, 1, 'UK', '2020-08-01');
select insert_test(2, 5, 1, 'RU', '2020-09-01');

select * from test;


\echo recherche par resultat positif
select found_test_by_resultat(1);

\echo recherche par id
select found_test_by_id(2);

\echo recherche exact
select found_test_precise(2,2,1,'FR', '2020-09-01');

\echo update by id
select update_test(4, 2, 4, 0, 'UK', '2029-01-01');

\i scripts/load_test.sql
select fill_test(1000);
select * from test limit 10;
select count(*) from lieu_test;


