\i scripts/create_lieu_test.sql
\i scripts/load_prepares.sql

\echo demo lieu_test
truncate table lieu_test;

select * from lieu_test;
select insert_lieu_test('labo 1', 'laboratoire', '147 faurbourg saint-germain', '77777', 'Paris');
select insert_lieu_test('labo 2', 'laboratoire', '147 rue goncourt', '75000', 'Paris');
select insert_lieu_test('labo 3', 'laboratoire', '1 place de la republique', '75000', 'Paris');
select insert_lieu_test('labo 4', 'laboratoire', '55 rue des saint peres', '75006', 'Paris');

select * from lieu_test;
