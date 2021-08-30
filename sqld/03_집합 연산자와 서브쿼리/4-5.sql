SELECT
      AVG(RENTAL_RATE)
 FROM
      FILM;

     
     
     
SELECT
       FILM_ID
     , TITLE
     , RENTAL_RATE
  FROM FILM
 WHERE RENTAL_RATE > 2.98
;











SELECT
       FILM_ID
     , TITLE
     , RENTAL_RATE
  FROM FILM
 WHERE RENTAL_RATE > 
 (
    SELECT
         AVG (RENTAL_RATE)
     FROM FILM 
 );














SELECT
       A.FILM_ID
     , A.TITLE
     , A.RENTAL_RATE
FROM FILM A
   , (
      SELECT
	   AVG(RENTAL_RATE) AS AVG_RENTAL_RATE
       FROM FILM
     ) B
WHERE A.RENTAL_RATE > B.AVG_RENTAL_RATE
;
















SELECT 	  
       A.FILM_ID
     , A.TITLE
     , A.RENTAL_RATE 
 FROM 
(
SELECT
       A.FILM_ID
     , A.TITLE
     , A.RENTAL_RATE
     , (
         SELECT AVG(L.RENTAL_RATE) 
           FROM FILM L
       ) AS AVG_RENTAL_RATE 
  FROM FILM A
) A
WHERE A.RENTAL_RATE > A.AVG_RENTAL_RATE;
