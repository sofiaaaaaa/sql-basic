CREATE TABLE CROSS_T1
(
  LABEL CHAR(1) PRIMARY KEY
);

CREATE TABLE CROSS_T2 
(
  SCORE INT PRIMARY KEY
);


INSERT INTO CROSS_T1 (LABEL)
VALUES
('A'),
('B');

COMMIT; 

SELECT * FROM CROSS_T1; 

INSERT INTO CROSS_T2 (SCORE)
VALUES
(1),
(2),
(3);

COMMIT;

SELECT * FROM CROSS_T2;


------------------------------------------------------





SELECT
      *
 FROM CROSS_T1
CROSS JOIN 
      CROSS_T2
ORDER BY LABEL       
;

SELECT * 
FROM CROSS_T1, CROSS_T2
ORDER BY LABEL 
; --inner ������ ǥ���ϴ� �ٸ���� 

--�� 2����  sql�� ��� ������ ��������~ -> ���� sql���Դϴ�. 
--sql���� ������ ������ ����ϴ� ���̴�. -> ������ ~ -> ������ ���ٸ� sql�� ��ü�� �ٸ�����~ ������ sql���̴�. 

SELECT LABEL, 
      CASE WHEN LABEL = 'A' THEN sum(score)  
           WHEN LABEL = 'B' THEN sum(score) * -1
           ELSE 0 
           END AS calc
 FROM CROSS_T1
CROSS JOIN 
      CROSS_T2
GROUP BY LABEL      
ORDER BY LABEL       
;




     


     
     
     
     
     
