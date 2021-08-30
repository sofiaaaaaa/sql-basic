SELECT
       DISTINCT INVENTORY.FILM_ID, FILM.TITLE
  FROM
       INVENTORY
INNER JOIN 
       FILM 
ON FILM.FILM_ID = INVENTORY.FILM_ID
ORDER BY FILM.TITLE;

SELECT
       DISTINCT A.FILM_ID, B.TITLE
  FROM
       INVENTORY A
INNER JOIN 
       FILM B
ON B.FILM_ID = A.FILM_ID
ORDER BY B.TITLE;

--�ʸ��� �κ��丮�� 1:m���� -> �� ���̺��� �����ϸ� -> ��ȭ�ϳ��� �������� ��� �����°��� 



















--��ü��ȭ���� 
SELECT
       FILM_ID
     , TITLE
  FROM
       FILM
EXCEPT 
--��� �����ϴ� ��ȭ�� ���� 
SELECT
       DISTINCT INVENTORY.FILM_ID
     , TITLE
  FROM
       INVENTORY
INNER JOIN 
       FILM 
ON FILM.FILM_ID = INVENTORY.FILM_ID
ORDER BY TITLE;
--�������	�� ��� �������� �ʴ� ��ȭ��. 

SELECT * FROM INVENTORY 
WHERE FILM_ID = 108;

