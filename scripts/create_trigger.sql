\echo Chargement de trigger
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

\echo Fin de chargement de trigger