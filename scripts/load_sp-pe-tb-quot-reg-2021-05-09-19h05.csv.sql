\echo >Loading sp-pe-tb-quot-reg-2021-05-09-19h05.csv ...
\echo >Make sure that you are currently at projet root
\echo 
\echo >Creating table, >!Old table will be droped!<
--\echo ;
DROP TABLE IF EXISTS "sp-pe-tb-quot-reg-2021-05-09-19h05";
\echo >
CREATE TABLE "sp-pe-tb-quot-reg-2021-05-09-19h05"(
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


\COPY "sp-pe-tb-quot-reg-2021-05-09-19h05" FROM csv_input/sp-pe-tb-quot-reg-2021-05-09-19h05.csv WITH NULL AS '' DELIMITER ';'  CSV HEADER;