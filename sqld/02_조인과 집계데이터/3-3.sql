SELECT
       A.ID    AS ID_A
     , A.FRUIT AS FRUIT_A
     , B.ID    AS ID_B
     , B.FRUIT AS FRUIT_B
  FROM
       BASKET_A A LEFT OUTER JOIN BASKET_B B 
  ON A.FRUIT = B.FRUIT;

 
  ----------------------------------------
 SELECT
      A.ID    AS ID_A
    , A.FRUIT AS FRUIT_A
    , B.ID    AS ID_B
    , B.FRUIT AS FRUIT_B
 FROM
      BASKET_A A
LEFT OUTER JOIN BASKET_B B 
  ON A.FRUIT = B.FRUIT
WHERE B.ID IS NULL;
--LEFT ONLY 






--------------------------------------------
SELECT
       A.ID    AS ID_A
     , A.FRUIT AS FRUIT_A
     , B.ID    AS ID_B
     , B.FRUIT AS FRUIT_B
  FROM
       BASKET_A A
RIGHT OUTER JOIN BASKET_B B 
  ON A.FRUIT = B.FRUIT;

 
 
 
 
 
 
 ----------------------------------------------
 SELECT
       A.ID AS ID_A
     , A.FRUIT AS FRUIT_A
     , B.ID AS ID_B
     , B.FRUIT AS FRUIT_B
  FROM
       BASKET_A A
RIGHT OUTER JOIN BASKET_B B 
  ON A.FRUIT = B.FRUIT
WHERE A.ID IS NULL;

-------------------------------------------





�������� -> �������ϴ� -> �������� ����Ҷ� -> ���� �ٺ���;�� -> ����ߴ� ���ߴ� �츮�� ���� ����;��
�ٵ� ����� �����ָ� �� ������~
-------------------------------------------------------------------------------------