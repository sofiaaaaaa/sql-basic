SELECT
       CUSTOMER_ID
     , RENTAL_ID
     , RETURN_DATE
  FROM RENTAL
 WHERE
       CUSTOMER_ID IN (1, 2)  
ORDER BY RETURN_DATE DESC;
--------------------------------------
SELECT
       CUSTOMER_ID
     , RENTAL_ID
     , RETURN_DATE
  FROM RENTAL
 WHERE
          CUSTOMER_ID = 1 
       OR CUSTOMER_ID = 2
ORDER BY RETURN_DATE DESC;
---------------------------------------
SELECT
       CUSTOMER_ID
     , RENTAL_ID
     , RETURN_DATE
  FROM RENTAL
 WHERE
       CUSTOMER_ID NOT IN (1, 2)       
ORDER BY RETURN_DATE DESC;
---------------------------------------
SELECT
      CUSTOMER_ID
     , RENTAL_ID
     , RETURN_DATE
  FROM RENTAL
 WHERE
       CUSTOMER_ID <> 1 
   AND CUSTOMER_ID <> 2
ORDER BY RETURN_DATE DESC;
----------------------------------------------------
SELECT
             CUSTOMER_ID
FROM
             RENTAL
WHERE
    CAST (RETURN_DATE AS DATE) = '2005-05-27';
-------------------------------------------------------
SELECT
      FIRST_NAME
    , LAST_NAME
 FROM CUSTOMER
WHERE CUSTOMER_ID IN (
					    SELECT
					        CUSTOMER_ID
					    FROM
					        RENTAL
					    WHERE
					        CAST (RETURN_DATE AS DATE) = '2005-05-27' 
       				);