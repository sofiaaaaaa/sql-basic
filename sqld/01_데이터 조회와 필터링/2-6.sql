SELECT
      FILM_ID
	, TITLE
 FROM
	  FILM
ORDER BY TITLE 
FETCH FIRST ROW ONLY 
;








--------------------------------------------------
SELECT
       FILM_ID
     , TITLE
  FROM
       FILM
ORDER BY TITLE 
FETCH FIRST 1 ROW ONLY
;
----------------------------------------------------
SELECT
              FILM_ID
            , TITLE
  FROM
              FILM
ORDER BY TITLE 
     OFFSET 5 ROWS
FETCH FIRST 5 ROW ONLY
;



