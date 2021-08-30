CREATE TABLE PRODUCT_GROUP (
 GROUP_ID SERIAL PRIMARY KEY,
 GROUP_NAME VARCHAR (255) NOT NULL
);
 
CREATE TABLE PRODUCT (
  PRODUCT_ID SERIAL PRIMARY KEY
, PRODUCT_NAME VARCHAR (255) NOT NULL
, PRICE DECIMAL (11, 2)
, GROUP_ID INT NOT NULL
, FOREIGN KEY (GROUP_ID) 
  REFERENCES PRODUCT_GROUP (GROUP_ID)
);

INSERT INTO PRODUCT_GROUP (GROUP_NAME)
VALUES
  ('Smartphone')
, ('Laptop')
, ('Tablet');

COMMIT; 

SELECT * FROM PRODUCT_GROUP; 
 
INSERT INTO PRODUCT (PRODUCT_NAME, GROUP_ID,PRICE)
VALUES
  ('Microsoft Lumia', 1, 200)
, ('HTC One', 1, 400)
, ('Nexus', 1, 500)
, ('iPhone', 1, 900)
, ('HP Elite', 2, 1200)
, ('Lenovo Thinkpad', 2, 700)
, ('Sony VAIO', 2, 700)
, ('Dell Vostro', 2, 800)
, ('iPad', 3, 700)
, ('Kindle Fire', 3, 150)
, ('Samsung Galaxy Tab', 3, 200);

COMMIT; 

SELECT * FROM PRODUCT; 




SELECT
      COUNT(*)
  FROM
      PRODUCT;
     
SELECT * FROM 
	product; 

--2�� 

     
     
     
     
     
     
--������ ����� ���̺��� ���뵵 �Բ� �����ش�. 
--�̰Թٷ� �м��Լ��� �����̴�. 
--�츮�� ���ݺ��� �پ��� �м��Լ��� ���� �ȴ�.      
SELECT
       COUNT(*) OVER() , A.*
  FROM
       PRODUCT A 
;     