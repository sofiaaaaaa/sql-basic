CREATE TABLE BASKET_A 
(
   ID INT PRIMARY KEY
 , FRUIT VARCHAR (100) NOT NULL
);

SELECT * FROM BASKET_A; --공집합 
------------------------------------------------------------------------------

CREATE TABLE BASKET_B 
(
   ID INT PRIMARY KEY
 , FRUIT VARCHAR (100) NOT NULL
);

SELECT * FROM BASKET_B; 
-------------------------------------------
INSERT INTO BASKET_A (ID, FRUIT)
VALUES
(1, 'Apple'),
(2, 'Orange'),
(3, 'Banana'),
(4, 'Cucumber')
;
--INSERT, UPDATE, DELETE -> 데이터의 삽입 및 갱신 -> COMMIT; , ROLLBACK; -> 트랜잭션 처리 
COMMIT; 
SELECT * FROM BASKET_A;
----------------------------------------
INSERT INTO BASKET_B (ID, FRUIT)
VALUES
(1, 'Orange'),
(2, 'Apple'),
(3, 'Watermelon'),
(4, 'Pear')
;
COMMIT; 
SELECT * FROM BASKET_B; 
-------------------------------------------
SELECT * FROM BASKET_A; 
------------------------------------------
SELECT * FROM BASKET_B; 

--조인에 대해서 학습 


