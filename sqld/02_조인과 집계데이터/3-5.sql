SELECT
       A.ID ID_A
     , A.FRUIT FRUIT_A
     , B.ID ID_B
     , B.FRUIT FRUIT_B
FROM BASKET_A A
FULL OUTER JOIN 
	 BASKET_B B 
ON A.FRUIT = B.FRUIT;  

     
     
     
     
     
     
     
     
-------------------------------
SELECT
       A.ID ID_A
     , A.FRUIT FRUIT_A
     , B.ID ID_B
     , B.FRUIT FRUIT_B
FROM BASKET_A A
FULL OUTER JOIN BASKET_B B 
ON A.FRUIT = B.FRUIT
WHERE  A.ID IS NULL --right outer 
   OR  B.ID IS NULL; --left outer 

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
-------------------------------
CREATE TABLE
IF NOT EXISTS DEPARTMENTS 
(
  DEPARTMENT_ID SERIAL PRIMARY KEY
, DEPARTMENT_NAME VARCHAR (255) NOT NULL
);

CREATE TABLE
IF NOT EXISTS EMPLOYEES 
(
  EMPLOYEE_ID SERIAL PRIMARY KEY
, EMPLOYEE_NAME VARCHAR (255)
, DEPARTMENT_ID INTEGER
);



--------------------------------------
INSERT INTO DEPARTMENTS (DEPARTMENT_NAME)
VALUES
  ('Sales')
, ('Marketing')
, ('HR')
, ('IT')
, ('Production');

COMMIT;

SELECT * FROM DEPARTMENTS; 

INSERT INTO EMPLOYEES (
  EMPLOYEE_NAME
, DEPARTMENT_ID
)
VALUES
('Bette Nicholson', 1),
('Christian Gable', 1),
('Joe Swank', 2),
('Fred Costner', 3),
('Sandra Kilmer', 4),
('Julia Mcqueen', NULL);

SELECT  * FROM EMPLOYEES; 
COMMIT; 
--------------------------------------
SELECT
       E.EMPLOYEE_NAME
     , D.DEPARTMENT_NAME
  FROM
      EMPLOYEES E
FULL OUTER JOIN DEPARTMENTS D 
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;










--------------------------------------
SELECT
             E.EMPLOYEE_NAME
           , D.DEPARTMENT_NAME
  FROM
            EMPLOYEES E
FULL OUTER JOIN DEPARTMENTS D 
   ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE E.EMPLOYEE_NAME IS NULL; --家加等 流盔捞 绝绰 何辑 








--------------------------------------

SELECT
       E.EMPLOYEE_NAME
     , D.DEPARTMENT_NAME
  FROM
       EMPLOYEES E
FULL OUTER JOIN DEPARTMENTS D 
   ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE D. DEPARTMENT_ID IS NULL;
