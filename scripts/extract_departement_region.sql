\echo >Loading table des departement et regions ...
\echo >Creating table, >!Old table will be droped!<
DROP TABLE IF EXISTS table_departement_region;
\echo >
CREATE TABLE 
table_departement_region(
    dep varchar PRIMARY KEY NOT NULL,
    reg varchar NOT NULL, 
    nom_departement varchar UNIQUE NOT NULL,
    nom_region varchar NOT NULL
);

INSERT INTO table_departement_region(dep, reg, nom_departement, nom_region)
SELECT DISTINCT 
departement AS dep,
region AS reg, 
libelle_dep AS nom_departement,
libelle_reg AS nom_region 
FROM "table-indicateurs-open-data-dep-serie" order by departement;
