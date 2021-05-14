\echo Altering datestyle
SET DATESTYLE TO YMD;
SHOW DATESTYLE;

DROP TABLE IF EXISTS fake_profile;
CREATE TEMP TABLE fake_profile(
    nom varchar,
    prenom varchar,
    sexe varchar,
    domicile varchar,
    birthdate Date
);
\COPY fake_profile FROM csv_input/fake_profile.csv WITH NULL AS '' DELIMITER ','  CSV HEADER;

CREATE OR REPLACE FUNCTION fill_personne_test(nb int)
RETURNS boolean 
LANGUAGE plpgsql
AS $$
DECLARE 
    
BEGIN
    INSERT into personne_test(nom, prenom, sexe, domicile, birthdate)
        SELECT nom, prenom, sexe, domicile, birthdate from fake_profile order by random() limit nb;
    return true;
END
$$;


CREATE OR REPLACE FUNCTION eg_function(_nom varchar, _prenom varchar)
RETURNS table(n varchar, p varchar)
LANGUAGE plpgsql
AS $$
DECLARE 
    
BEGIN
    return query select n, p FROM personne_test where nom = _nom and prenom = _prenom;
END
$$;


PREPARE draw_profile(int) AS
    select * from fake_profile order by random() limit $1;

