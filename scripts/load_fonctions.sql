
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