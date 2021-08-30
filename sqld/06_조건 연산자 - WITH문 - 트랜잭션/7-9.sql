SELECT
	FILM_ID
	, TITLE
	, RATING
	, LENGTH
	, RANK() OVER ( PARTITION BY RATING ORDER BY LENGTH DESC) LENGTH_RANK
FROM
	FILM
;	

WITH TMP1 AS  (
SELECT
	  FILM_ID
	, TITLE
	, RATING
	, LENGTH
	, RANK() OVER ( PARTITION BY RATING ORDER BY LENGTH DESC) LENGTH_RANK
FROM
	FILM	
)
SELECT *
FROM TMP1
WHERE LENGTH_RANK = 1;

|film_id|title             |rating|length|length_rank
|-------|------------------|------|------|-----------
|    182|Control Anthem    |G     |   185|          1
|    212|Darn Forrester    |G     |   185|          1
|    609|Muscle Bright     |G     |   185|          1
|    991|Worst Banger      |PG    |   185|          1
|    141|Chicago North     |PG-13 |   185|          1
|    349|Gangs Pride       |PG-13 |   185|          1
|    690|Pond Seattle      |PG-13 |   185|          1
|    817|Soldiers Evolution|R     |   185|          1
|    426|Home Pity         |R     |   185|          1
|    872|Sweet Brotherhood |R     |   185|          1
|    821|Sorority Queen    |NC-17 |   184|          1
|    499|King Evolution    |NC-17 |   184|          1
|    820|Sons Interview    |NC-17 |   184|          1
|    198|Crystal Breaking  |NC-17 |   184|          1