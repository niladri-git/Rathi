\echo DROP TABLES
\echo
\i drp_tbl_trd.sql;

\echo
\echo CREATE TABLES
\echo
\i crt_tab_trd.sql;

\echo INSERT INIT Trades
\echo
\i ins_init_trds.sql;

\echo
\echo TOTAL TRADES
SELECT count(*) FROM TRADE;

\echo CALCULATE POSITIONS
\echo
\i crt_tab_pos.sql;

/*

\echo
\echo INSERT EXPIRY
\i ins_exp.sql;

*/