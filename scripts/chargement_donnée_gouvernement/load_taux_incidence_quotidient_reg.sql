\echo >Loading taux_incidence_quotidient par departement
\echo >Make sure that you are currently at projet root
\echo 
\echo >Creating table, >!Old table will be droped!<
--\echo ;
DROP TABLE IF EXISTS taux_incidence_quot_dep;
\echo >
CREATE TABLE taux_incidence_quot_dep(
    reg char(10),
    jour Date,
    "P_f" int,
    "P_h" int,
    "P" int,
    pop_f float,
    pop_h float,
    cl_age90 int,
    pop float
);

\echo Altering datestyle
SET DATESTYLE TO YMD;
SHOW DATESTYLE;


\COPY taux_incidence_quot_dep FROM csv_input/sp-pe-tb-quot-dep-2021-05-11-19h09.csv WITH NULL AS '' DELIMITER ';'  CSV HEADER;