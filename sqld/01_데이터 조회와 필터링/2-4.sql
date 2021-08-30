SELECT
       LAST_NAME --3
     , FIRST_NAME
  FROM
       CUSTOMER --1
 WHERE
       FIRST_NAME = 'Jamie'; --2
-----------------------------------------------
SELECT
	  LAST_NAME
	, FIRST_NAME
  FROM
	 CUSTOMER
WHERE
  	 FIRST_NAME = 'Jamie'
 AND LAST_NAME = 'Rice';
--------------------------------------------------
SELECT
	   CUSTOMER_ID
	 , AMOUNT
	 , PAYMENT_DATE
  FROM
	   PAYMENT
 WHERE AMOUNT <= 1
	OR AMOUNT >= 8
;
-----------------------------------------------------
      