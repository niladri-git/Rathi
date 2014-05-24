\set counter `psql -d Anand.DB -t -c "SELECT count(*) + 1 from TRADE_BAK;" `
\echo :counter