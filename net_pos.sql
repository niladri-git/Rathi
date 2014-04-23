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
