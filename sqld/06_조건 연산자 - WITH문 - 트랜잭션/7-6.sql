CREATE TABLE TB_EMP_RECURSIVE_TEST (
  EMPLOYEE_ID SERIAL PRIMARY KEY
, FULL_NAME VARCHAR NOT NULL
, MANAGER_ID INT
);

INSERT INTO TB_EMP_RECURSIVE_TEST (
  EMPLOYEE_ID
, FULL_NAME
, MANAGER_ID
)
VALUES
   (1 , '�̰��', NULL)
 , (2 , '������', 1)
 , (3 , '��¹�', 1)
 , (4 , '�ϼ���', 1)
 , (5 , '�۹鼱', 1)
 , (6 , '�̽���', 2)
 , (7 , 'ȫ�߼�', 2)
 , (8 , '��̼�', 2)
 , (9 , '�輱��', 2)
 , (10, '�̼���', 3)
 , (11, '�輱��', 3)
 , (12, '�輱��', 3)
 , (13, '�̿���', 3)
 , (14, '����', 4)
 , (15, '�̽ÿ�', 4)
 , (16, '�ּ���', 7)
 , (17, '������', 7)
 , (18, '�ֹ���', 8)
 , (19, '������', 8)
 , (20, '�밡��', 8)
;

COMMIT; 

SELECT * FROM TB_EMP_RECURSIVE_TEST; 


WITH RECURSIVE TMP1 AS (
SELECT
       EMPLOYEE_ID
     , MANAGER_ID
     , FULL_NAME
     , 0 LVL
  FROM
       TB_EMP_RECURSIVE_TEST
 WHERE MANAGER_ID IS NULL
UNION 
SELECT
       E.EMPLOYEE_ID
     , E.MANAGER_ID
     , E.FULL_NAME
     , S.LVL + 1
  FROM
     TB_EMP_RECURSIVE_TEST E
   , TMP1 S 
 WHERE S.EMPLOYEE_ID = E.MANAGER_ID
) 
SELECT EMPLOYEE_ID, MANAGER_ID, LPAD(' ', 4 * (LVL)) || FULL_NAME AS FULL_NAME FROM TMP1;

|employee_id|manager_id|full_name      
|-----------|----------|---------------
|          1|          |�̰��            
|          2|         1|    ������        
|          3|         1|    ��¹�        
|          4|         1|    �ϼ���        
|          5|         1|    �۹鼱        
|          6|         2|        �̽���    
|          7|         2|        ȫ�߼�    
|          8|         2|        ��̼�    
|          9|         2|        �輱��    
|         10|         3|        �̼���    
|         11|         3|        �輱��    
|         12|         3|        �輱��    
|         13|         3|        �̿���    
|         14|         4|        ����    
|         15|         4|        �̽ÿ�    
|         16|         7|            �ּ���
|         17|         7|            ������
|         18|         8|            �ֹ���
|         19|         8|            ������
|         20|         8|            �밡��
;

WITH RECURSIVE TMP1 AS (
SELECT
       EMPLOYEE_ID
     , MANAGER_ID
     , FULL_NAME
     , 0 LVL
  FROM
       TB_EMP_RECURSIVE_TEST
 WHERE EMPLOYEE_ID = 2
UNION 
SELECT
       E.EMPLOYEE_ID
     , E.MANAGER_ID
     , E.FULL_NAME
     , S.LVL + 1
  FROM
     TB_EMP_RECURSIVE_TEST E
   , TMP1 S 
  WHERE S.EMPLOYEE_ID = E.MANAGER_ID  
) 
SELECT EMPLOYEE_ID, MANAGER_ID, LPAD(' ', 4 * (LVL)) || FULL_NAME AS FULL_NAME FROM TMP1;

|employee_id|manager_id|full_name  
|-----------|----------|-----------
|          2|         1|������        
|          6|         2|    �̽���    
|          7|         2|    ȫ�߼�    
|          8|         2|    ��̼�    
|          9|         2|    �輱��    
|         16|         7|        �ּ���
|         17|         7|        ������
|         18|         8|        �ֹ���
|         19|         8|        ������
|         20|         8|        �밡��