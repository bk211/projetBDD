\echo >Loading sp-pe-tb-quot-reg-2021-05-09-19h05.csv ...
\echo >Make sure that you are currently at projet root
\echo
\echo >Creating table, >!Old table will be droped!<
\echo
DROP TABLE IF EXISTS "sp-pe-tb-quot-reg-2021-05-09-19h05";
\echo >
CREATE TABLE "sp-pe-tb-quot-reg-2021-05-09-19h05"(
    dep char(10),
    red char(10),
    fra char(110),
    jour Date,
    week Date,
    pop int,
    t int,
    cl_age90 int,
    p int,
    p_h int,
    t_h int,
    p_f int,
    t_f int,
    tx_std int
)

