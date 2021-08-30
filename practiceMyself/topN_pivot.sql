-- Top N query

SELECT top(2) ename 
FROM emp


SELECT top(1) ename -- oracle에선 안됨 
FROM emp
ORDER BY sal DESC

-- top과 동일 

SELECT empno, sal
FROM emp 
ORDER BY sal, EMPNO 
-- FETCH FIRST 5 ROWS WITH ties; // 마지막행에 동순위 포함해서 반환 
FETCH FIRST 5 ROWS only; -- 지정된 행의 갯수나 퍼센트만큼만 반환 

SELECT empno, sal
FROM emp 
ORDER BY sal, EMPNO 
-- FETCH FIRST 5 ROWS WITH ties; // 마지막행에 동순위 포함해서 반환 
-- FETCH FIRST 50 percent ROWS only; -- 지정된 행의 갯수나 퍼센트만큼만 반환 
FETCH FIRST 50 ROWS only; -- 지정된 행의 갯수나 퍼센트만큼만 반환 




SELECT empno, sal, rownum
FROM emp 
ORDER BY rownum, sal, EMPNO 
offset 5 ROWS -- 5행 다음부터 보여준다. 

-- pivot절과 unpivot절 
pivot : 행을 열로 
unpivot : 열을 행으로 변환함 

-- 직업별 급여 
SELECT *
FROM (SELECT job, deptno, sal FROM emp)
pivot (sum(sal) FOR deptno IN (10,20,30))
ORDER BY job;


SELECT *
FROM (SELECT TO_char(hiredate, 'yyyy') AS yyyy, job, deptno, sal FROM emp)
pivot (sum(sal) FOR deptno IN (10,20,30))
ORDER BY job, yyyy;

-- pivot에서 sum 컬럼을 sal로 지정하였고, 출력시 d10_sal로 알리아스가 붙여져서 출력됨 
SELECT *
FROM (SELECT TO_char(hiredate, 'yyyy') AS yyyy, job, deptno, sal FROM emp)
pivot (sum(sal) AS sal FOR deptno IN (10 AS d10,20 AS d20,30 AS d30))
ORDER BY job, yyyy;


SELECT job, d20_sal
FROM (SELECT TO_char(hiredate, 'yyyy') AS yyyy, job, deptno, sal FROM emp)
pivot (sum(sal) AS sal FOR deptno IN (10 AS d10,20 AS d20,30 AS d30))
ORDER BY job;


SELECT *
FROM (SELECT TO_char(hiredate, 'yyyy') AS yyyy, job, deptno, sal FROM emp)
pivot (sum(sal) AS sal, count(*) AS cnt FOR deptno IN (10 AS d10,20 AS d20,30 AS d30))
ORDER BY job;

SELECT *
FROM (SELECT TO_char(hiredate, 'yyyy') AS yyyy, job, deptno, sal FROM emp)
pivot (sum(sal) AS sal
	 , count(*) AS cnt
		FOR (deptno, job) 
		IN (
			 (10, 'ANALYST') AS d10A, (10, 'CELRK') AS d10C,
			 (20, 'ANALYST') AS d20A, (20, 'CELRK') AS d20C
			)
		)
ORDER BY yyyy;


SELECT JOB
	, sum(CASE deptno WHEN 10 THEN sal end) AS d10_sal
	, sum(CASE deptno WHEN 20 THEN sal END) AS d20_Sal
	, sum(CASE deptno WHEN 30 THEN sal END) AS d30_sal
FROM EMP 
GROUP BY JOB 
ORDER BY JOB 

-- unpivot 열을 행으로 전환함 

SELECT job, deptno, sal
FROM T10 t2 
unpivot (sal FOR deptno IN (d10_sal, d20_Sal))
ORDER BY job, deptno;

WITH 
SELECT job, deptno, sal
FROM T10 t2 
unpivot incloud NULLS (Sal FOR deptno IN (d10_sal AS 10, d20_Sal AS 20))

WITH t1 AS
(
 
	SELECT JOB
		, sum(CASE deptno WHEN 10 THEN sal end) AS d10_sal
		, sum(CASE deptno WHEN 20 THEN sal END) AS d20_Sal
		, sum(CASE deptno WHEN 30 THEN sal END) AS d30_sal
	FROM EMP 
	GROUP BY JOB 
	ORDER BY JOB 
)

SELECT job, deptno, sal
FROM t1
unpivot (sal FOR deptno IN (d10_sal, d20_Sal))
ORDER BY job, deptno;

WITH t1 AS
(
 
	SELECT JOB
		, sum(CASE deptno WHEN 10 THEN sal end) AS d10_sal
		, sum(CASE deptno WHEN 20 THEN sal END) AS d20_Sal
		, sum(CASE deptno WHEN 30 THEN sal END) AS d30_sal
	FROM EMP 
	GROUP BY JOB 
	ORDER BY JOB 
)

SELECT job, deptno, sal
FROM t1
unpivot ((sal, cnt) FOR deptno IN ((d10_sal, d10_cnt) AS 10, (d20_Sal, d20_cnt) AS 20))
ORDER BY job, deptno;



