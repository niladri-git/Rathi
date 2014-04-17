\echo Drop Buggy Trade Table
DROP TABLE TRADE;

\echo
\echo Restore Trades from Backup
CREATE TABLE TRADE AS
	SELECT * FROM TRADE_BAK;

\echo
\echo Set value for trade_id_seq to

\set counter `psql -d Anand.DB -t -c "SELECT count(*) + 1 from TRADE_BAK;" `
\echo :counter

\echo
DROP SEQUENCE IF EXISTS trade_id_seq;
CREATE SEQUENCE trade_id_seq START WITH :counter;
ALTER TABLE TRADE ALTER COLUMN id SET DEFAULT nextval('trade_id_seq');

\echo	
\echo Total Restored Trades
SELECT count(*) FROM TRADE;
