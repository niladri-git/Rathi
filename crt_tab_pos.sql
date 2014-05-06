\echo Dropping Table POSITIONS;
Drop table IF EXISTS POSITIONS;

\echo
\echo Creating Table POSITIONS;

CREATE TABLE POSITIONS AS

	SELECT DISTINCT		
		TYPE,
		NAME, 
		MONTH,  
		SUM(TRD_QTY) as POS
	FROM 
		TRADE		
	GROUP BY
		TYPE, NAME, MONTH	
	ORDER BY
		NAME, TYPE, MONTH;
		
		
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

	
SELECT * FROM NET;
