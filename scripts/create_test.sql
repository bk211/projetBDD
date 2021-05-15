\echo >Creation de la  table test 
\echo >Faites en sorte de vous placer dans le répertoire racine du projet 
DROP TABLE IF EXISTS test cascade;
\echo >
CREATE TABLE test(
    id_test SERIAL PRIMARY KEY,
    id_lieu int,
    id_personne int,
    resultat int,
    variant varchar,
    date Date
);


\echo =>Fin du script create_test 
