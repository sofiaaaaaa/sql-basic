SELECT
       BRAND, SEGMENT
     , SUM (QUANTITY)
  FROM   SALES
GROUP BY
        CUBE (BRAND, SEGMENT)
ORDER BY
        BRAND, SEGMENT;
       
--cube = group by 절 합계 + brand별 + segment별 + 전체합계 

SELECT
       BRAND, SEGMENT
     , SUM (QUANTITY)
  FROM   SALES
GROUP BY
        rollup (BRAND, SEGMENT)
ORDER BY
        BRAND, SEGMENT;
       
       

       
       
       
       
       
       
       
       
       
       
       
       
SELECT
       BRAND, SEGMENT
     , SUM (QUANTITY)
  FROM   SALES
GROUP BY BRAND,
         CUBE (SEGMENT)
ORDER BY
         BRAND, SEGMENT;

--부분 cube = group by별 합계 + 맨앞에 쓴 컬럼별 합계 
--        = 뒤에쓴 컬럼이랑 전체 합계는 구하지 않는다. 
       