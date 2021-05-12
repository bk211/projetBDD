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


