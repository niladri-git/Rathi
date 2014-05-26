\echo Delete old Trade Backup
DROP TABLE IF EXISTS TRADE_BAK;

\echo
\echo Create new Trade Backup
CREATE TABLE TRADE_BAK AS
	SELECT * FROM TRADE;

\echo
\echo Updating Trades ...
\echo

\i ins_trd_26-05.sql;

\echo
\echo TOTAL TRADES
SELECT count(*) FROM TRADE;

\echo CALCULATE POSITIONS
\echo
\i crt_tab_pos.sql;
