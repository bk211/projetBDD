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
    birthdate Date,
    UNIQUE(nom, prenom, sexe, age, domicile, birthdate)
);


\echo creating trigger function find age
CREATE OR REPLACE FUNCTION trigger_find_age()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    NEW.age := get_age_from_date(NEW.birthdate::text);
    return NEW;
END
$$;

DROP TRIGGER IF EXISTS trigger_personne_test_update_age on personne_test;
CREATE TRIGGER trigger_personne_test_update_age
BEFORE INSERT OR UPDATE
ON personne_test
FOR EACH ROW
EXECUTE PROCEDURE trigger_find_age();