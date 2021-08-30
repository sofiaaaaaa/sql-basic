CREATE TABLE link (
	ID serial PRIMARY KEY
	, url varchar (255) NOT NULL
	, name varchar (255) NOT NULL
	, description varchar (255)
	, rel varchar (50)
)

-- '을 입력하고 싶을 때는 '' 두번 치자
INSERT 
INTO link 
(url, name)
VALUES
('''http''', 'naver');

select * from link;


-- 여러 행 한번에 입력하기 
INSERT 
INTO link 
(url, name)
VALUES
('''http''', 'naver3'),
('''http''', 'naver2');


/* select 문을 이용한 create table, insert */
create table link_tmp as 
select * from link where 0=1; 

insert 
into link_tmp 
select * 
from link;

-- except로 다른 데이터 찾기 
select * from link_tmp
except 
select * from link 


-- update : 동시성에 유의해야 한다. 
-- lock 이란 다른 사용자는 해당 행에 대해 작업하지 못한다는 것이다. 
-- update 를 한후 commit을 하지 못하면 rdbms의 동시성이 낮아진다. 

alter table link add column last_update date;
alter table link alter column last_update set default current_date; -- 현재일자로 기본값 설정하기 

select * from link 

update link 
set last_update = default
where last_update is null;



-- update join문 
-- update시 다른 테이블의 내용을 참조하고 싶을 때 사용. 

CREATE TABLE PRODUCT_SEGMENT 
(
  ID SERIAL PRIMARY KEY
, SEGMENT VARCHAR NOT NULL
, DISCOUNT NUMERIC (4, 2)
);
 
INSERT INTO PRODUCT_SEGMENT 
(SEGMENT, DISCOUNT)
VALUES
       ('Grand Luxury', 0.05)
     , ('Luxury', 0.06)
     , ('Mass', 0.1);
     
COMMIT; 

SELECT * FROM PRODUCT_SEGMENT; 








DROP TABLE PRODUCT; 
CREATE TABLE PRODUCT(
  ID SERIAL PRIMARY KEY
, NAME VARCHAR NOT NULL
, PRICE NUMERIC(10, 2)
, NET_PRICE NUMERIC(10, 2)
, SEGMENT_ID INT NOT NULL
, FOREIGN KEY(SEGMENT_ID) 
  REFERENCES PRODUCT_SEGMENT(ID)
);












INSERT INTO PRODUCT (NAME, PRICE, SEGMENT_ID) 
VALUES   
         ('K5', 804.89, 1)
       , ('K7', 228.55, 3)
       , ('K9', 366.45, 2)
       , ('SONATA', 145.33, 3)
       , ('SPARK', 551.77, 2)
       , ('AVANTE', 261.58, 3)
       , ('LOZTE', 519.62, 2)
       , ('SANTAFE', 843.31, 1)
       , ('TUSON', 254.18, 3)
       , ('TRAX', 427.78, 2)
       , ('ORANDO', 936.29, 1)
       , ('RAY', 910.34, 1)
       , ('MORNING', 208.33, 3)
       , ('VERNA', 985.45, 1)
       , ('K8', 841.26, 1)
       , ('TICO', 896.38, 1)
       , ('MATIZ', 575.74, 2)
       , ('SPORTAGE', 530.64, 2)
       , ('ACCENT', 892.43, 1)
       , ('TOSCA', 161.71, 3);

COMMIT; 

SELECT * FROM PRODUCT;


update product a  
   set net_price = a.price - (a.price * b.discount)
  from product_segment b
 where a.segment_id = b.id; 


UPDATE PRODUCT A
   SET NET_PRICE = A.PRICE - (A.PRICE * B.DISCOUNT)
  FROM PRODUCT_SEGMENT B
 WHERE A.SEGMENT_ID = B.ID;

SELECT * FROM PRODUCT; 

COMMIT; 

SELECT * FROM LINK_TMP; 

SELECT * FROM LINK; 



-- DELETE 문 
DELETE 
  FROM 
       LINK
WHERE ID = 5
;

COMMIT;




SELECT * FROM LINK; 

SELECT * FROM LINK_TMP;

-- delete join 문 
DELETE 
  FROM 
      LINK_TMP A
USING LINK B
WHERE A.ID = B.ID
;

COMMIT; 

SELECT * FROM LINK_TMP;

DELETE FROM LINK;

COMMIT; 

DELETE FROM LINK_TMP; 

COMMIT;

SELECT COUNT(*) FROM LINK; 

SELECT COUNT(*) FROM LINK_TMP;



CREATE TABLE CUSTOMERS 
(
   CUSTOMER_ID SERIAL PRIMARY KEY
 , NAME VARCHAR UNIQUE
 , EMAIL VARCHAR NOT NULL
 , ACTIVE BOOL NOT NULL DEFAULT TRUE
);

INSERT INTO CUSTOMERS (NAME, EMAIL)
VALUES
 ('IBM', 'contact@ibm.com'),
 ('Microsoft', 'contact@microsoft.com'),
 ('Intel', 'contact@intel.com');
 
COMMIT; 

SELECT * FROM CUSTOMERS; 


-- upsert문 
-- insert를 시도할 때 조건에 따라 update를 할 수 있는 구문 

INSERT INTO CUSTOMERS (NAME, EMAIL)
VALUES
 (
 'Microsoft',
 'hotline@microsoft.com'
 ) 
ON CONFLICT (NAME) 
DO NOTHING;


COMMIT;

SELECT * FROM CUSTOMERS; 

INSERT INTO CUSTOMERS (NAME, EMAIL)
VALUES
 (
 'Microsoft',
 'hotline@microsoft.com'
 ) 
ON CONFLICT (NAME) 
DO
 UPDATE
   SET EMAIL = EXCLUDED.EMAIL || ';' || CUSTOMERS.EMAIL; -- EXCLUDED.email은 위에서 insert시도한 email값 

  COMMIT;

SELECT * FROM CUSTOMERS; 


  
-- export 작업 


SELECT * FROM CATEGORY;

COPY CATEGORY(CATEGORY_ID, NAME, LAST_UPDATE) 
TO 'DB_CATEGORY.csv' 
DELIMITER ',' 
CSV HEADER;


COPY CATEGORY(CATEGORY_ID, NAME, LAST_UPDATE) 
TO 'C:\tmp\DB_CATEGORY.txt' 
DELIMITER '|' 
CSV HEADER
;

COPY CATEGORY(CATEGORY_ID, NAME, LAST_UPDATE) 
TO 'C:\tmp\DB_CATEGORY_2.csv' 
DELIMITER ',' 
CSV;



-- import  다른 형식의 테이터를 테이블에 입력하는 작업 
CREATE TABLE CATEGORY_IMPORT
(
  CATEGORY_ID SERIAL NOT NULL
, "NAME" VARCHAR(25) NOT NULL
, LAST_UPDATE TIMESTAMP NOT NULL DEFAULT NOW()
, CONSTRAINT CATEGORY_IMPORT_PKEY PRIMARY KEY (CATEGORY_ID)
);

SELECT * FROM CATEGORY_IMPORT; 

COPY CATEGORY_IMPORT(CATEGORY_ID, "NAME", LAST_UPDATE) 
FROM 'C:\tmp\DB_CATEGORY.csv' 
DELIMITER ',' 
CSV HEADER
;

SELECT * FROM CATEGORY_IMPORT;

DELETE FROM CATEGORY_IMPORT; 
COMMIT;

COPY CATEGORY_IMPORT(CATEGORY_ID, "NAME", LAST_UPDATE) 
FROM 'C:\tmp\DB_CATEGORY.txt' 
DELIMITER '|' 
CSV HEADER
;

SELECT * FROM CATEGORY_IMPORT;

DELETE FROM CATEGORY_IMPORT; 
COMMIT;

COPY CATEGORY_IMPORT(CATEGORY_ID, "NAME", LAST_UPDATE) 
FROM 'C:\tmp\DB_CATEGORY_2.csv' 
DELIMITER ',' 
CSV
;


SELECT * FROM CATEGORY_IMPORT;


-- 데이터 타입 



DROP TABLE DATA_TYPE_TEST_1; 
CREATE TABLE DATA_TYPE_TEST_1 
(
  	  A_BOOLEAN BOOLEAN
	, B_CHAR CHAR(10)
	, C_VARCHAR VARCHAR(10)
	, D_TEXT TEXT 
	, E_INT INT 
	, F_SMALLINT SMALLINT 
	, G_FLOAT FLOAT 
	, H_NUMERIC NUMERIC(15, 2)
);

INSERT INTO 
	DATA_TYPE_TEST_1
VALUES 
(
   TRUE --A_BOOLEAN
, 'ABCDE' --B_CHAR
, 'ABCDE' --C_VARCHAR
, 'TEXT' --D_TEXT
, 1000 --E_INT
, 10 --F_SMALLINT
, 10.12345 --G_FLOAT
, 10.25 --H_NUMERIC
);

COMMIT; 

SELECT * FROM DATA_TYPE_TEST_1;

ABCDE     
ABCDE



;
DROP TABLE DATA_TYPE_TEST_2; 
CREATE TABLE DATA_TYPE_TEST_2
(
  A_DATE DATE 
, B_TIME TIME
, C_TIMESTAMP TIMESTAMP
, D_ARRAY TEXT[] 
, E_JSON JSON 
)
;

INSERT INTO DATA_TYPE_TEST_2
VALUES 
	(
		CURRENT_DATE --A_DATE
		, LOCALTIME --B_TIME
		, CURRENT_TIMESTAMP --C_TIMESTAMP		
		, ARRAY [ '010-1234-1234','010-4321-4321' ] --D_ARRAY
		,  '{ "customer": "John Doe", "items": {"product": "Beer","qty": 6}}' --E_JSON
	)
;

COMMIT; 

SELECT * FROM DATA_TYPE_TEST_2; 

SELECT TO_CHAR(C_TIMESTAMP, 'YYYY-MM-DD HH24:MI:SS.MS'), C_TIMESTAMP FROM DATA_TYPE_TEST_2;







CREATE TABLE ACCOUNT(
  USER_ID SERIAL PRIMARY KEY
, USERNAME VARCHAR (50) UNIQUE NOT NULL
, PASSWORD VARCHAR (50) NOT NULL
, EMAIL VARCHAR (355) UNIQUE NOT NULL
, CREATED_ON TIMESTAMP NOT NULL
, LAST_LOGIN TIMESTAMP
);

CREATE TABLE ROLE(
  ROLE_ID SERIAL PRIMARY KEY
, ROLE_NAME VARCHAR (255) UNIQUE NOT NULL
);

CREATE TABLE ACCOUNT_ROLE
(
  USER_ID INTEGER NOT NULL
, ROLE_ID INTEGER NOT NULL
, GRANT_DATE TIMESTAMP WITHOUT TIME ZONE
, PRIMARY KEY (USER_ID, ROLE_ID)
, CONSTRAINT ACCOUNT_ROLE_ROLE_ID_FKEY FOREIGN KEY (ROLE_ID) 
  REFERENCES ROLE (ROLE_ID) MATCH SIMPLE 
  ON UPDATE NO ACTION ON DELETE NO ACTION
, CONSTRAINT ACCOUNT_ROLE_USER_ID_FKEY FOREIGN KEY (USER_ID) REFERENCES ACCOUNT (USER_ID) MATCH SIMPLE ON
  UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO ACCOUNT VALUES (1, '이경오', '1234', 'dbmsexpert@naver.com', CURRENT_TIMESTAMP, null );
COMMIT; 

SELECT * FROM ACCOUNT; 

INSERT INTO ROLE VALUES(1, 'DBA'); 
COMMIT;

SELECT * FROM ROLE; 

INSERT INTO ACCOUNT_ROLE VALUES(1, 1, CURRENT_TIMESTAMP); 

COMMIT; 

SELECT * FROM ACCOUNT_ROLE;

SELECT * FROM ACCOUNT; 

INSERT INTO ACCOUNT_ROLE VALUES(2, 1, CURRENT_TIMESTAMP);

SQL Error [23503]: 오류: "account_role" 테이블에서 자료 추가, 갱신 작업이 "account_role_user_id_fkey" 참조키(foreign key) 제약 조건을 위배했습니다
  Detail: (user_id)=(2) 키가 "account" 테이블에 없습니다.
  
SELECT * FROM ROLE;   
INSERT INTO ACCOUNT_ROLE VALUES(1, 2, CURRENT_TIMESTAMP);

SQL Error [23503]: 오류: "account_role" 테이블에서 자료 추가, 갱신 작업이 "account_role_role_id_fkey" 참조키(foreign key) 제약 조건을 위배했습니다
  Detail: (role_id)=(2) 키가 "role" 테이블에 없습니다.
  
;

SELECT * FROM ACCOUNT_ROLE; 
INSERT INTO ACCOUNT_ROLE VALUES(1, 1, CURRENT_TIMESTAMP);
SQL Error [23505]: 오류: 중복된 키 값이 "account_role_pkey" 고유 제약 조건을 위반함
  Detail: (user_id, role_id)=(1, 1) 키가 이미 있습니다.
;

UPDATE ACCOUNT 
SET USER_ID = 2
WHERE USER_ID = 1; 

SQL Error [23503]: 오류: "account" 테이블의 자료 갱신, 삭제 작업이 "account_role_user_id_fkey" 참조키(foreign key) 제약 조건 - "account_role" 테이블 - 을 위반했습니다
  Detail: (user_id)=(1) 키가 "account_role" 테이블에서 여전히 참조됩니다.
  
DELETE FROM ACCOUNT 
WHERE USER_ID = 1; 

SQL Error [23503]: 오류: "account" 테이블의 자료 갱신, 삭제 작업이 "account_role_user_id_fkey" 참조키(foreign key) 제약 조건 - "account_role" 테이블 - 을 위반했습니다
  Detail: (user_id)=(1) 키가 "account_role" 테이블에서 여전히 참조됩니다.
  
  
  


  
  





SELECT * FROM account; 


-- CTAS create table as select의 약자 

 SELECT
    A.FILM_ID,
    A.TITLE,
    A.RELEASE_YEAR,
    A.LENGTH,
    A.RATING
FROM
      FILM A
    , FILM_CATEGORY B 
WHERE A.FILM_ID = B.FILM_ID
AND B.CATEGORY_ID = 1
;

SELECT * FROM CATEGORY WHERE CATEGORY_ID = 1; 

CREATE TABLE ACTION_FILM AS 
SELECT
       A.FILM_ID
     , A.TITLE
     , A.RELEASE_YEAR
     , A.LENGTH
     , A.RATING
  FROM
       FILM A, FILM_CATEGORY B 
 WHERE A.FILM_ID = B.FILM_ID
   AND B.CATEGORY_ID = 1
;

SELECT * FROM ACTION_FILM; 






CREATE TABLE ACTION_FILM AS 
SELECT
       A.FILM_ID
     , A.TITLE
     , A.RELEASE_YEAR
     , A.LENGTH
     , A.RATING
  FROM
       FILM A, FILM_CATEGORY B 
 WHERE A.FILM_ID = B.FILM_ID
   AND B.CATEGORY_ID = 1
;

CREATE TABLE IF NOT EXISTS ACTION_FILM AS 
SELECT
       A.FILM_ID
     , A.TITLE
     , A.RELEASE_YEAR
     , A.LENGTH
     , A.RATING
  FROM
       FILM A, FILM_CATEGORY B 
 WHERE A.FILM_ID = B.FILM_ID
   AND B.CATEGORY_ID = 1
;

SELECT * FROM ACTION_FILM; 
 

-- 테이블 컬럼 변경 

DROP TABLE ASSETS; 

CREATE TABLE ASSETS (
  ID SERIAL PRIMARY KEY
, NAME TEXT NOT NULL
, ASSET_NO VARCHAR(10) NOT NULL
, DESCRIPTION TEXT
, LOCATION TEXT
, ACQUIRED_DATE DATE NOT NULL
);
 










INSERT INTO ASSETS (
  NAME
, ASSET_NO
, LOCATION
, ACQUIRED_DATE
)
VALUES
('Server', '10001', 'Server room', '2017-01-01'), 
('UPS', '10002', 'Server room', '2017-01-02');

COMMIT; 

SELECT * FROM ASSETS; 

ALTER TABLE ASSETS ALTER COLUMN NAME TYPE VARCHAR(50);

ALTER TABLE ASSETS 
    ALTER COLUMN LOCATION TYPE VARCHAR(100),
    ALTER COLUMN DESCRIPTION TYPE VARCHAR(500);
    
ALTER TABLE ASSETS ALTER COLUMN ASSET_NO TYPE INT;   

SQL Error [42804]: 오류: "asset_no" 칼럼의 자료형을 integer 형으로 형변환할 수 없음
  Hint: "USING asset_no::integer" 구문을 추가해야 할 것 같습니다.
  ;
  
ALTER TABLE ASSETS
    ALTER COLUMN ASSET_NO TYPE INT USING ASSET_NO::INTEGER; 
    
   
   
 --테이블 삭제 
 
   DROP VIEW CUSTOMER_DATA;
DROP TABLE CUSTOMERS;
DROP TABLE CUSTOMER_GROUPS;


CREATE TABLE CUSTOMER_GROUPS (
  ID SERIAL PRIMARY KEY
, NAME VARCHAR NOT NULL
);


CREATE TABLE CUSTOMERS (
  ID SERIAL PRIMARY KEY
, NAME VARCHAR NOT NULL
, PHONE VARCHAR NOT NULL
, EMAIL VARCHAR
, GROUP_ID INT
, FOREIGN KEY (GROUP_ID) REFERENCES CUSTOMER_GROUPS (ID)
);

CREATE VIEW CUSTOMER_DATA 
AS SELECT
    C.ID,
    C.NAME,
    G.NAME CUSTOMER_GROUP
FROM
     CUSTOMERS C
   , CUSTOMER_GROUPS G 
WHERE G.ID = C.GROUP_ID;

SELECT * FROM CUSTOMER_DATA; 





ALTER TABLE CUSTOMERS 
RENAME COLUMN EMAIL TO CONTACT_EMAIL;




SELECT * FROM CUSTOMERS; 

ALTER TABLE CUSTOMER_GROUPS 
RENAME COLUMN NAME TO GROUP_NAME;

SELECT * FROM CUSTOMER_GROUPS; 

SELECT * FROM customer_data; 
   
-- 자식테이블의 fk 삭제 후 부모 테이블 삭제 
drop table author cascade;


DROP VIEW CUSTOMER_DATA;
DROP TABLE CUSTOMERS;
DROP TABLE CUSTOMER_GROUPS;


CREATE TABLE CUSTOMER_GROUPS (
  ID SERIAL PRIMARY KEY
, NAME VARCHAR NOT NULL
);


CREATE TABLE CUSTOMERS (
  ID SERIAL PRIMARY KEY
, NAME VARCHAR NOT NULL
, PHONE VARCHAR NOT NULL
, EMAIL VARCHAR
, GROUP_ID INT
, FOREIGN KEY (GROUP_ID) REFERENCES CUSTOMER_GROUPS (ID)
);



CREATE VIEW CUSTOMER_DATA 
AS SELECT
    C.ID,
    C.NAME,
    G.NAME CUSTOMER_GROUP
FROM
     CUSTOMERS C
   , CUSTOMER_GROUPS G 
WHERE G.ID = C.GROUP_ID;

SELECT * FROM CUSTOMER_DATA; 





ALTER TABLE CUSTOMERS 
RENAME COLUMN EMAIL TO CONTACT_EMAIL;







SELECT * FROM CUSTOMERS; 

ALTER TABLE CUSTOMER_GROUPS 
RENAME COLUMN NAME TO GROUP_NAME;

SELECT * FROM CUSTOMER_GROUPS; 

SELECT * FROM customer_data; 

DROP TABLE TB_CUST_TEMP_TEST;

CREATE TEMP TABLE TB_CUST_TEMP_TEST(CUST_ID INT);

SELECT * FROM TB_CUST_TEMP_TEST;
INSERT INTO TB_CUST_TEMP_TEST VALUES (1); 

--세션 재접속 후
SELECT * FROM TB_CUST_TEMP_TEST;























SQL Error [42P01]: 오류: "tb_cust_temp_test" 이름의 릴레이션(relation)이 없습니다
  Position: 15
-----------------------------------------------------------------  

-- 임시 테이블은 DB 접속 세션의 활동기간 동안 존재하는 테이블이다. 
-- 세션이 종료되면 임시테이블은 자동으로 소멸된다. 

  
  
DROP TABLE TB_CUST_TEMP_TEST; 

--일반 테이블 
CREATE TABLE TB_CUST_TEMP_TEST(CUST_ID SERIAL PRIMARY KEY, CUST_NM VARCHAR NOT NULL);

SELECT * FROM TB_CUST_TEMP_TEST; 


CREATE TEMP TABLE TB_CUST_TEMP_TEST(CUST_ID INT);

SELECT * FROM TB_CUST_TEMP_TEST;

--세션 재접속

SELECT * FROM TB_CUST_TEMP_TEST;

DROP TABLE TB_CUST_TEMP_TEST;

SELECT * FROM TB_CUST_TEMP_TEST;

-----------------------------------------------------------------  

DROP TABLE TB_CUST_TEMP_TEST; 

CREATE TABLE TB_CUST_TEMP_TEST(CUST_ID SERIAL PRIMARY KEY, CUST_NM VARCHAR NOT NULL);

-- 임시테이블 
CREATE TEMP TABLE TB_CUST_TEMP_TEST(CUST_ID INT);

SELECT * FROM TB_CUST_TEMP_TEST;

DROP TABLE TB_CUST_TEMP_TEST;

SELECT * FROM TB_CUST_TEMP_TEST;




-- truncate 
-- 대용량의 테이블을 빠르게 지우는 방법. truncate 
-- 테이블의 세그먼트 자체를 바로 지우기 때문에 빠르게 데이터가 지워진다.
-- 테이블은 삭제하지 않고 데이터만 삭제한다. 속도가 빠르다. 
-- delete 명령어는 데이터는 지워지지만 용량은 줄어들지 않고 잘못 삭제하면 복원이 가능하지만 truncate는 되돌릴 수 없다. 

CREATE TABLE big_table AS 
SELECT * FROM account; 

INSERT INTO big_table
SELECT * FROM account; 


SELECT * from big_table; 

TRUNCATE TABLE big_table;

COMMIT; 
ROLLBACK; 

SELECT * from big_table;

INSERT INTO big_table
SELECT * FROM account; 
SELECT * from big_table;

TRUNCATE TABLE big_table;




-- CTAS 기법 으로 테이블 생성하기 
create table customer_rank as 


select 
   	   customer_id
   	  , sum(amount)
   	  , rank() over(order by sum(amount) desc)  customer_rank 
  from payment 
 group by customer_id 
 order by sum(amount) desc
 
 select 
        a.customer_id
       , row_number() over (order by a.sum_amount desc) as customer_rank 
   from
 	   (
		select 
		   	   customer_id
		   	  , sum(amount) as sum_amount
		  from payment 
		 group by customer_id 
		 order by sum(amount) desc
		 ) a

-- 월별  매출 순위 

create table customer_rank_yyyymm as 
select 
		customer_id
		, a.yyyymm
		, a.sum_amount
		, row_number() over(partition by a.yyyymm order by a.sum_amount desc) as rank_yyyymm
from (
		select 
			customer_id
			, to_char(payment_date, 'yyyymm') as yyyymm
			, sum(amount) as sum_amount
		from payment 
		group by customer_id, to_char(payment_date, 'yyyymm')
) a
order by yyyymm, rank_yyyymm;

select * from customer_rank_yyyymm



-- 데이터 타입 
CREATE TABLE STOCK_AVAILABILITY (
  PRODUCT_ID INT NOT NULL PRIMARY KEY
, AVAILABLE BOOLEAN NOT NULL
);

INSERT INTO STOCK_AVAILABILITY (PRODUCT_ID, AVAILABLE)
VALUES
 (100, TRUE),
 (200, FALSE),
 (300, 't'),
 (400, '1'),
 (500, 'y'),
 (600, 'yes'),
 (700, 'no'),
 (800, '0');
 
COMMIT; 

SELECT * FROM STOCK_AVAILABILITY;

SELECT
 *
FROM
 STOCK_AVAILABILITY
WHERE
 AVAILABLE = 'YES';
 
SELECT
 *
FROM
 stock_availability
WHERE
 available;
 
SELECT
 *
FROM
 STOCK_AVAILABILITY
WHERE
 AVAILABLE = 'NO';
 
SELECT
 *
FROM
 STOCK_AVAILABILITY
WHERE
 NOT AVAILABLE;




CREATE TABLE CHARACTER_TESTS (
 ID SERIAL PRIMARY KEY,
 X CHAR (3),
 Y VARCHAR (10),
 Z TEXT
);

INSERT INTO CHARACTER_TESTS
VALUES 
	(1, 'Y', 'YES', 'YESYESYES')
;

COMMIT; 

SELECT * 
FROM CHARACTER_TESTS; 

Y  
YES
YESYESYES


CREATE TABLE PRODUCTS 
(
  ID SERIAL PRIMARY KEY
, NAME VARCHAR NOT NULL
, PRICE NUMERIC (5, 2)
);

INSERT INTO PRODUCTS (NAME, PRICE)
VALUES
    ('Phone',500.215), 
    ('Tablet',500.214)
;

COMMIT;

SELECT * FROM PRODUCTS; 

INSERT INTO PRODUCTS (NAME, PRICE)
VALUES
    ('공기청정기',123456.21)
;

SQL Error [22003]: 오류: 수치 필드 오버플로우
  Detail: 전체 자릿수 5, 소수 자릿수 2의 필드는 10^3보다 작은 절대 값으로 반올림해야 합니다.

COMMIT;








INSERT INTO CHARACTER_TESTS
VALUES 
	(2, 'Y', 'Y', 'YESYESYES')
;

COMMIT; 

SELECT * FROM CHARACTER_TESTS
WHERE X = Y; 

Y  
Y

CREATE TABLE BOOKS (
  BOOK_ID SERIAL PRIMARY KEY
, TITLE VARCHAR (255) NOT NULL
, PAGES SMALLINT NOT NULL CHECK (PAGES > 0)
);

CREATE TABLE CITIES (
  CITY_ID SERIAL PRIMARY KEY
, CITY_NAME VARCHAR (255) NOT NULL
, POPULATION INT NOT NULL CHECK (POPULATION >= 0)
);







CREATE TABLE CUSTOMERS 
(
   CUSTOMER_ID SERIAL PRIMARY KEY
 , NAME VARCHAR UNIQUE
 , EMAIL VARCHAR NOT NULL
 , ACTIVE BOOL NOT NULL DEFAULT TRUE
);

INSERT INTO CUSTOMERS (NAME, EMAIL)
VALUES
 ('IBM', 'contact@ibm.com'),
 ('Microsoft', 'contact@microsoft.com'),
 ('Intel', 'contact@intel.com');
 
COMMIT; 

SELECT * FROM CUSTOMERS; 

INSERT INTO CUSTOMERS (NAME, EMAIL)
VALUES
 (
 'Microsoft',
 'hotline@microsoft.com'
 ) 
ON CONFLICT (NAME) 
DO NOTHING;

INSERT INTO CUSTOMERS (NAME, EMAIL)
VALUES
 (
 'Microsoft',
 'hotline@microsoft.com'
 ) 
 ;
ON CONFLICT (NAME) 
DO NOTHING;

COMMIT;

SELECT * FROM CUSTOMERS; 

INSERT INTO CUSTOMERS (NAME, EMAIL)
VALUES
 (
 'Microsoft',
 'hotline@microsoft.com'
 ) 
ON CONFLICT (NAME) 
DO
 UPDATE
   SET EMAIL = EXCLUDED.EMAIL || ';' || CUSTOMERS.EMAIL;

  COMMIT;

SELECT * FROM CUSTOMERS; 




CREATE TABLE TABLE_NAME
(
    ID SERIAL
);


INSERT INTO TABLE_NAME VALUES(DEFAULT);
COMMIT;
-------------------------------------------------------------
CREATE SEQUENCE TABLE_NAME_ID_SEQ;
 
CREATE TABLE TABLE_NAME 
(
    ID INTEGER NOT NULL DEFAULT NEXTVAL('TABLE_NAME_ID_SEQ')
);
 
ALTER SEQUENCE TABLE_NAME_ID_SEQ OWNED BY TABLE_NAME.ID;
INSERT INTO TABLE_NAME VALUES(DEFAULT);
COMMIT;
-----------------------------------------------------------
SELECT * FROM TABLE_NAME;
---------------------------------------------------------
CREATE TABLE FRUITS(
  ID SERIAL PRIMARY KEY
, NAME VARCHAR NOT NULL
);

INSERT INTO FRUITS(NAME) VALUES('orange');
INSERT INTO FRUITS(ID,NAME) VALUES(DEFAULT,'apple');

COMMIT; 

SELECT * FROM FRUITS;

SELECT CURRVAL(PG_GET_SERIAL_SEQUENCE('fruits', 'id'));



	
SELECT NOW()::date;

SELECT CURRENT_DATE;

SELECT TO_CHAR(NOW() :: DATE, 'dd/mm/yyyy');

SELECT TO_CHAR(NOW() :: DATE, 'Mon dd, yyyy');

SELECT
  FIRST_NAME
, LAST_NAME
, CREATE_DATE
, NOW() - CREATE_DATE AS DIFF
FROM
 CUSTOMER;
 
SELECT
  FIRST_NAME
, LAST_NAME
, AGE(CREATE_DATE) AS DIFF
FROM
 CUSTOMER;
 
SELECT 
       FIRST_NAME
     , LAST_NAME
     , EXTRACT (YEAR FROM CREATE_DATE) AS YEAR
     , EXTRACT (MONTH FROM CREATE_DATE) AS MONTH
     , EXTRACT (DAY FROM CREATE_DATE) AS DAY
  FROM
       CUSTOMER;
-----------------------------------------------------------       
SELECT CURRENT_TIME;

SELECT LOCALTIME;

SELECT
    LOCALTIME,
    EXTRACT (HOUR FROM LOCALTIME) AS HOUR,
    EXTRACT (MINUTE FROM LOCALTIME) AS MINUTE, 
    EXTRACT (SECOND FROM LOCALTIME) AS SECOND, 
    EXTRACT (MILLISECONDS FROM LOCALTIME) AS MILLISECONDS; 
;	    

SELECT TIME '10:00' - TIME '02:00' AS DIFF;

SELECT TIME '10:59' - TIME '02:01' AS DIFF;

SELECT TIME '10:59:59' - TIME '02:01:01' AS DIFF;



SELECT LOCALTIME
	 , LOCALTIME + INTERVAL '2 HOURS' AS PLUS_2HOURS
	 , LOCALTIME - INTERVAL '2 HOURS' AS MINUS_2HOURS
;


SELECT LOCALTIME;




SELECT NOW();
SELECT CURRENT_TIMESTAMP;

SELECT TIMEOFDAY();


SELECT 
	  TO_CHAR(current_timestamp, 'YYYY')
	, TO_CHAR(current_timestamp, 'YYYY-MM')
	, TO_CHAR(current_timestamp, 'YYYY-MM-DD')
	, TO_CHAR(current_timestamp, 'YYYY-MM-DD HH24')
	, TO_CHAR(current_timestamp, 'YYYY-MM-DD HH24:MI')
	, TO_CHAR(current_timestamp, 'YYYY-MM-DD HH24:MI:SS')
    , TO_CHAR(current_timestamp, 'YYYY-MM-DD HH24:MI:SS.MS') -- 밀리세컨드 
    , TO_CHAR(current_timestamp, 'YYYY-MM-DD HH24:MI:SS.US'); -- 마이크로 세컨드 
    
    
    
  SELECT
	    SUM (
			CASE
		    WHEN RENTAL_RATE = 0.99 THEN 1
		    ELSE 0
	         END 
	       ) AS "C"
	  , SUM (
	        CASE
		    WHEN RENTAL_RATE = 2.99 THEN 1
		    ELSE 0
	         END ) AS "B"
	  , SUM (
	        CASE
		    WHEN RENTAL_RATE = 4.99 THEN 1
		    ELSE 0
	         END ) AS "A"
   FROM
	    FILM;
	    
|C  |B  |A  
|---|---|---
|341|323|336
;


SELECT 
	RENTAL_RATE, COUNT(*) CNT 
FROM FILM 
GROUP BY RENTAL_RATE; 


|rental_rate|cnt
|-----------|---
|       2.99|323
|       4.99|336
|       0.99|341;
 


SELECT * 
FROM 
	(
	SELECT 
		  SUM(CASE WHEN RENTAL_RATE = 0.99 THEN CNT ELSE 0 END) AS C 
		, SUM(CASE WHEN RENTAL_RATE = 2.99 THEN CNT ELSE 0 END) AS B
		, SUM(CASE WHEN RENTAL_RATE = 4.99 THEN CNT ELSE 0 END) AS A		   
	FROM 
	(
		SELECT 
			RENTAL_RATE, COUNT(*) CNT 
		FROM FILM 
		GROUP BY RENTAL_RATE
	) A
) A 
;  


DROP TABLE TB_ITEM_COALESCE_TEST; 

CREATE TABLE TB_ITEM_COALESCE_TEST (
  ID SERIAL PRIMARY KEY
, PRODUCT VARCHAR (100) NOT NULL
, PRICE NUMERIC NOT NULL
, DISCOUNT NUMERIC
);

INSERT INTO TB_ITEM_COALESCE_TEST (PRODUCT, PRICE, DISCOUNT)
VALUES
 ('A', 1000 ,10),
 ('B', 1500 ,20),
 ('C', 800 ,5),
 ('D', 500, NULL);
 
COMMIT; 

SELECT * FROM TB_ITEM_COALESCE_TEST; 

SELECT
	   PRODUCT
	 , (PRICE - DISCOUNT) AS NET_PRICE
  FROM
	  TB_ITEM_COALESCE_TEST;
	  
	 
|product|net_price
|-------|---------
|A      |      990
|B      |     1480
|C      |      795
|D      |         	 
;

SELECT
	   PRODUCT, price, discount, COALESCE(DISCOUNT, 0)
	 , (PRICE - COALESCE(DISCOUNT, 0)) AS NET_PRICE
  FROM
	   TB_ITEM_COALESCE_TEST;
	   
|product|net_price
|-------|---------
|A      |      990
|B      |     1480
|C      |      795
|D      |      500
;

SELECT
	   PRODUCT
	 , ( PRICE -
	             CASE
		         WHEN DISCOUNT IS NULL THEN 0
		         ELSE DISCOUNT
	              END ) AS NET_PRICE
  FROM
	   TB_ITEM_COALESCE_TEST;
	   
	  
	  
  
  CREATE TABLE TB_MEMBER_NULLIF_TEST (
  ID SERIAL PRIMARY KEY
, first_name VARCHAR (50) NOT NULL
, last_name VARCHAR (50) NOT NULL
, gender SMALLINT NOT NULL -- 1: male, 2 female
);



INSERT INTO TB_MEMBER_NULLIF_TEST (
  FIRST_NAME
, LAST_NAME
, GENDER
)
VALUES
   ('John', 'Doe', 1)
 , ('David', 'Dave', 1)
 , ('Bush', 'Lily', 2)
;

COMMIT;

SELECT * FROM TB_MEMBER_NULLIF_TEST;

|id|first_name|last_name|gender
|--|----------|---------|------
| 1|John      |Doe      |     1
| 2|David     |Dave     |     1
| 3|Bush      |Lily     |     2
;

SELECT
	(SUM (
	CASE
		WHEN GENDER = 1 THEN 1
		ELSE 0
	END ) / SUM (
	CASE
		WHEN GENDER = 2 THEN 1
		ELSE 0
	END ) ) * 100 AS "MALE/FEMALE RATIO"
FROM
	TB_MEMBER_NULLIF_TEST;
	
|MALE/FEMALE RATIO
|-----------------
|              200
;

UPDATE TB_MEMBER_NULLIF_TEST 
   SET GENDER = 1
 WHERE GENDER = 2;

COMMIT; 
 
SELECT * FROM TB_MEMBER_NULLIF_TEST;

SELECT
(SUM(CASE WHEN GENDER = 1 THEN 1 ELSE 0 END) / SUM(CASE WHEN GENDER = 2 THEN 1 ELSE 0 END) ) * 100 AS "MALE/FEMALE RATIO"
FROM
TB_MEMBER_NULLIF_TEST;

SQL Error [22012]: 오류: 0으로는 나눌수 없습니다.
;




SELECT
(SUM(CASE WHEN GENDER = 1 THEN 1 ELSE 0 END) / 
 NULLIF(SUM(CASE WHEN GENDER = 2 THEN 1 ELSE 0 END), 0)
 ) * 100 AS "MALE/FEMALE RATIO"
FROM
TB_MEMBER_NULLIF_TEST;

|MALE/FEMALE RATIO
|-----------------
|           (NULL)






SELECT CAST ('100' AS INTEGER);
 
|int4
|----
| 100
;

SELECT CAST ('10C' AS INTEGER);
 
SQL Error [22P02]: 오류: 정수 자료형 대한 잘못된 입력 구문: "10C"
  Position: 16
  ;
  
SELECT  CAST ('2015-01-01' AS DATE);
 
|date      
|----------
|2015-01-01
;

SELECT
 CAST ('10.2' AS DOUBLE PRECISION);
 
|float8
|------
|  10.2

;

SELECT
 '100'::INTEGER;

SELECT
 '10C'::INTEGER;

SELECT 
  '2015-01-01'::DATE; 
 
 SELECT
  '10.2'::DOUBLE PRECISION;

 
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
   (1 , '이경오', NULL)
 , (2 , '김한이', 1)
 , (3 , '김승범', 1)
 , (4 , '하선주', 1)
 , (5 , '송백선', 1)
 , (6 , '이슬이', 2)
 , (7 , '홍발순', 2)
 , (8 , '김미순', 2)
 , (9 , '김선태', 2)
 , (10, '이선형', 3)
 , (11, '김선미', 3)
 , (12, '김선훈', 3)
 , (13, '이왕준', 3)
 , (14, '김사원', 4)
 , (15, '이시원', 4)
 , (16, '최선영', 7)
 , (17, '박태후', 7)
 , (18, '최민준', 8)
 , (19, '정택헌', 8)
 , (20, '노가람', 8)
;

COMMIT; 

SELECT * FROM TB_EMP_RECURSIVE_TEST; 


SELECT
	   FILM_ID
	 , TITLE
	 ,
	 (CASE
		WHEN LENGTH < 30 THEN 'SHORT'
		WHEN LENGTH >= 30
		AND LENGTH < 90 THEN 'MEDIUM'
		WHEN LENGTH > 90 THEN 'LONG'
	  END) LENGTH
  FROM
	   FILM
;	   

WITH TMP1 AS (
SELECT
	   FILM_ID
	 , TITLE
	 ,
	 (CASE
		WHEN LENGTH < 30 THEN 'SHORT'
		WHEN LENGTH >= 30
		AND LENGTH < 90 THEN 'MEDIUM'
		WHEN LENGTH > 90 THEN 'LONG'
	  END) LENGTH
  FROM
	   FILM
)
SELECT * FROM TMP1; 
;


WITH TMP1 AS (
SELECT
       FILM_ID
     , TITLE
     ,
       (CASE
        WHEN LENGTH < 30 THEN 'SHORT'
        WHEN LENGTH >= 30 AND LENGTH < 90 THEN 'MEDIUM'
        WHEN LENGTH > 90 THEN 'LONG'
        END) LENGTH
  FROM
       FILM
)
SELECT * FROM TMP1 WHERE LENGTH = 'LONG'; 

SELECT
	   FILM_ID
	 , TITLE
	 ,
	 (CASE
		WHEN LENGTH < 30 THEN 'SHORT'
		WHEN LENGTH >= 30
		AND LENGTH < 90 THEN 'MEDIUM'
		WHEN LENGTH > 90 THEN 'LONG'
	  END) LENGTH
  FROM
	   FILM
;	   

WITH TMP1 AS (
SELECT
	   FILM_ID
	 , TITLE
	 ,
	 (CASE
		WHEN LENGTH < 30 THEN 'SHORT'
		WHEN LENGTH >= 30
		AND LENGTH < 90 THEN 'MEDIUM'
		WHEN LENGTH > 90 THEN 'LONG'
	  END) LENGTH
  FROM
	   FILM
)
SELECT * FROM TMP1; 
;

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
   (1 , '이경오', NULL)
 , (2 , '김한이', 1)
 , (3 , '김승범', 1)
 , (4 , '하선주', 1)
 , (5 , '송백선', 1)
 , (6 , '이슬이', 2)
 , (7 , '홍발순', 2)
 , (8 , '김미순', 2)
 , (9 , '김선태', 2)
 , (10, '이선형', 3)
 , (11, '김선미', 3)
 , (12, '김선훈', 3)
 , (13, '이왕준', 3)
 , (14, '김사원', 4)
 , (15, '이시원', 4)
 , (16, '최선영', 7)
 , (17, '박태후', 7)
 , (18, '최민준', 8)
 , (19, '정택헌', 8)
 , (20, '노가람', 8)
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
|          1|          |이경오            
|          2|         1|    김한이        
|          3|         1|    김승범        
|          4|         1|    하선주        
|          5|         1|    송백선        
|          6|         2|        이슬이    
|          7|         2|        홍발순    
|          8|         2|        김미순    
|          9|         2|        김선태    
|         10|         3|        이선형    
|         11|         3|        김선미    
|         12|         3|        김선훈    
|         13|         3|        이왕준    
|         14|         4|        김사원    
|         15|         4|        이시원    
|         16|         7|            최선영
|         17|         7|            박태후
|         18|         8|            최민준
|         19|         8|            정택헌
|         20|         8|            노가람
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
|          2|         1|김한이        
|          6|         2|    이슬이    
|          7|         2|    홍발순    
|          8|         2|    김미순    
|          9|         2|    김선태    
|         16|         7|        최선영
|         17|         7|        박태후
|         18|         8|        최민준
|         19|         8|        정택헌
|         20|         8|        노가람




CREATE TABLE BASKET(
  ID SERIAL PRIMARY KEY
, FRUIT VARCHAR(50) NOT NULL
);

INSERT INTO BASKET(FRUIT) VALUES('APPLE');
INSERT INTO BASKET(FRUIT) VALUES('APPLE');
INSERT INTO BASKET(FRUIT) VALUES('ORANGE');
INSERT INTO BASKET(FRUIT) VALUES('ORANGE');
INSERT INTO BASKET(FRUIT) VALUES('ORANGE');
INSERT INTO BASKET(FRUIT) VALUES('BANANA');

COMMIT; 

SELECT * FROM BASKET; 

|id|fruit 
|--|------
| 1|APPLE 
| 2|APPLE 
| 3|ORANGE
| 4|ORANGE
| 5|ORANGE
| 6|BANANA
;

select 
	id,
	fruit,
	row_num
from 
(
	select row_number() over(partition by a.fruit order by a.id) row_num, 
		   a.id,
		   a.fruit
	  from basket a
) a
where a.row_num > 1
 
 

SELECT
	ID, FRUIT, ROW_NUM
FROM
	(
		SELECT 
			   ID
			 , FRUIT 
		     , ROW_NUMBER() OVER( PARTITION BY FRUIT ORDER BY ID ASC) AS ROW_NUM
	      FROM BASKET ) T
WHERE
	T.ROW_NUM > 1 ;

|id|fruit |row_num
|--|------|-------
| 2|APPLE |      2
| 4|ORANGE|      2
| 5|ORANGE|      3

DELETE FROM BASKET
WHERE ID IN 
(SELECT
	   ID
   FROM
	  (
		SELECT 
			   ID
			 , FRUIT 
		     , ROW_NUMBER() OVER( PARTITION BY FRUIT ORDER BY ID ASC) AS ROW_NUM
	      FROM BASKET ) T
  WHERE T.ROW_NUM > 1);
  
 COMMIT; 
 
SELECT * FROM BASKET; 

|id|fruit 
|--|------
| 1|APPLE 
| 3|ORANGE
| 6|BANANA



select * from film;


with tmp as (
	select 
		   rating 
		  , film_id 
		  , title
		  , length
		  , row_number() over(partition by rating order by length desc) row_num
	from film 
	group by 
			rating
		  , film_id 
		  , title
	order by rating, length desc
)
select 
	   rating
	 , film_id 
	 , title
  from tmp
where row_num = 1
order by rating