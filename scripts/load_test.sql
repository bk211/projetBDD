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
    --raise notice 'chosen number: %', random_nb;
    return
        query select variant from variant_prob where lower_prob < random_nb and upper_prob > random_nb;
END
$$;

--select draw_variant();



DROP TABLE IF EXISTS pool_lieu_test;

CREATE TABLE pool_lieu_test (LIKE lieu_test INCLUDING ALL);

CREATE OR REPLACE FUNCTION fill_pool_lieu_test(nb int)
RETURNS boolean
LANGUAGE plpgsql
AS $$
DECLARE
    counter int;
    curs_lieu_test CURSOR FOR SELECT * FROM lieu_test order by random();
    lieu lieu_test%ROWTYPE;
BEGIN
    counter :=0;
    
    WHILE counter < nb LOOP
        FOR lieu IN curs_lieu_test LOOP
            --raise notice 'counter = %', counter;
            INSERT into pool_lieu_test values(lieu.id_lieu,lieu.nom_lieu, lieu.type_lieu, lieu.adresse, lieu.code_postal, lieu.adresse_ville);
    
            counter := counter + 1;
            IF counter >= nb THEN 
                exit;
            END IF;

        END LOOP;

    END LOOP;
    raise notice 'fill_pool_lieu_test completed : % row has been filled', nb;
    return true;
END
$$;

--select fill_pool_lieu_test(9);
--select * from pool_lieu_test;



CREATE OR REPLACE FUNCTION fill(nb int)
RETURNS boolean
LANGUAGE plpgsql
AS $$
DECLARE
    curs_personne CURSOR FOR SELECT id_personne FROM personne_test;
    curs_lieu_test CURSOR FOR SELECT id_lieu FROM pool_lieu_test order by random();
    counter int;
    _personne int;
    _lieu_test int;

    _resultat int;
    _variant varchar;
    _date Date;

BEGIN
    counter :=0;
    perform fill_pool_lieu_test(nb);
    open curs_lieu_test;

    FOR _personne IN curs_personne LOOP
        counter := counter + 1;
        IF counter > nb THEN 
            exit;
        END IF;
        
        fetch from curs_lieu_test into _lieu_test;
        --raise notice 'counter = %', counter;
        --raise notice 'chosen id_lieu_test: %' ,_lieu_test;
        --raise notice 'chosen id_personne: %' ,_personne;
        _resultat := get_random_number(0,1);
        --raise notice 'chosen resultat: %' ,_resultat;
        _variant := draw_variant();
        --raise notice 'chosen variant : %', _variant;
        _date := get_random_date('2020-05-01', '2021-05-01');
        --raise notice 'chosen date: %' , _date;
        
        insert into test(id_lieu, id_personne, resultat, variant, date) values(_lieu_test, _personne, _resultat,_variant, _date);


    END LOOP;


    return true;
END
$$;



select fill(10);
select * from test;