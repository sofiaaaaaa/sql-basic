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
      
--group by�� �հ� + rollup���� �� �տ� �� �÷� ������ �հ赵 ������ + ��ü �հ赵 ���Դ� 
      
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
      
--�κ� rollup = group by �� �հ� + �Ǿտ� �� �÷��� �հ� + ��ü �հ�� ������ �ʴ´�.       

      
      
      
      
      
      
      

      
      