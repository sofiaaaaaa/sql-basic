--PAYMENT ���̺��� ���� �ŷ��� AMOUNT�� �׼��� ���� ���� ������ CUSTOMER_ID�� �����϶�. 
--��, CUSTOMER_ID�� ���� �����ؾ� �Ѵ�.


SELECT 
	   DISTINCT A.CUSTOMER_ID 
  FROM PAYMENT A
 WHERE A.AMOUNT = 
				(
				  SELECT 
					     K.AMOUNT 
				    FROM PAYMENT K
				ORDER BY K.AMOUNT DESC
				   LIMIT 1 --LIMIT��
				)
;











--�ǹ� -> �ѱ��� -> sql�ۼ� -> ���� -> �Ƿ� �ȴ���
--���� -> ��Ե� �ذ����� �Դϴ�. 

