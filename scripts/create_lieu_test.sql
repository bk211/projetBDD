\echo >Loading table lieu_test 
\echo >Make sure that you are currently at projet root
\echo >Creating table, >!Old table will be droped!<
DROP TABLE IF EXISTS lieu_test CASCADE;
\echo >
CREATE TABLE lieu_test(
    id_lieu SERIAL PRIMARY KEY,
    nom_lieu varchar,
    type_lieu varchar,
    adresse varchar,
    code_postal varchar,
    adresse_ville varchar,
    UNIQUE(nom_lieu, type_lieu, adresse, code_postal, adresse_ville)
);




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


