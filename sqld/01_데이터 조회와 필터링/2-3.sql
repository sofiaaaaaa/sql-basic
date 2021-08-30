DROP TABLE T1; 
CREATE TABLE T1 ( ID SERIAL NOT NULL PRIMARY KEY, BCOLOR VARCHAR, FCOLOR VARCHAR );

COMMIT; --없습니다. 테이블 생성 -> DDL --> 치는 순간에 바로 적용 

INSERT
  INTO T1 (BCOLOR, FCOLOR)
VALUES
         ('red', 'red')
       , ('red', 'red')
       , ('red', NULL)
       , (NULL, 'red')
       , ('red', 'green')
       , ('red', 'blue')
       , ('green', 'red')
       , ('green', 'blue')
       , ('green', 'green')
       , ('blue', 'red')
       , ('blue', 'green')
       , ('blue', 'blue')
;

COMMIT; 

SELECT
             *
 FROM
             T1;

--------------------------------------------------------------------
SELECT
    DISTINCT BCOLOR
FROM
    T1
ORDER BY
    BCOLOR
;
----------------------------------------------------------------------
SELECT
    DISTINCT BCOLOR, FCOLOR
FROM
    T1
ORDER BY
    BCOLOR, FCOLOR;
-----------------------------------------------------------------------
SELECT
      DISTINCT ON (BCOLOR) BCOLOR
   ,  FCOLOR
FROM
    T1
ORDER BY
    BCOLOR, FCOLOR;
--------------------------------------------------------------------------
SELECT
      DISTINCT ON (BCOLOR) BCOLOR
   ,  FCOLOR
FROM
    T1
ORDER BY
    BCOLOR, FCOLOR DESC;