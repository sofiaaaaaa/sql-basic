SELECT
       SEGMENT
     , SUM (QUANTITY)
  FROM
            SALES
GROUP BY  SEGMENT;     
      
--------------------------------------------------------------------------------------      
SELECT
       SEGMENT
     , SUM (QUANTITY)
  FROM
            SALES
GROUP BY 
ROLLUP (SEGMENT)
ORDER BY
       SEGMENT;



SELECT
       BRAND
     , SEGMENT
     , SUM (QUANTITY)
  FROM
       SALES
GROUP BY
       BRAND, SEGMENT
ORDER BY
       BRAND, SEGMENT;
      
      
      
      

SELECT
       BRAND
     , SEGMENT
     , SUM (QUANTITY)
  FROM
       SALES
GROUP BY
       ROLLUP (BRAND, SEGMENT)
ORDER BY
       BRAND, SEGMENT;
      
--group by별 합계 + rollup절에 맨 앞에 쓴 컬럼 기준의 합계도 나오고 + 전체 합계도 나왔다 
      
SELECT
       BRAND
     , SEGMENT
     , SUM (QUANTITY)
  FROM
       SALES
GROUP BY BRAND, 
       ROLLUP (SEGMENT)
ORDER BY
       BRAND, SEGMENT;
      
      

      
      
      
      
      
      
--------------------------------------------------------------------------------------      
SELECT
       SEGMENT
     , BRAND
     , SUM (QUANTITY)
  FROM
            SALES
GROUP BY SEGMENT,
ROLLUP (BRAND)
ORDER BY
       SEGMENT, BRAND;
      
--부분 rollup = group by 별 합계 + 맨앞에 쓴 컬럼별 합계 + 전체 합계는 구하지 않는다.       

      
      
      
      
      
      
      

      
      