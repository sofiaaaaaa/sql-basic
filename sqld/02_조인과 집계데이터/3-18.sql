RENTAL ���̺��� �̿��Ͽ� ��, ����, ������, ��ü ������ �������� RENTAL_ID ���� ��Ż�� �Ͼ Ƚ���� ����϶�. 
(��ü ������ �������� ��� ���� ���)
;

SELECT * FROM RENTAL; 

--��
--���� 
--������
--��ü 
--ROLLUP�� ����Ѵ�. 

SELECT
	   TO_CHAR(rental_date, 'YYYY')
     , TO_CHAR(rental_date, 'MM')
     , TO_CHAR(rental_date, 'DD') 
     , COUNT(*) 
FROM RENTAL 
GROUP BY 
	ROLLUP (
				TO_CHAR(rental_date, 'YYYY')
			  , TO_CHAR(rental_date, 'MM')
           	  , TO_CHAR(rental_date, 'DD')
			)
			;






SELECT TO_CHAR(rental_date, 'YYYY')
     , COUNT(*) FROM RENTAL
GROUP BY TO_CHAR(rental_date, 'YYYY')
;

SELECT TO_CHAR(rental_date, 'YYYYMM')
     , COUNT(*) FROM RENTAL
GROUP BY TO_CHAR(rental_date, 'YYYYMM')
ORDER BY TO_CHAR(rental_date, 'YYYYMM')
;

SELECT TO_CHAR(rental_date, 'YYYYMMDD')
     , COUNT(*) FROM RENTAL
GROUP BY TO_CHAR(rental_date, 'YYYYMMDD')
ORDER BY TO_CHAR(rental_date, 'YYYYMMDD')
;

SELECT COUNT(*) 
FROM rental; 