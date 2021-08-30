RENTAL�� CUSTOMER ���̺��� �̿��Ͽ� 
������� ���� ���� RENTAL�� �� ���� 
��ID, ��Ż����, ������ŻȽ��, �̸��� 
����϶�.
;

SELECT a.customer_id
	 , ROW_NUMBER()  OVER (ORDER BY count(a.rental_id) desc) AS rental_rank 
     , count(*) rental_count  
     , max(b.first_name) AS first_name
     , max(b.last_name) AS last_name
FROM rental a, 
	 customer b 
WHERE a.customer_id = b.customer_id	 
GROUP BY a.customer_id
ORDER BY rental_rank
LIMIT 1
; 


SELECT a.customer_id, a.rental_rank, a.rental_count, b.first_name, b.last_name
FROM 
(
SELECT a.customer_id
	 , ROW_NUMBER()  OVER (ORDER BY count(a.rental_id) desc) AS rental_rank 
     , count(*) rental_count  
FROM rental a
GROUP BY a.customer_id
ORDER BY rental_rank
LIMIT 1
) a, customer b 
WHERE a.customer_id = b.customer_id
; 


