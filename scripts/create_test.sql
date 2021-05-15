\echo >Loading table test 
\echo >Make sure that you are currently at projet root
\echo 
\echo >Creating table, >!Old table will be droped!<
--\echo ;
DROP TABLE IF EXISTS test cascade;
\echo >
CREATE TABLE test(
    id_test SERIAL PRIMARY KEY,
    id_lieu int,
    id_personne int,
    resultat int,
    variant varchar,
    date Date
);


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

