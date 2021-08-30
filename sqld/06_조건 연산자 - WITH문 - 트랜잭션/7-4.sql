SELECT
 CAST ('100' AS INTEGER);
 
|int4
|----
| 100
;

SELECT
 CAST ('10C' AS INTEGER);
 
SQL Error [22P02]: 오류: 정수 자료형 대한 잘못된 입력 구문: "10C"
  Position: 16
  ;
  
SELECT
 CAST ('2015-01-01' AS DATE);
 
|date      
|----------
|2015-01-01
;

SELECT
 CAST ('10.2' AS DOUBLE PRECISION);
 
|float8
|------
|  10.2

;

SELECT
 '100'::INTEGER;

SELECT
 '10C'::INTEGER;

SELECT 
  '2015-01-01'::DATE; 
 
 SELECT
  '10.2'::DOUBLE PRECISION;


