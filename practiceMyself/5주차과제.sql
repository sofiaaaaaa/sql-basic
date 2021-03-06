문제1번) 주문일자가 2017/09/01 ~ 2017/12/31 일에 해당하는 주문 중에서 , 
           주문 월별로 , 가장 판매가 많았던 상품 (productname) Top 5 개를 보여주세요. 


     답 SQL 은 여기 
     
     
	
	SELECT  MM
		  , PRODUCTNAME
		  , SALE_COUNT
	  FROM
		 (
		 	SELECT 
		 		   TO_CHAR(O.ORDERDATE,'MM') AS MM 
		     	 , P2.PRODUCTNAME
		       	 , COUNT(DISTINCT O.ORDERNUMBER ) AS SALE_COUNT 
		    	 , DENSE_RANK()  OVER(PARTITION BY TO_CHAR(O.ORDERDATE,'MM') ORDER BY TO_CHAR(O.ORDERDATE,'MM'), COUNT(DISTINCT O.ORDERNUMBER ) DESC) AS RANK_INDEX
		      FROM ORDER_DETAILS OD 
		     INNER JOIN ORDERS O ON OD.ORDERNUMBER = O.ORDERNUMBER 
		     					AND O.ORDERDATE BETWEEN '2017-09-01' AND '2017-12-31'
			 INNER JOIN PRODUCTS P2 ON OD.PRODUCTNUMBER = P2.PRODUCTNUMBER 
			 GROUP BY TO_CHAR(O.ORDERDATE,'MM')
			 		, P2.PRODUCTNAME 
			 ORDER BY TO_CHAR(O.ORDERDATE,'MM') asc
			 		, SALE_COUNT DESC 
		 ) A
	 WHERE RANK_INDEX <= 5
	 
      

문제2번) 주문일자가 2017/09/01 ~ 2017/12/31 일에 해당하는 주문 중에서 , 주문 월별로 , 결제 금액이 높은 고객 Top 3명을 보여주세요. 주문 월별로, 고객 3명을 알려주시고 / 고객의 Full name 을 함께 보여주세요. 


     답 SQL 은 여기 
     
     SELECT  MM
     	   , CUSTOMER_FULL_NAME
     	   , TOTAL_ORDER_PRICE
	  FROM
		 (
		     SELECT TO_CHAR(O.ORDERDATE,'MM') AS MM 
		     		, C.CUSTFIRSTNAME || ' ' || C.CUSTLASTNAME AS CUSTOMER_FULL_NAME
		     		, SUM(OD.QUANTITYORDERED * OD.QUOTEDPRICE) AS TOTAL_ORDER_PRICE
			    	, DENSE_RANK()  OVER(PARTITION BY TO_CHAR(O.ORDERDATE,'MM') ORDER BY TO_CHAR(O.ORDERDATE,'MM'), SUM(OD.QUANTITYORDERED * OD.QUOTEDPRICE) DESC) AS RANK_INDEX
		       FROM ORDER_DETAILS OD
		     INNER JOIN ORDERS O ON OD.ORDERNUMBER = O.ORDERNUMBER 
				 				 AND O.ORDERDATE BETWEEN '2017-09-01' AND '2017-12-31'
			 INNER JOIN CUSTOMERS C ON O.CUSTOMERID = C.CUSTOMERID 
			 GROUP BY TO_CHAR(O.ORDERDATE,'MM')
			 		, CUSTOMER_FULL_NAME 
			 ORDER BY TO_CHAR(O.ORDERDATE,'MM') asc
			 		, TOTAL_ORDER_PRICE DESC 
     	 ) A
	 WHERE RANK_INDEX <= 3
     
     
     


문제3번) 주문일자가 2017/09/01 ~ 2017/12/31 일에 해당하는 주문 중에서 , 주문 월별로 , 결제 금액이 높은 고객 Top 3에 2번 이상 포함된 적이 있는 고객의 이름과 Top3에 포함된 횟수를 알려주세요. 

 
    답 SQL 은 여기 
    
    
    
     SELECT    DISTINCT CUSTOMER_FULL_NAME
    		 , DUP_COUNT
       FROM 
     		 (
			       SELECT   
			     			CUSTOMER_FULL_NAME
				     	   , COUNT(CUSTOMER_FULL_NAME)  OVER(PARTITION BY CUSTOMER_FULL_NAME) AS DUP_COUNT 
					  FROM
						 (
						     SELECT TO_CHAR(O.ORDERDATE,'MM') AS MM 
						     		, C.CUSTFIRSTNAME || ' ' || C.CUSTLASTNAME AS CUSTOMER_FULL_NAME
							    	, DENSE_RANK()  OVER(PARTITION BY TO_CHAR(O.ORDERDATE,'MM') ORDER BY TO_CHAR(O.ORDERDATE,'MM'), SUM(OD.QUANTITYORDERED * OD.QUOTEDPRICE) DESC) AS RANK_INDEX
						     		, SUM(OD.QUANTITYORDERED * OD.QUOTEDPRICE) AS TOTAL_ORDER_PRICE
						       FROM ORDER_DETAILS OD
						     INNER JOIN ORDERS O ON OD.ORDERNUMBER = O.ORDERNUMBER 
								 				 AND O.ORDERDATE BETWEEN '2017-09-01' AND '2017-12-31'
							 INNER JOIN CUSTOMERS C ON O.CUSTOMERID = C.CUSTOMERID 
							 GROUP BY TO_CHAR(O.ORDERDATE,'MM')
							 		, CUSTOMER_FULL_NAME 
							 ORDER BY TO_CHAR(O.ORDERDATE,'MM') ASC
							 		, TOTAL_ORDER_PRICE DESC 
				     	 ) A
					 WHERE RANK_INDEX <= 3	
	 		) B
     WHERE DUP_COUNT >= 2
  
	 
	 


문제4번) 상품 번호를 기준으로, 범위를 지정하여, 상품번호 그룹을 만들려고합니다. 각 상품 번호 그룹 별로, 주문 수를 알려주세요.


상품번호번호에 그룹은 아래와 같습니다. 
 - 상품번호가 1~ 10에 해당하면 between1_10  
 - 상품번호가 11~20에 해당하면 between11_20  
 - 상품번호가 21~30에 해당하면 between21_30 
 - 상품번호가 31~40에 해당하면 between31_40


     답 SQL 은 여기 
     
    
     SELECT 
     		 PRODUCT_NUMBER_GROUP
     	   , SUM(TOTAL_ORDER_COUNT)
       FROM
		     (
			     	SELECT P.PRODUCTNUMBER
			     	 	 , CASE WHEN P.PRODUCTNUMBER BETWEEN 1 AND 10 THEN 'BETWEEN1_10'
			     		 	  WHEN P.PRODUCTNUMBER BETWEEN 11 AND 20 THEN 'BETWEEN11_20'
			     		 	  WHEN P.PRODUCTNUMBER BETWEEN 21 AND 30 THEN 'BETWEEN21_30'
			     		 	  WHEN P.PRODUCTNUMBER BETWEEN 31 AND 40 THEN 'BETWEEN31_40'
			     		 	  ELSE CAST(P.PRODUCTNUMBER AS VARCHAR)
			     		    END AS PRODUCT_NUMBER_GROUP
			     	     , COUNT( DISTINCT O.ORDERNUMBER ) AS TOTAL_ORDER_COUNT
			       FROM PRODUCTS P 
			      INNER JOIN ORDER_DETAILS OD ON OD.PRODUCTNUMBER = P.PRODUCTNUMBER 
			      INNER JOIN ORDERS O ON O.ORDERNUMBER = OD.ORDERNUMBER 
			      GROUP BY P.PRODUCTNUMBER, PRODUCT_NUMBER_GROUP
			      ORDER BY P.PRODUCTNUMBER 
		      ) A
      GROUP BY PRODUCT_NUMBER_GROUP
      ORDER BY PRODUCT_NUMBER_GROUP
      
      
     


문제5번) 타이어(Tires)  카테고리에 해당하는 2017/09/01 ~ 2017/09/10일에 주문 중, 주문 일자별 타이어 카테고리별 주문 수를 확인하고. 추가로 타이어 카테고리가 이전 주문일자의 주문 수를 노출하고, 이전 주문일자와 현 주문일자를 비교해주세요.  (with 절 활용)


주문 수 비교에 대한 컬럼의 구성은 아래와 같습니다. 
 - 이전 주문일자보다 주문 수가 늘었다면 plus 
 - 이전 주문일자와 주문 수가 동일하다면 same 
 - 이전 주문일자보다 주문 수가 줄었다면 minus


  답 SQL 은 여기 
   
   
WITH TMP1 AS  (
	 SELECT O.ORDERDATE 
       , COUNT(DISTINCT O.ORDERNUMBER) ORDER_COUNT 
       , LAG(COUNT(DISTINCT O.ORDERNUMBER), 1) OVER (ORDER BY ORDERDATE ) PRE_ORDER_COUNT
    FROM ORDERS O
    LEFT JOIN ORDER_DETAILS OD ON O.ORDERNUMBER = OD.ORDERNUMBER 
    WHERE O.ORDERDATE BETWEEN '2017-09-01' AND '2017-09-10'
     AND EXISTS (
     			 SELECT 1
				   FROM PRODUCTS P2 
				  INNER JOIN CATEGORIES C2 ON P2.CATEGORYID  = C2.CATEGORYID 
				  				          AND C2.CATEGORYDESCRIPTION = 'TIRES'
				   WHERE OD.PRODUCTNUMBER = P2.PRODUCTNUMBER                         
				)
   GROUP BY O.ORDERDATE
   ORDER BY O.ORDERDATE 
)
SELECT 
	   ORDERDATE
	  , PRE_ORDER_COUNT
	  , ORDER_COUNT 	
	  , CASE WHEN ORDER_COUNT > PRE_ORDER_COUNT THEN 'PLUS'
	  		 WHEN ORDER_COUNT = PRE_ORDER_COUNT THEN 'SAME'
	  		 WHEN ORDER_COUNT < PRE_ORDER_COUNT THEN 'MINUS'
	  		 ELSE ''
	  	END COMPARE 	 
  FROM TMP1