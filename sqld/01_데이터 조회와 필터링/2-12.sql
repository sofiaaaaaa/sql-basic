--���鿡�� ��ü �̸����� ���� �ϰ��� �Ѵ�. 
--CUSTOMER ���̺��� ���� EMAIL�ּҸ� �����ϰ�, �̸��� ���Ŀ� ���� �ʴ� �̸��� �ּҴ� ���ܽ��Ѷ�. 
--(�̸��� ������ ��@���� �����ؾ� �ϰ� ��@���� �������� ���ƾ� �ϰ� ��@���� ������ ���ƾ� �Ѵ�.)

--dbmsexpert@naver.com 

 SELECT EMAIL 
   FROM CUSTOMER
  WHERE EMAIL NOT LIKE '@%'
	AND EMAIL NOT LIKE '%@'
    AND EMAIL LIKE '%@%'
; 

