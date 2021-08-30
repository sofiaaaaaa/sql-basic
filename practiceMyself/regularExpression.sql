정규표현식 
문자열검색, 치환 

-- "." 모든문자와 일치 
SELECT regexp_substr('aab', 'a.b') AS c1
FROM dual;

-- "|" 대체 문자 
SELECT regexp_substr('b', 'a|b') AS c1
FROM dual;

-- "\" 다음문자를 연산자가 아닌 일반 문자로 취급 
SELECT regexp_substr('a|b', 'a\|b') AS c1
FROM dual;

-- ^ 문자열의 시작 , $ 문자열의 끝 
chr(10) - > newline 

SELECT regexp_substr('ab' || chr(10) || 'cd' , '^.', 1, 1 ) AS c1
FROM dual;

SELECT regexp_substr('ab' || chr(10) || 'cd' , '^.', 1, 2 ) AS c1
FROM dual;

SELECT regexp_substr('ab' || chr(10) || 'cd' , '.$', 1, 1 ) AS c1
FROM dual;

SELECT regexp_substr('ab' || chr(10) || 'cd' , '.$', 1, 2 ) AS c1
FROM dual;

-- ? 0회 1회 일치 
-- * 0회 혹은 그이상횟수 일치 
-- + 1회 혹은 그이상횟수 일치 

-- {m} m회 일치 
-- {m,} 최소 m회 일치 
-- {,m} 최대 m회 일치 
-- {m,n} 최소 m회 일치, 최대 n회 일치  

 -- \n n번째 서브 표현식과 일치, n은 1~9 정수 

SELECT regexp_substr('abxab', '(ab|cd)x\1') AS c1, 
regexp_substr('ababab', '(.*)\1+') AS c1 -- 동일한 문자열이 1회 이상 반복되는 패턴 
FROM dual;

-- [char...] 문자리스트 중 한 문자와 일치 
-- [^char...] 문자리스트에 포함되지 않은 한 문자와 일치 

SELECT regexp_substr('abc', '[ab]c') AS c1
FROM dual;

-- [...-...] 문자 혹은 숫자의 범위를 의미 
SELECT regexp_substr('1a', '[0-9][a-z]') AS c1
FROM dual;

-- 문자리스트 
-- [:digit] = 숫자 = [0-9]
-- [:lower] = 소문 = [a-z]
-- [:alnum:]  = 영문자와 숫 = [0-9a-zA-Z]
-- [:xdigit:] = 16진수 = [0-9a-fA-f]
-- [:punct:] 구두점 기호 = [^:alnum:][:cntrl:]]

SELECT regexp_substr('gF1,', '[[:punct:]]') AS c1
FROM dual;

-- \d 숫자 
-- \D 숫자가 아닌 모든 문자 

SELECT regexp_substr('(650) 555-0100', '^\(\d{3}\) \d{3}-\d{4}$') AS c1
FROM dual;

-- \w 숫자와 영문자 
-- \W 숫자와 영문자가 아닌 모든 문자 

-- \s 공백 문자 
-- \S 공백 문자가 아닌 모든 문자 
SELECT regexp_substr('(a b )', '\(\w\s\w\s\)') AS c1
FROM dual;


-- Perl 연산자 nongreedy 방식 -패턴을 최소로 일치시키 ㅁ  
?? 0회 또는 1회 일치 
*? 0회 또는 그 이상의 횟수로 일치 
+? 1회 또는 그 이상의 횟수로 일치 

SELECT regexp_substr('aaaa', 'a??aa') AS c1
FROM dual;

-- {m}? m회 일치 

-- REGEXP_LIKE 

SELECT regexp_like(ename, '^S(COT|MIT)T$') AS c1
FROM emp;


