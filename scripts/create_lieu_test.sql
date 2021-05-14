\echo >Loading table lieu_test 
\echo >Make sure that you are currently at projet root
\echo >Creating table, >!Old table will be droped!<
DROP TABLE IF EXISTS lieu_test CASCADE;
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




CREATE OR REPLACE FUNCTION insert_lieu_test(_nom_lieu varchar, _type_lieu varchar, _adresse varchar, _code_postal varchar, _adresse_ville varchar)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
    insert into lieu_test(nom_lieu, type_lieu, adresse, code_postal, adresse_ville) values(_nom_lieu, _type_lieu, _adresse, _code_postal, _adresse_ville);
END
$$;
