CREATE TABLE CROSS_T1
(
  LABEL CHAR(1) PRIMARY KEY
);

CREATE TABLE CROSS_T2 
(
  SCORE INT PRIMARY KEY
);


INSERT INTO CROSS_T1 (LABEL)
VALUES
('A'),
('B');

COMMIT; 

SELECT * FROM CROSS_T1; 

INSERT INTO CROSS_T2 (SCORE)
VALUES
(1),
(2),
(3);

COMMIT;

SELECT * FROM CROSS_T2;


------------------------------------------------------





SELECT
      *
 FROM CROSS_T1
CROSS JOIN 
      CROSS_T2
ORDER BY LABEL       
;

SELECT * 
FROM CROSS_T1, CROSS_T2
ORDER BY LABEL 
; --inner 조인을 표현하는 다른방법 

--위 2개의  sql문 결과 집합이 동일하죠~ -> 같은 sql문입니다. 
--sql문의 목적이 집합을 출력하는 것이다. -> 정보는 ~ -> 정보가 같다면 sql문 자체는 다르더라도~ 동일한 sql문이다. 

SELECT LABEL, 
      CASE WHEN LABEL = 'A' THEN sum(score)  
           WHEN LABEL = 'B' THEN sum(score) * -1
           ELSE 0 
           END AS calc
 FROM CROSS_T1
CROSS JOIN 
      CROSS_T2
GROUP BY LABEL      
ORDER BY LABEL       
;




     


     
     
     
     
     
