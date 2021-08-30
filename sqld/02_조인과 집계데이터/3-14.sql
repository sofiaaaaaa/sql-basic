SELECT
      AVG (PRICE)
 FROM
      PRODUCT;


     
     
     
     
     
     
     
     
     
     
     
     
     
     
SELECT
      B.GROUP_NAME
    , AVG (PRICE)
 FROM PRODUCT A
INNER JOIN PRODUCT_GROUP B
    ON (A.GROUP_ID = B.GROUP_ID)
GROUP BY
B.GROUP_NAME;






--�����ٲ� �� �����ָ鼭 
--group_name�� ��հ����� ���� �;��~
SELECT
       A.PRODUCT_NAME 
     , A.PRICE
     , B.GROUP_NAME
     , AVG (A.PRICE) OVER (PARTITION BY B.GROUP_NAME)  
FROM
PRODUCT A
INNER JOIN PRODUCT_GROUP B
ON (A.GROUP_ID = B.GROUP_ID);




















SELECT
       A.PRODUCT_NAME 
     , A.PRICE
     , B.GROUP_NAME
     , AVG (A.PRICE) OVER (PARTITION BY B.GROUP_NAME ORDER BY B.GROUP_NAME)  
FROM
PRODUCT A
INNER JOIN PRODUCT_GROUP B
ON (A.GROUP_ID = B.GROUP_ID);










--��������� ���Ҽ��ִ�. 
SELECT
       A.PRODUCT_NAME 
     , A.PRICE
     , B.GROUP_NAME
     , AVG (A.PRICE) OVER (PARTITION BY B.GROUP_NAME ORDER BY A.PRICE)  --��������
FROM
PRODUCT A
INNER JOIN PRODUCT_GROUP B
ON (A.GROUP_ID = B.GROUP_ID);









