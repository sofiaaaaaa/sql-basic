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
       FIRST_NAME --asc --�������� --������
     , LAST_NAME --desc --�������� --����
  FROM 
       CUSTOMER
 ORDER BY FIRST_NAME ASC --������
       ,  LAST_NAME DESC
 ;
--------------------------------------------
SELECT 
       FIRST_NAME --asc --�������� --������
     , LAST_NAME --desc --�������� --����
  FROM 
       CUSTOMER
 ORDER BY 1 ASC
       ,  2 DESC
 ;

