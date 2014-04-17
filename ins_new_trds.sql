\echo Delete old Trade Backup
DROP TABLE IF EXISTS TRADE_BAK;

\echo
\echo Create new Trade Backup
CREATE TABLE TRADE_BAK AS
	SELECT * FROM TRADE;

\echo
\echo INSERT New Trades
\echo

\i ins_trd_01-04.sql;
\i ins_trd_02-04.sql;
\i ins_trd_04-04.sql;

\i ins_trd_09-04.sql;
\i ins_trd_15-04.sql;
\i ins_trd_16-04.sql;

\echo
\echo TOTAL TRADES
SELECT count(*) FROM TRADE;

\echo CALCULATE POSITIONS
\echo
\i crt_tab_pos.sql;
