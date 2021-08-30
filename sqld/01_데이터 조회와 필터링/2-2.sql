SELECT 
       FIRST_NAME
     , LAST_NAME
  FROM 
       CUSTOMER
 ORDER BY FIRST_NAME ASC
 ;
--------------------------------------------
SELECT 
       FIRST_NAME
     , LAST_NAME
  FROM 
       CUSTOMER
 ORDER BY FIRST_NAME DESC
 ;
--------------------------------------------
SELECT 
       FIRST_NAME --asc --오름차순 --순차적
     , LAST_NAME --desc --내림차순 --역순
  FROM 
       CUSTOMER
 ORDER BY FIRST_NAME ASC --가독성
       ,  LAST_NAME DESC
 ;
--------------------------------------------
SELECT 
       FIRST_NAME --asc --오름차순 --순차적
     , LAST_NAME --desc --내림차순 --역순
  FROM 
       CUSTOMER
 ORDER BY 1 ASC
       ,  2 DESC
 ;

