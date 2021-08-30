SELECT * 
FROM TB_EMP A, TB_EMP_CERTI B
WHERE NOT EXISTS (SELECT 1
	FROM TB_CERTI J
	, TB_EMP_CERTI K
	WHERE J.ISSUE_INSTI_NM IN ('오라클')
	AND J.CERTI_CD = K.CERTI_CD 
	AND K.EMP_NO = A.EMP_NO 
)
AND A.EMP_NO = B.EMP_NO 
ORDER BY A.EMP_NO 

-- 고객번호별로 누적된 판매금액 합계 보여주기 

SELECT cust_no, sale_amt
, sum(sale_amt) over(PARTITION BY cust_no ORDER BY sale_de ROWS BETWEEN
UNBOUNDED PRECEDING AND CURRENT ROW) AS amt
FROM tb_cust_ord;

SELECT * FROM tb_cust_ord 

SELECT * FROM tb_ord_test;


-- group by 조건이 붙어서 공집합이 생김. ( 조건에 부합하는 데이터가 없어성) 
 SELECT
	count(*) cnt ,
	nvl(sum(ord_amt), 0) AS ord_amt_sum
FROM
	tb_ord_test
WHERE
	ord_mm = '202010'
GROUP BY
	ord_Mm;


-- inner join 구문과 동일한 결과 
SELECT * 
FROM tb_emp a, tb_dept b
WHERE a.DEPT_CD = '100001'
AND b.DEPT_CD = '100001'

-- 절차형 sql모듈 : 사용자 정의 함수는 절차형 sql을 로직과 함께 데이터베이스 내에 저장해놓은 명령문의 
-- 집합을 의미한다.  


SELECT 
a.std_de
, a.sector_nm 
, max(cur_idx)
, max(std_tm) keep(DENSE_RANK LAST ORDER BY a.cur_idx) 
, min(cur_idx) 
, max(std_tm) keep(DENSE_RANK FIRST ORDER BY a.cur_idx)
FROM tb_real_idx a
WHERE std_de = '20200629'
GROUP BY a.std_de, a.sector_nm  


Scalar subquery 는 OUTER join과 결과가 같음 (select문에 쓰임)

inline VIEW  view와 유사함 (from절에 쓰임 )

nested subquery 는 조회조건 (WHERE 절에서 쓰임)


-- 소계 나타내는 방법 
1. GROUP BY select절을 여러개 만들어 UNION all로 붙임
2. GROUP BY GROUPING sets() 구문을 활용. 

SELECT color, dimension, sum(Quantity) AS quantity
FROM inventory 
GROUP BY GROUPING SETS ((color, dimension), (color), () ) 

--  * 전체 합계는 () 로 표시 

3. GROUP BY ROLLUP (컬럼명1, 컬럼명2..)구문 활용 하면 저렇게 조합들을 일일히 표시하지 않음 써놓은 컬럼들로 알아서 조합을 만들어줌 

SELECT color, dimension, sum(Quantity) AS quantity
FROM inventory 
GROUP BY ROLLUP (color, dimension) = GROUP BY GROUPING SETS ((color, dimension), (color), () ) 

4. GROUP BY CUBE (컬럼명1, 컬럼명2..)구문 활용하면 cube(n) = GROUPING sets(2^n)

SELECT color, dimension, sum(Quantity) AS quantity
FROM inventory 
GROUP BY CUBE (color, dimension) GROUP BY GROUPING SETS ((color, dimension), (color), (dimension), () ) 


-- 윈도우함수 

SELECT job, ename, sal,
	rank() over(ORDER BY sal desc) RANK, -- 1224
	DENSE_RANK() over(ORDER BY sal desc) DENSE_RANK , -- 1223
	ROW_NUMBER() over(ORDER BY sal desc) ROW_NUMBER  -- 1234
FROM emp;

