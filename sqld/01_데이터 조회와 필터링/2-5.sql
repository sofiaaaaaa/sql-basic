SELECT
	   FILM_ID
	 , TITLE
	 , RELEASE_YEAR
  FROM
	   FILM
ORDER BY FILM_ID --ORDER BY를 한 결과중에서 
   LIMIT 5 ; --5건만 
--------------------------------------
SELECT
       FILM_ID
     , TITLE
     , RELEASE_YEAR
  FROM
       FILM
ORDER BY FILM_ID
   LIMIT 4
  OFFSET 3;
;
-----------------------------------------
SELECT
       FILM_ID
     , TITLE
     , RENTAL_RATE
  FROM
       FILM
ORDER BY RENTAL_RATE DESC
   LIMIT 10
;