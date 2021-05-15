\i scripts/clear_data.sql

\echo demo personne_test
\echo insertion via prepare insert_personne_test 
EXECUTE insert_personne_test('Dupont', 'Pierre', 'M', '15 rue sophie germain', '1997-11-11');
EXECUTE insert_personne_test('Durand', 'Marie', 'F', '15 rue sophie germain', '2000-11-11');

select * from personne_test limit 100;

\echo recherche via nom, prenom de Dupont Pierre
EXECUTE found_personne_test_by_name('Dupont', 'Pierre');

\echo recherche via age de personne comprise entre 10 et 21 ans
EXECUTE found_personne_test_by_age(10,21);

\echo update Dupont Marie 
EXECUTE update_personne_test(2, 'Durand', 'Marie-pierre', 'X', '158 rue loremipsum', '1999-11-11');

select * from personne_test limit 100;


\echo ======================================
\echo demo chargement de fausse donnee
\i scripts/load_personne_test.sql
\echo chargement de 1000 profile;
select fill_personne_test(1000);
\echo personne_test head 10
select * from personne_test limit 10;
\echo personne_test row count 
select count(*) from personne_test;
