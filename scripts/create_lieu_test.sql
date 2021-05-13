\echo >Loading table lieu_test 
\echo >Make sure that you are currently at projet root
\echo 
\echo >Creating table, >!Old table will be droped!<
--\echo ;
DROP TABLE IF EXISTS lieu_test;
\echo >
CREATE TABLE lieu_test(
    id_lieu SERIAL PRIMARY KEY,
    nom_lieu varchar,
    type_lieu varchar,
    adresse varchar,
    code_postal varchar,
    adresse_ville varchar,
    UNIQUE(nom_lieu, type_lieu, adresse, code_postal, adresse_ville)
);


