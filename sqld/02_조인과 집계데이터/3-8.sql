SELECT * FROM payment; 

SELECT
      CUSTOMER_ID
  FROM
      PAYMENT
GROUP BY CUSTOMER_ID;

SELECT
      DISTINCT CUSTOMER_ID
  FROM
      PAYMENT
;      










--거래액이 가장 많은 고객순으로 출력 
SELECT
       CUSTOMER_ID
     , SUM(AMOUNT) AS AMOUNT_SUM
  FROM
       PAYMENT
GROUP BY CUSTOMER_ID
ORDER BY SUM(AMOUNT) DESC;

SELECT
       CUSTOMER_ID
     , SUM(AMOUNT) AS AMOUNT_SUM
  FROM
       PAYMENT
GROUP BY CUSTOMER_ID
ORDER BY AMOUNT_SUM DESC;

SELECT
       CUSTOMER_ID
     , SUM(AMOUNT) AS AMOUNT_SUM
  FROM
       PAYMENT
GROUP BY CUSTOMER_ID
ORDER BY 2 DESC;





SELECT * FROM customer WHERE customer_id = 148; 






SELECT 
       STAFF_ID
     , COUNT(PAYMENT_ID) AS COUNT
  FROM PAYMENT
GROUP BY STAFF_ID;








--직원 1번, 2번 -> 1번은 이름이 하나, 2번도 이름이 하나, staff_id + fist_last + last_name => 2건 

SELECT 
       a.STAFF_ID
     , b.staff_id
     , b.first_name 
     , b.last_name
     , COUNT(a.PAYMENT_ID) AS COUNT
  FROM PAYMENT a, staff b
  WHERE a.staff_id = b.staff_id
GROUP BY a.STAFF_ID
, b.staff_id
     , b.first_name 
     , b.last_name;

SELECT * FROM staff 
WHERE STAFF_ID = 1;

SELECT * FROM staff ;













