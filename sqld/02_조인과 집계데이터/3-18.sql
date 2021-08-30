RENTAL 테이블을 이용하여 연, 연월, 연월일, 전체 각각의 기준으로 RENTAL_ID 기준 렌탈이 일어난 횟수를 출력하라. 
(전체 데이터 기준으로 모든 행을 출력)
;

SELECT * FROM RENTAL; 

--연
--연월 
--연월일
--전체 
--ROLLUP을 사용한다. 

SELECT
	   TO_CHAR(rental_date, 'YYYY')
     , TO_CHAR(rental_date, 'MM')
     , TO_CHAR(rental_date, 'DD') 
     , COUNT(*) 
FROM RENTAL 
GROUP BY 
	ROLLUP (
				TO_CHAR(rental_date, 'YYYY')
			  , TO_CHAR(rental_date, 'MM')
           	  , TO_CHAR(rental_date, 'DD')
			)
			;






SELECT TO_CHAR(rental_date, 'YYYY')
     , COUNT(*) FROM RENTAL
GROUP BY TO_CHAR(rental_date, 'YYYY')
;

SELECT TO_CHAR(rental_date, 'YYYYMM')
     , COUNT(*) FROM RENTAL
GROUP BY TO_CHAR(rental_date, 'YYYYMM')
ORDER BY TO_CHAR(rental_date, 'YYYYMM')
;

SELECT TO_CHAR(rental_date, 'YYYYMMDD')
     , COUNT(*) FROM RENTAL
GROUP BY TO_CHAR(rental_date, 'YYYYMMDD')
ORDER BY TO_CHAR(rental_date, 'YYYYMMDD')
;

SELECT COUNT(*) 
FROM rental; 