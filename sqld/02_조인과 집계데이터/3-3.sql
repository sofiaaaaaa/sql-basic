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





기준집합 -> 보고자하는 -> 기준집합 출력할때 -> 고객은 다보고싶어요 -> 계약했던 안했던 우리는 고객을 보고싶어요
근데 계약을 보여주면 더 좋지요~
-------------------------------------------------------------------------------------