CREATE TABLE CATEGORIES 
(
  CATEGORY_ID SERIAL PRIMARY KEY
, CATEGORY_NAME VARCHAR (255) NOT NULL
);

CREATE TABLE PRODUCTS 
(
  PRODUCT_ID SERIAL PRIMARY KEY
, PRODUCT_NAME VARCHAR (255) NOT NULL
, CATEGORY_ID INT NOT NULL
, FOREIGN KEY (CATEGORY_ID) 
  REFERENCES CATEGORIES (CATEGORY_ID) --참조한다. 즉 특정 제품은 특정 카테고리를 가지고 있어야 한다. 라는 참조 무결성 제약조건
);

INSERT INTO CATEGORIES 
(CATEGORY_NAME)
VALUES
  ('Smart Phone')
, ('Laptop')
, ('Tablet')
;
COMMIT; 

SELECT * FROM CATEGORIES; 

INSERT INTO PRODUCTS 
(PRODUCT_NAME, CATEGORY_ID)
VALUES
  ('iPhone', 1)
, ('Samsung Galaxy', 1)
, ('HP Elite', 2)
, ('Lenovo Thinkpad', 2)
, ('iPad', 3)
, ('Kindle Fire', 3)
;

COMMIT; 

SELECT * FROM PRODUCTS; 














SELECT
      *
 FROM
      PRODUCTS A
NATURAL JOIN 
      CATEGORIES B
;


SELECT
     A.CATEGORY_ID, A.PRODUCT_ID
   , A.PRODUCT_NAME, B.CATEGORY_NAME
  FROM
     PRODUCTS A 
INNER JOIN 
     CATEGORIES B 
ON (A.CATEGORY_ID = B.CATEGORY_ID) 
;


SELECT
     A.CATEGORY_ID, A.PRODUCT_ID
   , A.PRODUCT_NAME, B.CATEGORY_NAME
  FROM
       PRODUCTS A 
     , CATEGORIES B 
WHERE A.CATEGORY_ID = B.CATEGORY_ID 
;















SELECT * FROM CITY;
SELECT * FROM COUNTRY; 


--자동으로 뭘 해주니깐~ -> 멋있게~ 쳤는데 -> 자신의 의도와는 전혀 다른 -> 데이터 건이 0건 
--NATURAL 조인은 -> 사용안한다~ -> 바로 이 이유 입니다. -> 예상치 못하게 의도치 않게 -> 데이터가 나오지 않을수 있다. 
SELECT
       *
  FROM
       CITY A
NATURAL JOIN 
       COUNTRY B;

      
      
      
      
      
      
      
      
      
      
      
      
      
      
SELECT *
  FROM
   		CITY A 
INNER JOIN COUNTRY B 
ON
(A.COUNTRY_ID = B.COUNTRY_ID);

SELECT 
	   *
  FROM
       CITY A 
     , COUNTRY B 
WHERE A.COUNTRY_ID = B.COUNTRY_ID;
      
