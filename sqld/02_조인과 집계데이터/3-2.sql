SELECT
       A.ID ID_A
     , A.FRUIT FRUIT_A
     , B.ID ID_B
     , B.FRUIT FRUIT_B
  FROM BASKET_A A
INNER JOIN BASKET_B B 
   ON A.FRUIT = B.FRUIT;
  
  
  
  
  
  
  
  
  
  
--------------------------------------------------------
SELECT
       A.CUSTOMER_ID, A.FIRST_NAME
     , A.LAST_NAME, A.EMAIL
     , B.AMOUNT, B.PAYMENT_DATE
  FROM CUSTOMER A 
 INNER JOIN PAYMENT B 
ON A.CUSTOMER_ID = B.CUSTOMER_ID;

--고객 여러건의 결제를 할수있다. 고객1:결제M -> 1:M 관계 된다. 
SELECT count(*) FROM PAYMENT; 











--------------------------------------------------------
SELECT
       A.CUSTOMER_ID, A.FIRST_NAME
     , A.LAST_NAME, A.EMAIL
     , B.AMOUNT, B.PAYMENT_DATE
  FROM CUSTOMER A 
INNER JOIN PAYMENT B 
ON A.CUSTOMER_ID = B.CUSTOMER_ID
WHERE A.CUSTOMER_ID = 4;










--------------------------------------------------------
SELECT
       A.CUSTOMER_ID, A.FIRST_NAME
     , A.LAST_NAME, A.EMAIL
     , B.AMOUNT, B.PAYMENT_DATE
     , C.FIRST_NAME AS S_FIRST_NAME 
     , C.LAST_NAME AS S_LAST_NAME
  FROM CUSTOMER A 
INNER JOIN PAYMENT B 
ON A.CUSTOMER_ID = B.CUSTOMER_ID
INNER JOIN STAFF C 
ON B.STAFF_ID = C.STAFF_ID;

고객1:결제m:직원1

