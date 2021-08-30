CREATE TABLE EMPLOYEE 
(
  EMPLOYEE_ID INT PRIMARY KEY
, FIRST_NAME VARCHAR (255) NOT NULL
, LAST_NAME VARCHAR (255) NOT NULL
, MANAGER_ID INT --������
, FOREIGN KEY (MANAGER_ID) 
  REFERENCES EMPLOYEE (EMPLOYEE_ID) 
  ON DELETE CASCADE
);








-----------------------------------------
INSERT INTO EMPLOYEE (
  EMPLOYEE_ID
, FIRST_NAME
, LAST_NAME
, MANAGER_ID
)
VALUES
(1, 'Windy', 'Hays', NULL),
(2, 'Ava', 'Christensen', 1),
(3, 'Hassan', 'Conner', 1),
(4, 'Anna', 'Reeves', 2),
(5, 'Sau', 'Norman', 2),
(6, 'Kelsie', 'Hays', 3),
(7, 'Tory', 'Goff', 3),
(8, 'Salley', 'Lester', 3);

COMMIT; 
----------------------------------------

SELECT * FROM EMPLOYEE; 














SELECT
  E.FIRST_NAME || ' ' || E.LAST_NAME EMPLOYEE
, M.FIRST_NAME || ' ' || M .LAST_NAME MANAGER
FROM
     EMPLOYEE E
INNER JOIN EMPLOYEE M 
ON M .EMPLOYEE_ID = E.MANAGER_ID
ORDER BY MANAGER;


















SELECT
  E.FIRST_NAME || ' ' || E.LAST_NAME EMPLOYEE
, M.FIRST_NAME || ' ' || M .LAST_NAME MANAGER
FROM
     EMPLOYEE E
LEFT OUTER JOIN EMPLOYEE M 
ON M .EMPLOYEE_ID = E.MANAGER_ID
ORDER BY MANAGER;
-------------------------------------------------













SELECT
       F1.TITLE
     , F2.TITLE
     , F1.LENGTH
  FROM
       FILM F1
INNER JOIN FILM F2 
ON F1.FILM_ID <> F2.FILM_ID
AND F1. LENGTH = F2.LENGTH;
-----------------------------------------

������ ���̺������� -> ������ �ٸ� �������� �����س��� -> �̰� �������� -> �״��� �׾ȿ��� �ڽ��� ���ϴ� ������ �����Ѵ�. 
;



SELECT * 
FROM film f1 --���̺��� ��ȸ 
WHERE f1.LENGTH = f1.length  
AND F1.FILM_ID <> f1.FILM_ID
;


