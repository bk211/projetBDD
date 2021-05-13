\echo Altering datestyle
SET DATESTYLE TO YMD;
--SHOW DATESTYLE;

--select * from test;

DROP TABLE IF EXISTS variant_prob;
CREATE TABLE variant_prob(
    variant varchar PRIMARY KEY,
    lower_prob int NOT NULL DEFAULT 0,
    upper_prob int NOT NULL DEFAULT 0
);

\COPY variant_prob from csv_input/variant_prob.csv WITH DELIMITER ';'  CSV HEADER;

--select * from variant_prob;


CREATE OR REPLACE FUNCTION draw_variant()
RETURNS 
Table(nom_variant varchar)
LANGUAGE plpgsql
AS $$
DECLARE
    random_nb int;
BEGIN
    random_nb := get_random_number(1,100);
    raise notice 'chosen number: %', random_nb;

    return
        query select variant from variant_prob where lower_prob < random_nb and upper_prob > random_nb;
END
$$;

--select draw_variant();



DROP TABLE IF EXISTS pool_lieu_tests;

CREATE TABLE pool_lieu_tests (LIKE lieu_test INCLUDING ALL);

CREATE OR REPLACE FUNCTION fill_pool_lieu_test(nb int)
RETURNS boolean
LANGUAGE plpgsql
AS $$
DECLARE
    counter int;
    curs_lieu_test CURSOR FOR SELECT * FROM lieu_test;
    lieu lieu_test%ROWTYPE;
BEGIN
    counter :=0;
    FOR lieu IN curs_lieu_test LOOP
        raise notice 'counter = %', counter;
        INSERT into pool_lieu_tests values(lieu.id_lieu,lieu.nom_lieu, lieu.type_lieu, lieu.adresse, lieu.code_postal, lieu.adresse_ville);
    
        counter := counter + 1;
        IF counter >= nb THEN 
            exit;
        END IF;

    END LOOP;
    return true;
END
$$;


\echo pool_lieu_tests struct:
select fill_pool_lieu_test(10);
select * from pool_lieu_tests;


CREATE OR REPLACE FUNCTION fill(nb int)
RETURNS boolean
LANGUAGE plpgsql
AS $$
DECLARE
    curs_personne CURSOR FOR SELECT * FROM personne_test;
    --curs_lieu_test CURSOR FOR SELECT * FROM lieu_test order by random();
    counter int;
    personne personne_test%ROWTYPE;
BEGIN
    counter :=0;
    FOR personne IN curs_personne LOOP
        raise notice 'counter = %', counter;
        

        counter := counter + 1;
        IF counter > nb THEN 
            exit;
        END IF;

    END LOOP;


    return true;
END
$$;



--select fill(10);

