SELECT count(*) FROM POSITIONS;

\echo
\echo Dropping Table NET;
Drop table NET;

\echo
\echo Creating Table NET;

CREATE TABLE NET AS
	SELECT * FROM POSITIONS WHERE 
	POS != 0 AND 
	MONTH != 'MAR' AND
	MONTH != 'APR';

\echo	
SELECT * FROM NET;

\set last_td `psql -d Anand.DB -t -c "SELECT max(trd_dt) from TRADE;" `
\echo Last Trade date: :last_td