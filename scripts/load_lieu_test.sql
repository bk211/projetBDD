\echo >Loading table lieu_test 

\echo Altering datestyle
SET DATESTYLE TO YMD;
SHOW DATESTYLE;


DROP TABLE IF EXISTS prep_donnee_labo;
CREATE TEMP TABLE prep_donnee_labo(
    finess_associe varchar,
    titre varchar,
    type_de_test varchar,
    "adresse_voie 1" varchar,
    "adresse_voie 2" varchar,
    adresse_codepostale varchar,
    adresse_ville varchar, 
    modalite_accueil varchar,
    "telephone(s)" varchar   
);

\COPY prep_donnee_labo FROM csv_input/santefr-lieux-depistage-covid-laboratoires.csv WITH NULL AS '' DELIMITER ';'  CSV HEADER;


--drop function fill_lieu_test;
CREATE OR REPLACE FUNCTION fill_lieu_test(nb int)
RETURNS boolean
LANGUAGE plpgsql
AS $$
DECLARE
BEGIN
    INSERT into lieu_test(nom_lieu, type_lieu, adresse, code_postal, adresse_ville)
        SELECT DISTINCT titre, 'laboratoire', "adresse_voie 1", adresse_codepostale, adresse_ville from prep_donnee_labo order by titre limit nb
        ON CONFLICT ON CONSTRAINT unique_v DO NOTHING;
    return true;
END
$$;
