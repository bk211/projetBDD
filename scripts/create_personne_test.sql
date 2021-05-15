\echo >Creation de la  table personne_test 
\echo >Faites en sorte de vous placer dans le répertoire racine du projet 
DROP TABLE IF EXISTS personne_test;
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
\echo =>Fin du script create_personne_test 