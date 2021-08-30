SELECT
       A.PRODUCT_NAME
     , B.GROUP_NAME
     , A.PRICE
     , ROW_NUMBER () OVER 
       ( PARTITION BY B.GROUP_NAME ORDER BY A.PRICE DESC)
 FROM PRODUCT A
INNER JOIN PRODUCT_GROUP B
        ON (A.GROUP_ID = B.GROUP_ID);

       
       
       
       
       
       
       
       
       
       
       
       
SELECT
       A.PRODUCT_NAME
     , B.GROUP_NAME
     , A.PRICE
     , RANK () OVER 
       ( PARTITION BY B.GROUP_NAME ORDER BY A.PRICE ASC  )
  FROM PRODUCT A
INNER JOIN PRODUCT_GROUP B
        ON (A.GROUP_ID = B.GROUP_ID);

       
       
       
       
       
       
       
       
       
       
       
       
       
SELECT
       A.PRODUCT_NAME
     , B.GROUP_NAME
     , A.PRICE
     , DENSE_RANK () OVER 
       ( PARTITION BY B.GROUP_NAME ORDER BY A.PRICE)
FROM PRODUCT A
INNER JOIN PRODUCT_GROUP B
        ON (A.GROUP_ID = B.GROUP_ID);
       