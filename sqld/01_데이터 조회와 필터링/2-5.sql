SELECT
	   FILM_ID
	 , TITLE
	 , RELEASE_YEAR
  FROM
	   FILM
ORDER BY FILM_ID --ORDER BY�� �� ����߿��� 
   LIMIT 5 ; --5�Ǹ� 
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