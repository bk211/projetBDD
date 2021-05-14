DEALLOCATE get_column_name;
PREPARE get_column_name (text) AS
    SELECT column_name from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME =$1;


--- partie en rapport avec la table personne_test
DEALLOCATE insert_personne_test;
PREPARE insert_personne_test(varchar, varchar, varchar, varchar, varchar) AS
    INSERT into personne_test(nom, prenom, sexe, domicile, birthdate) VALUES ($1, $2, $3, $4, $5::date);


DEALLOCATE found_personne_test_by_name;
PREPARE found_personne_test_by_name(varchar, varchar) as
    SELECT * from personne_test where nom = $1 and prenom = $2;

DEALLOCATE found_personne_test_by_age;
PREPARE found_personne_test_by_age(int, int) as
    SELECT * from personne_test where age >= $1 and age <=$2;


DEALLOCATE update_personne_test;
PREPARE update_personne_test(int,varchar, varchar, varchar, varchar, varchar) AS
    UPDATE personne_test 
        SET nom = $2, prenom = $3, sexe = $4, domicile = $5, birthdate =$6::date
        where id_personne = $1;


DEALLOCATE delete_personne_test;
PREPARE delete_personne_test(int) AS
    DELETE FROM personne_test where id_personne = $1;


-- partie en rapport avec lieu_test

DEALLOCATE insert_personne_test;
PREPARE insert_personne_test(varchar, varchar, varchar, varchar, varchar) AS
    INSERT into personne_test(nom, prenom, sexe, domicile, birthdate) VALUES ($1, $2, $3, $4, $5::date);


DEALLOCATE found_personne_test_by_name;
PREPARE found_personne_test_by_name(varchar, varchar) as
    SELECT * from personne_test where nom = $1 and prenom = $2;

DEALLOCATE found_personne_test_by_age;
PREPARE found_personne_test_by_age(int, int) as
    SELECT * from personne_test where age >= $1 and age <=$2;


DEALLOCATE update_personne_test;
PREPARE update_personne_test(int,varchar, varchar, varchar, varchar, varchar) AS
    UPDATE personne_test 
        SET nom = $2, prenom = $3, sexe = $4, domicile = $5, birthdate =$6::date
        where id_personne = $1;


DEALLOCATE delete_personne_test;
PREPARE delete_personne_test(int) AS
    DELETE FROM personne_test where id_personne = $1;



