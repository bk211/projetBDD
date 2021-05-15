\echo Chargement des fonctions
-- calcule l'age d'une personne avec sa date de naissance
CREATE OR REPLACE FUNCTION 
get_age_from_date(_date text)
RETURNS INT 
LANGUAGE plpgsql
AS $$
DECLARE 
    resultat int;
BEGIN
    return 
    date_part('year', age(_date::date))::int;
END
$$;

-- choisit un nombre comprise entre inf et sup excluse
CREATE OR REPLACE FUNCTION get_random_number(int, int) RETURNS integer AS
$$
BEGIN
	RETURN trunc(random() * ($2-$1) + $1);
END;
$$
LANGUAGE plpgsql;


-- choisit au hasard une date entre le debut et la fin excluse
CREATE OR REPLACE FUNCTION 
get_random_date(_begin date,_end date)
RETURNS date
LANGUAGE plpgsql
AS $$
DECLARE 
    resultat date;
    interval int;
    random_day int;
BEGIN
    interval := _end - _begin;
    random_day := get_random_number(0, interval);
    resultat := _begin + random_day;
    return resultat;
END
$$;


--SELECT get_random_date('2010-01-01', '2020-01-01');
--SELECT get_random_number(2,5);


--Fonctions liées à lieu_test
CREATE OR REPLACE FUNCTION insert_lieu_test(_nom_lieu varchar, _type_lieu varchar, _adresse varchar, _code_postal varchar, _adresse_ville varchar)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
    insert into lieu_test(nom_lieu, type_lieu, adresse, code_postal, adresse_ville) values(_nom_lieu, _type_lieu, _adresse, _code_postal, _adresse_ville);
END
$$;


CREATE OR REPLACE FUNCTION found_lieu_test_by_name(_nom_lieu varchar)
RETURNS table(like lieu_test)
LANGUAGE plpgsql
AS $$
BEGIN

    return query
    select * from lieu_test where nom_lieu = _nom_lieu;
END
$$;

CREATE OR REPLACE FUNCTION found_lieu_test_by_id(_id_lieu int)
RETURNS table(like lieu_test)
LANGUAGE plpgsql
AS $$
BEGIN

    return query
    select * from lieu_test where id_lieu = _id_lieu;
END
$$;

CREATE OR REPLACE FUNCTION found_lieu_test_precise(_nom_lieu varchar, _type_lieu varchar, _adresse varchar, _code_postal varchar, _adresse_ville varchar)
RETURNS table(like lieu_test)
LANGUAGE plpgsql
AS $$
BEGIN

    return query
    select * from lieu_test where nom_lieu = _nom_lieu and type_lieu = _type_lieu and adresse = _adresse_ville and code_postal = _code_postal and adresse_ville = _adresse_ville   ;
END
$$;


CREATE OR REPLACE FUNCTION update_lieu_test(_id_lieu int,_nom_lieu varchar, _type_lieu varchar, _adresse varchar, _code_postal varchar, _adresse_ville varchar)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE lieu_test
    SET nom_lieu = _nom_lieu, type_lieu = _type_lieu, adresse = _adresse, code_postal = _code_postal, adresse_ville = _adresse_ville
    WHERE id_lieu = _id_lieu;
END
$$;


--Fonctions liées à test

CREATE OR REPLACE FUNCTION insert_test(_id_lieu int,_id_personne int,_resultat int,_variant varchar,_date Date)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
    insert into test(id_lieu,id_personne, resultat, variant, date) values(_id_lieu,_id_personne, _resultat, _variant, _date);
END
$$;

CREATE OR REPLACE FUNCTION found_test_by_resultat(_resultat int)
RETURNS table(like test)
LANGUAGE plpgsql
AS $$
BEGIN
    return query
    select * from test where resultat = _resultat;
END
$$;

CREATE OR REPLACE FUNCTION found_test_by_id(_id_test int)
RETURNS table(like test)
LANGUAGE plpgsql
AS $$
BEGIN
    return query
    select * from test where id_test = _id_test;
END
$$;

CREATE OR REPLACE FUNCTION found_test_precise(_id_lieu int,_id_personne int,_resultat int,_variant varchar,_date Date)
RETURNS table(like test)
LANGUAGE plpgsql
AS $$
BEGIN
    return query
    select * from test where id_lieu = _id_lieu and id_personne = _id_personne and resultat = _resultat and variant=  _variant and date =_date;
END
$$;

CREATE OR REPLACE FUNCTION update_test(_id_test int,_id_lieu int,_id_personne int,_resultat int,_variant varchar,_date Date)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE test
    SET id_lieu = _id_lieu, id_personne =  id_personne, resultat = resultat, variant = _variant, date = _date
    WHERE id_test = _id_test;
END
$$;

\echo =>Fin de chargement des fonctions