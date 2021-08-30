문제1번) 1번 주문 번호에 대해서, 상품명, 주문 금액과 1번 주문 금액에 대한 총 구매금액을 함께 보여주세요. 

     답 SQL 은 여기 
     
 SELECT 
        P.PRODUCTNAME
 	  , (OD.QUOTEDPRICE * OD.QUANTITYORDERED) AS ORDER_PRICE
 	  , SUM(OD.QUOTEDPRICE * OD.QUANTITYORDERED) OVER() AS TOTAL_ORDER_PRICE
   FROM ORDERS O
  INNER JOIN ORDER_DETAILS OD ON O.ORDERNUMBER = OD.ORDERNUMBER 
  LEFT JOIN PRODUCTS P ON OD.PRODUCTNUMBER = P.PRODUCTNUMBER 
  WHERE O.ORDERNUMBER = '1'
  ORDER BY P.PRODUCTNAME 


문제2번) 헬멧을 주문한 모든 고객과 자전거를 주문한 모든 고객을 나열하세요. (Union 활용) 헬멧과 자전거는 Products 테이블의 productname 컬럼을 이용해서 확인해주세요.

     답 SQL 은 여기 
     
     
 SELECT * 
   FROM CUSTOMERS C 
  WHERE C.CUSTOMERID IN (
						 	SELECT CUSTOMERID 
						 	  FROM ORDERS O
						 	 INNER JOIN ORDER_DETAILS OD ON O.ORDERNUMBER = OD.ORDERNUMBER 
						 	 INNER JOIN PRODUCTS P ON OD.PRODUCTNUMBER = P.PRODUCTNUMBER 
						 	 WHERE UPPER(P.PRODUCTNAME) like '%HELMET' 
						 )
 UNION 
 SELECT * 
   FROM CUSTOMERS C 
  WHERE C.CUSTOMERID IN (
						 	SELECT CUSTOMERID 
						 	  FROM ORDERS O
						 	 INNER JOIN ORDER_DETAILS OD ON O.ORDERNUMBER = OD.ORDERNUMBER 
						 	 INNER JOIN PRODUCTS P ON OD.PRODUCTNUMBER = P.PRODUCTNUMBER 
						 	 WHERE UPPER(P.PRODUCTNAME) LIKE  '%BIKE' 
						 )
ORDER BY CUSTOMERID

 

문제3번) 주문일자가 2017/09/01 ~ 2017/09/30 일에 해당하는 주문에 대해서 주문일자와 고객별로 주문 수를 확인해주세요. 
또한 고객별 주문 수도 함께 알려주세요.


     답 SQL 은 여기 
     
 SELECT 
 		O.ORDERDATE 
	  , O.CUSTOMERID 
	  , COUNT(*) AS ORDER_COUNT
   FROM ORDERS O 
  WHERE ORDERDATE BETWEEN '2017-09-01' AND '2017-09-30'
  GROUP BY O.ORDERDATE , O.CUSTOMERID 
  ORDER BY O.ORDERDATE , O.CUSTOMERID 
   
   SELECT 
 		O.ORDERDATE 
	  , O.CUSTOMERID 
	  , COUNT(distinct ordernumber ) AS ORDER_COUNT
   FROM ORDERS O 
  WHERE ORDERDATE BETWEEN '2017-09-01' AND '2017-09-30'
  GROUP BY grouping sets((O.ORDERDATE , O.CUSTOMERID ), (customerid ))
  
     

문제4번) 주문일자가 2017/09/01 ~ 2017/09/30일에 해당하는 주문에 대해서, 주문일자와 고객별로 주문 수를 확인해주세요. 
또한 주문일자별 주문 수도 함께 알려주시고, 전체 주문 수도 함께 알려주세요.

 
    답 SQL 은 여기 
    
   SELECT 
 		DISTINCT O.ORDERDATE 
	  , O.CUSTOMERID 
	  , COUNT(*) OVER(PARTITION BY O.ORDERDATE, O.CUSTOMERID) AS ORDER_COUNT
	  , COUNT(*) OVER(PARTITION BY O.ORDERDATE) AS ORDER_COUNT_BY_ORDERDATE
	  , COUNT(*) OVER() AS TOTAL_ORDER_COUNT
   FROM ORDERS O 
  WHERE ORDERDATE BETWEEN '2017-09-01' AND '2017-09-30'  
  ORDER BY O.ORDERDATE , O.CUSTOMERID    
    
   SELECT 
 		O.ORDERDATE 
	  , O.CUSTOMERID 
	  , COUNT(distinct ordernumber )  AS cnt
   FROM ORDERS O 
  WHERE ORDERDATE BETWEEN '2017-09-01' AND '2017-09-30'  
  group by rollup (orderdate , customerid )
  

문제5번) 2017년도의 주문일 별 주문 금액과, 월별 주문 총 금액을 함께 보여주세요. 
동시에 일별 주문 금액이 월별 주문 금액에 해당하는 비율을 같이 보여주세요. (analytic function 활용)

     답 SQL 은 여기 

SELECT 
	  DISTINCT O.ORDERDATE 
	, SUM(OD.QUANTITYORDERED *  OD.QUOTEDPRICE)  OVER(PARTITION BY TO_CHAR(O.ORDERDATE, 'YYYYMMDD')) AS ORDER_PRICE_BY_DAY
	, SUM(OD.QUANTITYORDERED *  OD.QUOTEDPRICE) OVER(PARTITION BY TO_CHAR(O.ORDERDATE, 'YYYYMM')) AS ORDER_PRICE_BY_MONTH
	, ROUND(SUM(OD.QUANTITYORDERED *  OD.QUOTEDPRICE)  OVER(PARTITION BY TO_CHAR(O.ORDERDATE, 'YYYYMMDD')) / 
			SUM(OD.QUANTITYORDERED *  OD.QUOTEDPRICE) OVER(PARTITION BY TO_CHAR(O.ORDERDATE, 'YYYYMM'))
			* 100 , 2
	  ) || '%' AS ORDER_PRICE_RATIO  
FROM ORDERS O
INNER JOIN ORDER_DETAILS OD ON O.ORDERNUMBER = OD.ORDERNUMBER 
WHERE TO_CHAR(O.ORDERDATE, 'YYYY') = '2017'
ORDER BY O.ORDERDATE 


SELECT 
	  ORDERDATE 
	, SUM(product_price)  OVER(PARTITION BY orderdate) AS ORDER_PRICE_BY_DAY
	, SUM(product_price) OVER(partition by mm) AS ORDER_PRICE_BY_MONTH
	,  SUM(product_price)  OVER(PARTITION BY orderdate) /
		SUM(product_price) OVER(PARTITION by mm)
		AS ORDER_PRICE_RATIO  
FROM (
	select mm
		, orderdate
		, sum(product_price) product_price
	from (
			select 
				o.ordernumber 
				, orderdate
				, extract(month from o.orderdate) as mm
				, od.productnumber
				, od.quotedprice * od.quantityordered as product_price
			from orders as o 
			join order_details as od on o.ordernumber = od.ordernumber 
			where o.orderdate between '2017-01-01' and '2017-12-31'
		) dt 
		group by mm, orderdate
	) as dt

