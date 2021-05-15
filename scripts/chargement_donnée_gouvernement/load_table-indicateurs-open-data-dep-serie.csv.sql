\echo >Loading table-indicateurs-open-data-dep-serie ...
\echo >Make sure that you are currently at projet root
\echo 
\echo >Creating table, >!Old table will be droped!<
--\echo ;
DROP TABLE IF EXISTS 
"table-indicateurs-open-data-dep-serie";
\echo >
CREATE TABLE 
"table-indicateurs-open-data-dep-serie"(
    extract_date date,
    departement varchar(10),
    region  varchar(10),
    libelle_reg varchar,
    libelle_dep varchar,
    tx_incid float,
    "R" float,
    taux_occupation_sae float,
    tx_pos float,
    tx_incid_couleur varchar(10),
    "R_couleur" varchar(10),
    taux_occupation_sae_couleur varchar(10),
    tx_pos_couleur varchar(10),
    nb_orange int,
    nb_rouge int
);

\echo Altering datestyle
SET DATESTYLE TO YMD;
SHOW DATESTYLE;


\COPY "table-indicateurs-open-data-dep-serie" FROM csv_input/table-indicateurs-open-data-dep-serie.csv WITH NULL AS '' DELIMITER ','  CSV HEADER;