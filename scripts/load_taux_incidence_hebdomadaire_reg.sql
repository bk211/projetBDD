\echo >Loading taux_incidence_hebdomadaire par region
\echo >Make sure that you are currently at projet root
\echo 
\echo >Creating table, >!Old table will be droped!<
--\echo ;
DROP TABLE IF EXISTS taux_incidence_heb_reg;
\echo >
CREATE TABLE taux_incidence_heb_reg(
    reg char(10),
    week varchar,
    "P_f" int,
    "P_h" int,
    "P" int,
    pop_f float,
    pop_h float,
    cl_age90 int,
    pop float,
    week_first_day date DEFAULT NULL
);


\echo Altering datestyle
SET DATESTYLE TO YMD;
SHOW DATESTYLE;

\COPY taux_incidence_heb_reg(reg, week, "P_f", "P_h","P",pop_f,pop_h,cl_age90,pop) FROM csv_input/sp-pe-tb-heb-reg-2021-05-11-19h06.csv WITH NULL AS '' DELIMITER ';'  CSV HEADER;