SELECT
  FILM_ID, TITLE
FROM FILM
EXCEPT 
SELECT DISTINCT INVENTORY.FILM_ID
     , TITLE
  FROM INVENTORY
INNER JOIN FILM 
ON FILM.FILM_ID = INVENTORY.FILM_ID
ORDER BY TITLE;


--재고가 없는 거다. 
SELECT a.film_id, a.title  
FROM film a
WHERE NOT EXISTS (
			SELECT 1 
			FROM inventory b , film c 
			WHERE b.film_id = c.film_id 
			AND a.film_id = c.film_id
);

SELECT a.film_id, a.title  
FROM film a
WHERE NOT EXISTS (
			SELECT 1 
			FROM inventory b  
			WHERE 1=1
			AND a.film_id = b.film_id
);










