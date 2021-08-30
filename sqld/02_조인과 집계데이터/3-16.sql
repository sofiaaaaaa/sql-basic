SELECT
       A.PRODUCT_NAME, B.GROUP_NAME, A.PRICE
     , FIRST_VALUE (A.PRICE) OVER 
       (PARTITION BY B.GROUP_NAME ORDER BY A.PRICE DESC 
       ) 
       AS LOWEST_PRICE_PER_GROUP
FROM PRODUCT A
INNER JOIN PRODUCT_GROUP B
        ON (A.GROUP_ID = B.GROUP_ID);

       
       
       
       
       
       
SELECT
       A.PRODUCT_NAME, B.GROUP_NAME, A.PRICE
     , LAST_VALUE (A.PRICE) OVER 
       (PARTITION BY B.GROUP_NAME ORDER BY A.PRICE DESC 
        RANGE BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING) 
        AS LOWEST_PRICE_PER_GROUP
FROM PRODUCT A
INNER JOIN PRODUCT_GROUP B
              ON (A.GROUP_ID = B.GROUP_ID);

             
             
SELECT
       A.PRODUCT_NAME, B.GROUP_NAME, A.PRICE
     , LAST_VALUE (A.PRICE) OVER 
       (PARTITION BY B.GROUP_NAME ORDER BY A.PRICE
        ) 
        AS LOWEST_PRICE_PER_GROUP
FROM PRODUCT A
INNER JOIN PRODUCT_GROUP B
              ON (A.GROUP_ID = B.GROUP_ID);
          

             
             
             
             
             
             
             
             
             
             
             
             
             
SELECT
       A.PRODUCT_NAME, B.GROUP_NAME, A.PRICE
     , LAST_VALUE (A.PRICE) OVER 
       (PARTITION BY B.GROUP_NAME ORDER BY A.PRICE        
       RANGE BETWEEN UNBOUNDED PRECEDING 
	       AND CURRENT ROW
       ) 
        AS LOWEST_PRICE_PER_GROUP
FROM PRODUCT A
INNER JOIN PRODUCT_GROUP B
              ON (A.GROUP_ID = B.GROUP_ID);
                    
             
             