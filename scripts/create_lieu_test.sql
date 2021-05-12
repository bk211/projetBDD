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
    numero_adresse varchar,
    nom_rue varchar,
    code_postal varchar,
    nom_commune varchar,
    date Date,
    UNIQUE(nom_lieu, type_lieu, numero_adresse,nom_rue, code_postal, nom_commune)
);


DEALLOCATE get_column_name;
PREPARE get_column_name (text) AS
    SELECT column_name from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME =$1;
