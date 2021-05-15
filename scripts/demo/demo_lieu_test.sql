\i scripts/clear_data.sql

\echo demo lieu_test

select insert_lieu_test('labo 1', 'laboratoire', '147 faurbourg saint-germain', '77777', 'Paris');
select insert_lieu_test('labo 2', 'laboratoire', '147 rue goncourt', '75000', 'Paris');
select insert_lieu_test('labo 3', 'laboratoire', '1 place de la republique', '75000', 'Paris');
select insert_lieu_test('labo 4', 'laboratoire', '55 rue des saint peres', '75006', 'Paris');


\echo recherche par nom
select found_lieu_test_by_name('labo 1');

\echo recherche par 
select found_lieu_test_by_id(2);

\echo recherche exact
select found_lieu_test_precise('labo 4', 'laboratoire', '55 rue des saint peres', '75006', 'Paris');

\echo update by id
select update_lieu_test(4, 'labo 4A', 'foo', '47 rue des saint peres', '77777', 'Nantes');

select * from lieu_test limit 10;

select fill_lieu_test(100);
select * from lieu_test limit 10;
select count(*) from lieu_test;