-- 문제1번) 각 제품 가격을 5 % 줄이면 어떻게 될까요?
-- SQL >>>>>

SELECT  PRODUCTNUMBER
	  , PRODUCTNAME 
	  , RETAILPRICE 
	  , RETAILPRICE * 0.95 AS SALED_PRICE
  FROM  PRODUCTS

-- 문제2번) orders 테이블을 활용하여, 고객번호가 1001 에 해당하는 사람이
-- employeeid 가 707인 직원으로부터 산 주문의 id 와 주문 날짜를 알려주세요.
-- * 주문일자가 오름차순으로 정렬하여, 보여주세요.
-- SQL >>>>> 

SELECT ORDERNUMBER
     , DATE(ORDERDATE) AS ORDERDATE 
  FROM ORDERS O 
 WHERE CUSTOMERID = 1001
   AND EMPLOYEEID = 707
 ORDER BY ORDERDATE ASC; 

-- 문제3번) vendors 테이블을 이용하여, 벤더가 위치한 state 주가 어떻게 되는지,
-- 확인해보세요. 중복된 주가 있다면, 중복제거 후에 알려주세요.
-- SQL >>>>> 


SELECT DISTINCT VENDSTATE 
  FROM VENDORS V 
 ORDER BY VENDSTATE 

-- 문제4번) products 테이블을 활용하여, productdescription에 상품 상세 설명 값
-- 이 없는 상품 데이터를 모두 알려주세요.
-- SQL >>>>>

SELECT *
  FROM PRODUCTS P 
 WHERE PRODUCTDESCRIPTION IS NULL

 
 
 


-- 문제5번) customers 테이블을 이용하여, 고객의 id 별로, custstate 지역 중 WA
-- 지역에 사는 사람과 WA 가 아닌 지역에 사는 사람을 구분해서 보여주세요

-- • Hint
-- 1) customerid 와, newstate_flag 컬럼으로 구성해주세요 .
-- 2) newstate_flag 컬럼은 WA 와 OTHERS 로 노출해주시면 됩니다.
-- SQL >>>>>

SELECT
	   CUSTOMERID
	 , CASE WHEN CUSTSTATE = 'WA' THEN 'WA'
	        ELSE 'OTHERS'
	   END AS NEWSTATE_FLAG   
  FROM CUSTOMERS C
 ORDER BY NEWSTATE_FLAG DESC
 	    , CUSTOMERID






