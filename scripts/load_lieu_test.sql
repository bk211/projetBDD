\echo >Loading table lieu_test 

\echo Altering datestyle
SET DATESTYLE TO YMD;
SHOW DATESTYLE;


DROP TABLE IF EXISTS prep_donnee_labo;
CREATE TEMP TABLE prep_donnee_labo(
    finess_associe varchar,
    titre varchar,
    type_de_test varchar,
    adresse_voir_1 varchar,
    adresse_voir_2 varchar,
    adresse_codepostale varchar,
    adresse_ville varchar, 
    modalite_accueil varchar,
    "telephone(s)" varchar   

);
\echo 

\COPY prep_donnee_labo FROM csv_input/santefr-lieux-depistage-covid-laboratoires.csv WITH NULL AS '' DELIMITER ';'  CSV HEADER;


INSERT INTO lieu_test(nom_lieu, type_lieu, numero_adresse, nom_rue, code_postal, nom_commune)
SELECT 
--INSERT into personne_test(nom, prenom, sexe, domicile, birthdate)
--SELECT nom, prenom, sexe, domicile, birthdate from prep_donne_labo;


