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


INSERT into personne_test(nom, prenom, sexe, domicile, birthdate)
SELECT nom, prenom, sexe, domicile, birthdate from fake_profile;


PREPARE insert_personne_test(varchar, varchar, varchar, varchar, varchar) as
    INSERT into personne_test(nom, prenom, sexe, domicile, birthdate) 
        VALUES($1, $2, $3, $4, $5::date)

PREPARE found_personne_test(varchar, varchar) as
    SELECT * from personne_test where nom =$1 and prenom = $2;
