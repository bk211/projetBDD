\echo >Creation de la table lieu_test 
\echo >Faites en sorte de vous placer dans le répertoire racine du projet 
DROP TABLE IF EXISTS lieu_test CASCADE;
CREATE TABLE lieu_test(
    id_lieu SERIAL PRIMARY KEY,
    nom_lieu varchar,
    type_lieu varchar,
    adresse varchar,
    code_postal varchar,
    adresse_ville varchar,
    CONSTRAINT unique_v UNIQUE(nom_lieu, type_lieu, adresse, code_postal, adresse_ville)
);

\echo => Fin de scripts create_lieu_test

