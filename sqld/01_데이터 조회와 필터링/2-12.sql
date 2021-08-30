--고객들에게 단체 이메일을 전송 하고자 한다. 
--CUSTOMER 테이블에서 고객의 EMAIL주소를 추출하고, 이메일 형식에 맞지 않는 이메일 주소는 제외시켜라. 
--(이메일 형식은 ‘@’가 존재해야 하고 ‘@’로 시작하지 말아야 하고 ‘@’로 끝나지 말아야 한다.)

--dbmsexpert@naver.com 

 SELECT EMAIL 
   FROM CUSTOMER
  WHERE EMAIL NOT LIKE '@%'
	AND EMAIL NOT LIKE '%@'
    AND EMAIL LIKE '%@%'
; 

