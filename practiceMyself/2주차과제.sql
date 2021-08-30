--문제1번)  주문일이 2017-09-02 일에 해당 하는 주문건에 대해서,  어떤 고객이, 어떠한 상품에 대해서 얼마를 지불하여  상품을 구매했는지 확인해주세요.

     -- 답 SQL 은 여기 
     
     SELECT 
     		 C.CUSTFIRSTNAME || ' ' || C.CUSTLASTNAME AS CUSTOMER_NAME
     	   , D.PRODUCTNAME 
     	   , B.QUOTEDPRICE 
     	   , B.QUANTITYORDERED 
     	   , B.QUOTEDPRICE * B.QUANTITYORDERED AS TOTAL_PRICE
       FROM ORDERS A
      INNER JOIN ORDER_DETAILS B ON A.ORDERNUMBER = B.ORDERNUMBER 
      INNER JOIN CUSTOMERS C ON A.CUSTOMERID = C.CUSTOMERID 
      INNER JOIN PRODUCTS D ON B.PRODUCTNUMBER = D.PRODUCTNUMBER 
      WHERE A.ORDERDATE = '2017-09-02'
      ORDER BY CUSTOMER_NAME
      
     
     
      
      

-- 문제2번)  헬멧을 주문한 적 없는 고객을 보여주세요. 헬맷은, Products 테이블의 productname 컬럼을 이용해서 확인해주세요.

    -- 답 SQL 은 여기 
    
	SELECT
		   CUSTOMERID
		 , CUSTFIRSTNAME || ' ' || CUSTLASTNAME AS CUSTOMER_NAME
	FROM CUSTOMERS C
	WHERE CUSTOMERID NOT IN (
					  SELECT O.CUSTOMERID
					    FROM ORDER_DETAILS OD 
					       , ORDERS O 
					       , PRODUCTS P2
					   WHERE OD.ORDERNUMBER = O.ORDERNUMBER
					     AND OD.PRODUCTNUMBER = P2.PRODUCTNUMBER
						 AND P2.PRODUCTNAME LIKE '%' || 'Helmet' || '%'
					)
	ORDER BY C.CUSTOMERID 				
    
						 
      

-- 문제3번)  모든 제품 과 주문 일자를 나열하세요. (주문되지 않은 제품도 포함해서 보여주세요.)

    --  답 SQL 은 여기 

	SELECT * 
  	  FROM 
			( SELECT
					 A.PRODUCTNAME 
				   , C.ORDERDATE 
			    FROM PRODUCTS A
			  LEFT OUTER JOIN ORDER_DETAILS B ON A.PRODUCTNUMBER = B.PRODUCTNUMBER 
			  LEFT OUTER JOIN ORDERS C ON B.ORDERNUMBER = C.ORDERNUMBER 
			 ) A
	 ORDER BY A.PRODUCTNAME, A.ORDERDATE
	  
	  
-- 문제4번) 대여점(store)별 영화 재고(inventory) 수량과 전체 영화 재고 수량은? (union all)
 
    --  답 SQL 은 여기 
    
      
      
-- 문제5번) 타이어과 헬멧을 모두 산적이 있는 고객의 ID 를 알려주세요.
-- 타이어와 헬멧에 대해서는 , Products 테이블의 productname 컬럼을 이용해서 확인해주세요.


     -- 답 SQL 은 여기 
     
	SELECT TA.CUSTOMERID
   	  FROM
	      (SELECT DISTINCT A.CUSTOMERID 
	        FROM ORDERS A
	       INNER JOIN ORDER_DETAILS B 
	       	       ON A.ORDERNUMBER = B.ORDERNUMBER 
	       INNER JOIN PRODUCTS C 
	               ON B.PRODUCTNUMBER = C.PRODUCTNUMBER 
	              AND C.PRODUCTNAME LIKE '%' || 'Helmet' || '%'
	       ) TA,
	       (SELECT DISTINCT A.CUSTOMERID 
	        FROM ORDERS A
	       INNER JOIN ORDER_DETAILS B 
	       	       ON A.ORDERNUMBER = B.ORDERNUMBER 
	       INNER JOIN PRODUCTS C 
	               ON B.PRODUCTNUMBER = C.PRODUCTNUMBER 
	              AND C.PRODUCTNAME LIKE '%' || 'Tires' || '%'
	       ) TB
      WHERE TA.CUSTOMERID = TB.CUSTOMERID
      ORDER BY TA.CUSTOMERID
 