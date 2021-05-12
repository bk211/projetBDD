\echo >Loading table personne_test 
\echo >Make sure that you are currently at projet root
\echo 
\echo >Creating table, >!Old table will be droped!<
--\echo ;
DROP TABLE IF EXISTS personne_test;
\echo >
CREATE TABLE personne_test(
    id_personne SERIAL PRIMARY KEY,
    nom varchar,
    prenom varchar,
    sexe varchar,
    age int,
    domicile varchar,
    date Date
);

\echo Altering datestyle
SET DATESTYLE TO YMD;
SHOW DATESTYLE;

