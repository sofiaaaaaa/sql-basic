SELECT
       BRAND, SEGMENT
     , SUM (QUANTITY)
  FROM   SALES
GROUP BY
        CUBE (BRAND, SEGMENT)
ORDER BY
        BRAND, SEGMENT;
       
--cube = group by �� �հ� + brand�� + segment�� + ��ü�հ� 

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

--�κ� cube = group by�� �հ� + �Ǿտ� �� �÷��� �հ� 
--        = �ڿ��� �÷��̶� ��ü �հ�� ������ �ʴ´�. 
       