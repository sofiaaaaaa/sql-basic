 -- [ 데이터모델링의 이해 ] 
 

* 데이터 독립성 구성요소 
1. 외부스키마는 DB의 사용자 및 응용프로그램이 접근하는 스키마 
2. 개념스키마는 모든 사용자 관점을 통합한 조직 전체의 DB기술
3. 내부스키마는 물리적장치에서 데이터가 실제적으로 저장되는 방법을 표현하는 것 

 * 유형엔티티 (유무형에 따른 분류)
-> 물리적인 형태가 있고, 안정적이며 지속적으로 활용되는 엔티티 (사원, 물품, 강사, 교수) 

* 기본/키 엔티티 (발생시점에 따른 분류) 
-> 그 업무에 원래 존재하는 정보로써 다른 엔티티와 관계에 의해 생성되지 않고 독립적으로 생성이 가능한 엔티티 (사원, 부서, 고객, 교수)


수강신청 : 사건 엔티티, 중심 엔티티 
학부: 개념 엔티티, 기본/키 엔티티
수강신청이력: 사건 엔티티, 행위 엔티티 

한개의 엔티티는 2개이상의 인스턴스 집합이어야한다. 
한개의 속성은 1개의 속성값을 갖는다. 

한개의 속성이 2개이상 속성값을 가지면 제1정규화 위반임. 

식별자의 4대 특징 : 유일성, 최소성, 존재성, 불변성 


함수적 종속성 : 제2정규형 위반 

제2정규형 위반 :  pk속성은 부분적 함수 종속이 없어야한다. 모든 다른 속성을 종속시켜야함. 

반정규화 - 중복성의 원리를 활용해서 데이터 조회시 성능을 향상시키는 역할을 한다. 
반정규화의 종류 : 테이블 반정규화, 관계의 반정규화, 칼럼 반정규화 

* 로우체이닝 : 많은 블록에 데이터가 저장되면서 불필요한 block I/O가 발생함, 로우 길이가 넘 길어서 데이터 블록 하나에 모두 저장되지 않고
두개이상의 블록에 걸처 로우가 저장되는 형태. 
* 로우마이그레이션 : 데이터블록에서 수정이 발생하면 수정된 데이터를 해당데이터블록에서 저장하지 모사고 다른 블록의 빈공간을 찾아가는 방식. 

1byte를 찾기 위해 8192byte를 가져와야해서 성능이 안좋을 수 있다. 최적화가 필요함 


관리용이성이 떨어진다. 

* 슈퍼/서브 타입 데이터 모델변환 타입 비교 

1. OnetoOne type
개별 테이블 유지 
확장성 우수함 
조인 성능은 나쁨
I/O량 성능 좋음
관리하기 어려움 
트랜잭션 유형에 따른 선택 방법 - 개별테이블로 접근이 많은 경우 선택 

2. Plus type
슈퍼-서브타입 테이블 
확장성 보통 
조인성능 나쁨
I/O량 성능 좋음 
관리용이성 좋지 않음 

3. Single type
하나의 테이블로 이루어짐 
확장성 나쁨 
조인성능 우수함 
I/O 량 성능 나쁨 
관리 용이성 좋음 
전체를 일괄적으로 처리하는 경우 선택한다. 

* 분산데이터베이스 
- 응답속도가 빨라지고 통신비용이 줄어든다. 가용성, 신뢰성이 증가함. 데이터 무결성을 보장할 수 없다. 분산환경에 따라 불규칙한 응답속도가 단점. 


------------------------------------

-- [ sql 기본 활용 ]

select 	  ceil(3.14) /* 반올림 4 */
		, floor(3.14) /* 내림 3 */
		, sign(-3.14) /* sign 함수 -1 */
		, sign(3.14)  /* sign 함수 +1 */
		, abs(ceil(3.14) + floor(3.14) * sign(-3.14)) /* 4 + (3*-1) */
		, abs(-1) /* 절대값 1 */


		
		
select nvl(max(DUMMY), 'DUMMY') 
  from dual 
 where 1 = 0 -- 공집합 리턴 
 
 ----- 결과는 DUMMY 
 
 
 select count(dept_cd) -- null 값을 제외한 dept_cd 갯수 
 	  , count(*) -- 모든 행 갯수 
 	  , count(distinct dept_cd) -- null 값을 제외한 중복되지 않은 dept_cd 갯수 
   from	table_tmep;  
		
  
-- having과 group by 명령문의 순서는 따로 없음.    
  
  
  
  
--최고신장이 185가 넘는 선수가 존재하는 포지션의 평균키를 구하고 있음
SELECT A.POS_NM AS 포지션
     , AVG(HEIGHT) AS 평균키
  FROM TB_PLAYER_11 A
GROUP BY A.POS_NM
HAVING MAX(A.HEIGHT) >= 185
;


--널을 0으로 처리하고 역순정렬함
-- 역순처리할 때 NULL이 가장 큰 값으로 나타나기 때문 
SELECT *
  FROM TB_EMP_SAL_12 A
 WHERE A.STD_YYYY = '2019'
 ORDER BY NVL(A.SAL, 0) desc
 
 
 -- 2021.08.19 
 
 1. union -> union 기능 
 2. intersection  연산 -> intersection
 3. Difference 연산 -> except/minus기능 
 4. product -> cross join 
 
 
  sql에서 어떤 걸 실행할지는 옵티마이저가 순간순간 알아서 결정한다. 
  
 union all로 결합된 sql에서 첫번째 distinct는 첫번째 select에서만 유효함  
 
 order siblings by 는 형제 노드(동일 level) 사이에서 정렬을 수행한다. 
 
 
sys_connect_by_path


select dept_no
     , sys_connect_by_path(dept_nm, ',') as dept_nm
     , upper_dept_no
  from tb_dept_21
 start with upper_dept_no is null
 connect by prior dept_no = upper_dept_no;
 

* 서브쿼리가 사용가능한 위치 
select절, order by절, update문의 set절,
from, where, having, insert문의 value절 



-- ②
 SELECT A.EMP_NO, A.EMP_NM
      , (SELECT L.DEPT_NM FROM TB_DEPT_23 L WHERE L.DEPT_CD = A.DEPT_CD) AS DEPT_NM
      , A.BIRTH_DE
   FROM TB_EMP_23 A
   WHERE (A.DEPT_CD, BIRTH_DE) IN
                             (SELECT B.DEPT_CD, MIN(BIRTH_DE) --나이가많은 사람이 출력되지만
                                FROM TB_EMP_23 B GROUP BY B.DEPT_CD
                              )
 ORDER BY A.DEPT_CD, A.BIRTH_DE --DEPT_CD가 먼저 나와서 DEPT_CD로 정렬되게됨
 ;


-- 부서별 생일이 빠른 사람들을 생일이 빠른 순으로 정렬하기.. 
SELECT A.EMP_NO, A.EMP_NM
      , C.DEPT_NM AS DEPT_NM
      , A.BIRTH_DE
   FROM TB_EMP_23 A
      , (
             SELECT B.DEPT_CD, MIN(BIRTH_DE) AS BIRTH_DE
             FROM TB_EMP_23 B
             GROUP BY B.DEPT_CD
        ) B
      , TB_DEPT_23 C
 WHERE A.DEPT_CD = B.DEPT_CD(+)
  AND A.BIRTH_DE = B.BIRTH_DE(+)
  AND A.DEPT_CD = C.DEPT_CD(+)
  ORDER BY A.BIRTH_DE
  ;
 
 SELECT A.EMP_NO, A.EMP_NM
      , (SELECT L.DEPT_NM FROM TB_DEPT_23 L WHERE L.DEPT_CD = A.DEPT_CD) AS DEPT_NM
      , A.BIRTH_DE
   FROM TB_EMP_23 A
      , (
             SELECT B.DEPT_CD, MIN(BIRTH_DE) AS BIRTH_DE --나이많은사람이 나옴
             FROM TB_EMP_23 B
             GROUP BY B.DEPT_CD
        ) B
 WHERE A.DEPT_CD = B.DEPT_CD
  AND A.BIRTH_DE = B.BIRTH_DE
  ORDER BY A.BIRTH_DE --나이가 많은 순으로 나옴
  ;
  
 -- rollup 함수에 파라미터가 한개일 때 파라미터 컬럼 정보에 전체 합계 행이 덧붙여져 출력된다. 
 -- rollup (a, b) = grouping sets( (a,b), a, ())
 
 -- cube 함수는 grouping columns가 가질 수 있는 모든 경우의 수에 대비하여 subtotal을 생성하므로 grouping columns의 
 -- 수가 n이라고 가정하면 2의 n승 level의 subtotal을 생성하게 된다. 
 
 -- dense_rank() 함수 동일 순위가 있어도 다음 순위는 건너뛰지 않고 +1로 나타낸다. 
 
 -- ntile 함수 전체건수를 인자값으로 n등분한 결과 
 
 select a.emp_no
 	  , a.emp_nm
 	  , ntile(2) over (order by cur_sal desc ) as cur_sal_se
 	  , cur_sal 
 	from tb_emp_30 a 
 
 2021.08.22 
 	
-- * 옵티마이저가 풀테이블스캔방식을 선택하는 상황  
 sql where 절에 조건이 존재하지 않는 경우 
 sql where 절에 조건 중 사용 가능한 인덱스가 존재하지 않는 경우 
 옵티마이저의 판단 결과 테이블 풀 스캔이 비용상 유리하다고 판단하는 경우 
 
-- nl 조인의 연산과정 
 outer 집합에서 조건을 만족하는 첫번째 row를 찾는다. 
 outer 집합의 조인키를 가지고 inner 집합에 조인키가 존재하는지 찾으러감 
 inner 집합에서 outer 집합의 조인 컬럼의 값이 존재하는지 확인 
 inner 집합을 엑세스 하고 매칭되는 row를 결과 집합에 포함 
 outer 집합의 모든 row가 작업을 마칠 때까지 해당과정 반복 
 
 
 
 * 관계명은 현재진행형으로 표현하고 애매한 동사를 피한다. 
 
 * 인조식별자 (식별자의 속성의 수가 많아지지 않기 위해서 인조식별자를 사용)
 인조식별자를 사용하는 것과 유일성은 아무 관련이 없다. 
 
 
 * 범위 파티셔닝은 데이터보관주기에 따라 데이터를 쉽게 제거가능하지만
 해시 파티셔닝은 불가능하다. 
 
 * 테이블, 데이터 삭제 명령어 차이 
 1. drop : 테이블, 데이터 둘다 삭제 및 복구 불가능 
 2. truncate : 데이터 삭제 및 복구 불가능 
 3. delete: 데이터 삭제 및 복구 가능 rollback 
 
 
 * not between 구문은 null 인 데이터는 제외한다. 
 
 * 1분 = 1/24/60 
 
  -- 현재 시각에서 1분 제외한 시각 구하기 (oracle 기준 ) 
  
 select to_date('20200901120000', 'yyyymmddhh24miss')
  
 select to_char(to_date('20200901120000', 'yyyymmddhh24miss') - 1/24/60, 'yyyy-mm-dd hh24:mi:ss') ;


select decode('1', '1', '11', '22');


-- yyyy조건이 2018 인 행 중에서 무작위로 한 건의 데이터가 나와서 order by의 의미가 사라짐 
select * 
  from table_something
 where yyyy = '2018'
   and rownum <= 1
 order by a.sal desc 
  
 
 -- left outer join 왼쪽테이블의 내용은 다 나오고
 , 오른쪽 테이블은 매칭되는 "모든" 데이터를 보여준다. 
 
 
 -- union 과 union all의 차이 
 union은 중복을 제거하고 정리하여 보여주지만, union all은 각 결과를 붙여서 보여주기만 한다. 
 
 
 * 그룹함수 - 하나의 sql로 테이블을 한번만 읽어서 빠르게 원하는 리포트를 작성하는데 도움을 주며, 
 rollup, cube, grouping sets 함수가 있다. 
 
 
 -- 사용자 권한 부여 
 grant create table to dcl사용자; 
 revoke create table from dcl사용자; 
 

-- 트리거 내에서 commit, rollback 에 대한제어를 할 수 없다. 
-- 프로시저 create procedure / excute 명령어로 실행함 
-- 트리거 create trigger  / 생성후 자동 실행


-- 임시 데이터 생성 예시) 십만건의 임의 데이터 생성하기 
insert into tb_something 
select 
	lpad(rownum, 6, '0') as emp_no
	, dbms_random.string('U', 6)
	, to_char(ceil(mod(dbms_random.value(1,1000), 2)))
	, to_char(systdate - dbms_random.value(1,3650), 'yyyymmdd')
	, lpad(to_char(trunc(dbms_random.value(1.10))), 4, '0')
	, lpad(to_char(trunc(dbms_random.value(1,10))), 4, '0')
from dual connect by level <= 100000;

-- 인덱스 생성 
  where조건에서  = 조건인 컬럼 생성  (부정형 조건은 인덱스 스캔이 불가하다. )
  
  
 -- 실행할  sql 성능 모니터 수집 시작 명령문 
 alter session set statistics level = all;
 
-- 실행계획 조회  단축키 :  control + shift + e 


ANALYZE TABLE TB_EMP_37 COMPUTE STATISTICS FOR ALL INDEXES;


ALTER SESSION SET STATISTICS_LEVEL = ALL; 


SELECT /*+ INDEX(TB_EMP_37 IDX_TB_EMP_37_01) */ /* 2_37_TEST_2 */ 
       *
  FROM TB_EMP_37
 WHERE BIRTH_DT BETWEEN '20170101' AND '20191231'
   AND DEPT_CD = '0001'
   AND JOB_CD = '0002'
   AND SEX_CD <> '1'
;

SELECT SUBSTR(SQL_TEXT, 1, 30) SQL_TEXT,
       SQL_ID
     , CHILD_NUMBER
  FROM V$SQL
 WHERE SQL_TEXT LIKE '%2_37_TEST_2%'
   AND SQL_TEXT NOT LIKE '%V$SQL%'
  ;

 SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR('f5vvvw8b1xjwt', 0, 'ALLSTATS LAST'));

SQL_ID  f5vvvw8b1xjwt, child number 0
-------------------------------------
SELECT /*+ INDEX(TB_EMP_37 IDX_TB_EMP_37_01) */ /* 2_37_TEST_2 */ 
     
   *
   FROM TB_EMP_37
  WHERE BIRTH_DT BETWEEN '20170101' AND 
'20191231'
    AND DEPT_CD = '0001'
    AND JOB_CD = '0002'
    AND 
SEX_CD <> '1'

 
Plan hash value: 3463991687
 
------------------------------------------------------------------------------------------------------------------
| Id  | Operation                           | Name             | Starts | E-Rows | A-Rows |   A-Time   | Buffers |
------------------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                    |                  |      1 |        |    190 |00:00:00.01 |     372 |
|*  1 |  TABLE ACCESS BY INDEX ROWID BATCHED| TB_EMP_37        |      1 |    190 |    190 |00:00:00.01 |     372 |
|*  2 |   INDEX RANGE SCAN                  | IDX_TB_EMP_37_01 |      1 |    378 |    350 |00:00:00.01 |      23 |
------------------------------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter("SEX_CD"<>'1')
   2 - access("DEPT_CD"='0001' AND "JOB_CD"='0002' AND "BIRTH_DT">='20170101' AND "BIRTH_DT"<='20191231')
 

CREATE INDEX IDX_TB_EMP_37_02 ON TB_EMP_37(SEX_CD);

ALTER SESSION SET STATISTICS_LEVEL = ALL; 

SELECT /*+ INDEX(TB_EMP_37 IDX_TB_EMP_37_02) */ /* 2_37_TEST_3 */ 
       *
  FROM TB_EMP_37
  WHERE BIRTH_DT BETWEEN '20170101' AND '20191231'
    AND DEPT_CD = '0001'
    AND JOB_CD = '0002'
    AND SEX_CD <> '1'
;

SELECT SUBSTR(SQL_TEXT, 1, 30) SQL_TEXT,
       SQL_ID
     , CHILD_NUMBER
  FROM V$SQL
 WHERE SQL_TEXT LIKE '%2_37_TEST_3%'
   AND SQL_TEXT NOT LIKE '%V$SQL%'
  ;

 SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR('cw7yndqtj3s3w', 0, 'ALLSTATS LAST'));
 
SQL_ID  cw7yndqtj3s3w, child number 0
-------------------------------------
SELECT /*+ INDEX(TB_EMP_37 IDX_TB_EMP_37_02) */ /* 2_37_TEST_3 */ 
     
   *
   FROM TB_EMP_37
   WHERE BIRTH_DT BETWEEN '20170101' AND 
'20191231'
     AND DEPT_CD = '0001'
     AND JOB_CD = '0002'
     AND 
SEX_CD <> '1'

 
Plan hash value: 2247618533
 
---------------------------------------------------------------------------------------------------------------------------
| Id  | Operation                           | Name             | Starts | E-Rows | A-Rows |   A-Time   | Buffers | Reads  |
---------------------------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                    |                  |      1 |        |    190 |00:00:00.04 |     798 |    195 |
|*  1 |  TABLE ACCESS BY INDEX ROWID BATCHED| TB_EMP_37        |      1 |    190 |    190 |00:00:00.04 |     798 |    195 |
|*  2 |   INDEX FULL SCAN                   | IDX_TB_EMP_37_02 |      1 |  50162 |  50162 |00:00:00.02 |     215 |    195 |
---------------------------------------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter(("DEPT_CD"='0001' AND "JOB_CD"='0002' AND "BIRTH_DT">='20170101' AND "BIRTH_DT"<='20191231'))
   2 - filter("SEX_CD"<>'1')

   
   
  * hash 조인 연산과정 
  1. outer집합에서 주어진 조건을 만족하는 행을 찾는다. 
  2. outer집합의 조인키를 기준으로  hash 함수를 적용해서 hash 테이블 생성 
  3. hash 테이블에서 모든 대상 집합이 들어갈 때까지 반복 
  4. inner집합에서 주어진 조건을 만족하는 행을 찾는다. 
  5. inner집합의 join키를 기준으로 hash 함수를 적용해서 해당 버킷을 찾는다. 
  6. 조인에 성공하면 해당 row를 결과 집합에 포함함 
  7. inner집합에서 모든 대상건을 찾을 때까지 해당과정을 반복한다. 
  
  
  
  * 실행계획에 출력되는 "Optimizer=All_ROWS"는 옵티마이저의 실행계획을 생성하는 
  전략모드를 뜻하며 출력되는 결과 집합과는 상관이 없다. 