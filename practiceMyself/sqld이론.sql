ANSI/SPARC 의 3단계 스키마 요약 

외부 스키마 - 사용자 관점 
개념스키마 - 사용자 관점을 통합한 조직 전체의 DB
내부 스키마  - DB의 물리적 저장 구조 

엔티티 분류 - 유무와 발생시점 

부서 - 유무: 개념 / 발생: 기본 
교육이력, 구매 신청  - 유무: 사건 / 발생 - 중심 
구매신청상세 - 유무: 사건 / 발생: 행위 
사원 - 유무: 유형 / 발생: 기본 

구매 신청에 있는 주문번호는 인조식별자 이다. 

본테이블-상세테이블이 필수관계 인 경우 옆에 동그라미가 없음. 


제1정규화위반 - 한 테이블에 여러개의 같은속성의 컬럼이 있는 경우 
제3정규화위반 - 이행종속? 주문상품 테이블에 상품 고유의 컬럼이있는 경우 
제2정규화위반 - 주문상품테이블의 키컬럼 중 상품 ID가 있고 상품고유의컬럼이 있는 경우 