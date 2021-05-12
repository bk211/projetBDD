
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