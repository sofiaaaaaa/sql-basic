SELECT
	    SUM (
			CASE
		    WHEN RENTAL_RATE = 0.99 THEN 1
		    ELSE 0
	         END 
	       ) AS "C"
	  , SUM (
	        CASE
		    WHEN RENTAL_RATE = 2.99 THEN 1
		    ELSE 0
	         END ) AS "B"
	  , SUM (
	        CASE
		    WHEN RENTAL_RATE = 4.99 THEN 1
		    ELSE 0
	         END ) AS "A"
   FROM
	    FILM;
	    
|C  |B  |A  
|---|---|---
|341|323|336
;


SELECT 
	RENTAL_RATE, COUNT(*) CNT 
FROM FILM 
GROUP BY RENTAL_RATE; 


|rental_rate|cnt
|-----------|---
|       2.99|323
|       4.99|336
|       0.99|341;
 


SELECT * 
FROM 
	(
	SELECT 
		  SUM(CASE WHEN RENTAL_RATE = 0.99 THEN CNT ELSE 0 END) AS C 
		, SUM(CASE WHEN RENTAL_RATE = 2.99 THEN CNT ELSE 0 END) AS B
		, SUM(CASE WHEN RENTAL_RATE = 4.99 THEN CNT ELSE 0 END) AS A		   
	FROM 
	(
		SELECT 
			RENTAL_RATE, COUNT(*) CNT 
		FROM FILM 
		GROUP BY RENTAL_RATE
	) A
) A 
;