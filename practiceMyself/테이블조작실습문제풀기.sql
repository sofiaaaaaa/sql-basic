drop table tb_movie_cust;
create table tb_movie_cust
(
 	cust_id char(10)  PRIMARY key
	, CUST_NM VARCHAR(50) NOT null
	, sex VARCHAR(6) NOT null check (sex in ('남자', '여자'))
	, birth_date date  NOT null
	, address VARCHAR(200)   null
	, phone_number VARCHAR(13)  null
	, cust_grade char(1) NOT null check (cust_grade in ('S', 'A', 'B', 'C', 'D'))
	, join_dt date  NOT null check (join_dt <= expire_dt)
	, expire_dt date  NOT null default to_date('9999.12.31', 'yyyy-mm-dd')
);


create table tb_movie_resv
(
 	resv_no char(10)  PRIMARY key
	, movie_id char(6) NOT null
	, theater_no char(6) NOT null
	, cust_id char(10)  NOT null references tb_movie_cust(cust_id) not null
	, movie_start_time timestamp  not null check (movie_start_time < movie_end_time)
	, movie_end_time timestamp  not null
	, seat_no char(4) NOT null 
);


-- 통계 
DELETE FROM TB_MOVIE_CUST
WHERE CUST_ID NOT IN ('0000000001', '0000000002', '0000000003');

COMMIT; 

INSERT INTO TB_MOVIE_CUST(CUST_ID, CUST_NM, SEX, BIRTH_DATE, ADDRESS, PHONE_NUMBER, CUST_GRADE,JOIN_DT) 
VALUES 
  ('0000000001', '이경오', '남자', TO_DATE('1984-06-12', 'YYYY-MM-DD'), '경기도 안양시 동안구 비산동 1-1', '010-1234-1234', 'S', TO_DATE('2017-01-01', 'YYYY-MM-DD'))
, ('0000000002', '홍길동', '남자', TO_DATE('1971-07-04', 'YYYY-MM-DD'), '경기도 안양시 동안구 비산동 1-2', '010-4321-4321', 'A', TO_DATE('2018-06-01', 'YYYY-MM-DD'))
, ('0000000003', '이수지', '여자', TO_DATE('1994-12-28', 'YYYY-MM-DD'), '경기도 안양시 동안구 비산동 1-3', '010-5678-5678', 'B', TO_DATE('2019-12-01', 'YYYY-MM-DD'))
; 


INSERT INTO TB_MOVIE_CUST(CUST_ID, CUST_NM, SEX, BIRTH_DATE, ADDRESS, PHONE_NUMBER, CUST_GRADE,JOIN_DT) 
VALUES 
  ('0000000004', '이승우', '남자', TO_DATE('1984-06-12', 'YYYY-MM-DD'), '경기도 안양시 동안구 비산동 1-1', '010-1234-1234', 'A', TO_DATE('2017-01-01', 'YYYY-MM-DD'))
, ('0000000005', '안정환', '남자', TO_DATE('1971-07-04', 'YYYY-MM-DD'), '경기도 안양시 동안구 비산동 1-2', '010-4321-4321', 'A', TO_DATE('2018-06-01', 'YYYY-MM-DD'))
, ('0000000006', '고종수', '여자', TO_DATE('1994-12-28', 'YYYY-MM-DD'), '경기도 안양시 동안구 비산동 1-3', '010-5678-5678', 'C', TO_DATE('2019-12-01', 'YYYY-MM-DD'))
, ('0000000007', '기성용', '남자', TO_DATE('1984-06-12', 'YYYY-MM-DD'), '경기도 안양시 동안구 비산동 1-1', '010-1234-1234', 'B', TO_DATE('2017-01-01', 'YYYY-MM-DD'))
, ('0000000008', '이청용', '남자', TO_DATE('1971-07-04', 'YYYY-MM-DD'), '경기도 안양시 동안구 비산동 1-2', '010-4321-4321', 'C', TO_DATE('2018-06-01', 'YYYY-MM-DD'))
, ('0000000009', '박지성', '여자', TO_DATE('1994-12-28', 'YYYY-MM-DD'), '경기도 안양시 동안구 비산동 1-3', '010-5678-5678', 'D', TO_DATE('2019-12-01', 'YYYY-MM-DD'))

;

commit;

select 
	  count(*) as 전체고객수 
    , count(distinct cust_grade) as 등급의갯수
    , round(max(avg_by_grade), 2) as 등급별평균고객수
    , max(max_by_grade)
    , min(min_by_grade)
    , min(grade_by_min_emp_count)
    , max(grade_by_max_emp_count)
from tb_movie_cust,
	(
		select 
			avg(cnt) avg_by_grade
			, max(cnt) max_by_grade
			, min(cnt) min_by_grade
		from 
			(
				SELECT 
					count(*) cnt
				FROM TB_MOVIE_CUST
				group by cust_grade
			) a
	) a,
	(
		select 
			    cust_grade as grade_by_min_emp_count
		  from (
				SELECT 
				       cust_grade
					 , count(*) cnt
				  FROM TB_MOVIE_CUST
				group by cust_grade
				order by cnt	 
			) a
		limit 1
	) b,
	(
		select 
			    cust_grade as grade_by_max_emp_count
		  from (
				SELECT 
				       cust_grade
					 , count(*) cnt
				  FROM TB_MOVIE_CUST
				group by cust_grade
				order by cnt desc	 
			) a
		limit 1
	) c
	
	

