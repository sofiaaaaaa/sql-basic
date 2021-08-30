 SELECT
        CUSTOMER_ID
      , PAYMENT_ID
      , AMOUNT
   FROM
        PAYMENT
  WHERE AMOUNT BETWEEN 8 AND 9;
-----------------------------------------------

  SELECT
        CUSTOMER_ID
      , PAYMENT_ID
      , AMOUNT
   FROM
        PAYMENT
WHERE amount >= 8 
AND amount <= 9
;
-------------------------------------------------------
SELECT
        CUSTOMER_ID
      , PAYMENT_ID
      , AMOUNT
   FROM
        PAYMENT
  WHERE AMOUNT NOT BETWEEN 8 AND 9;
---------------------------------------------------------- 
 SELECT
        CUSTOMER_ID
      , PAYMENT_ID
      , AMOUNT
   FROM
        PAYMENT
  WHERE AMOUNT < 8 OR amount > 9;
-------------------------------------------------
SELECT
        CUSTOMER_ID, PAYMENT_ID
      , AMOUNT         , PAYMENT_DATE
  FROM PAYMENT
 WHERE CAST(PAYMENT_DATE AS DATE) BETWEEN '2007-02-07' AND '2007-02-15';
---------------------------------------------------

SELECT
        CUSTOMER_ID, PAYMENT_ID
      , AMOUNT         , PAYMENT_DATE, to_char(PAYMENT_DATE, 'yyyy-mm-dd')
      , CAST(PAYMENT_DATE AS DATE)
  FROM PAYMENT
  WHERE to_char(PAYMENT_DATE, 'yyyy-mm-dd') BETWEEN '2007-02-07' AND '2007-02-15';
