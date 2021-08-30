--PAYMENT 테이블에서 단일 거래의 AMOUNT의 액수가 가장 많은 고객들의 CUSTOMER_ID를 추출하라. 
--단, CUSTOMER_ID의 값은 유일해야 한다.


SELECT 
	   DISTINCT A.CUSTOMER_ID 
  FROM PAYMENT A
 WHERE A.AMOUNT = 
				(
				  SELECT 
					     K.AMOUNT 
				    FROM PAYMENT K
				ORDER BY K.AMOUNT DESC
				   LIMIT 1 --LIMIT절
				)
;











--실무 -> 한국말 -> sql작성 -> 정답 -> 실력 안늘죠
--정답 -> 어떻게든 해결하자 입니다. 

