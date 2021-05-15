\echo >Loading table des departement et regions ...
\echo >Creating table, >!Old table will be droped!<
DROP TABLE IF EXISTS table_departement_region;
\echo >
CREATE TABLE 
table_departement_region(
    code_departement varchar PRIMARY KEY NOT NULL,
    code_region varchar NOT NULL, 
    nom_departement varchar UNIQUE NOT NULL,
    nom_region varchar NOT NULL
);

INSERT INTO table_departement_region(code_departement, code_region, nom_departement, nom_region)
SELECT DISTINCT 
departement AS code_departement,
region AS code_region, 
libelle_dep AS nom_departement,
libelle_reg AS nom_region 
FROM "table-indicateurs-open-data-dep-serie" order by departement;

\echo N.B: Il y a 101 departement en France