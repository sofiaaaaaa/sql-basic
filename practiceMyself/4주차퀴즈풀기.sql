1. 벤더업체 아이디가 7번인 업체의 평균 배송일자가 몇일인가요? (반올림한 날짜로 확인해주세요.)

select round(1.5) ;

select * from vendors v 
where vendorid = 7


select shipdate ,  orderdate, round(avg(shipdate - orderdate)) from orders o 
inner join order_details od ON o.ordernumber  = od.ordernumber 
inner join product_vendors pv on pv.productnumber = od.productnumber 
							  and pv.vendorid = 7
  group by shipdate , orderdate
  
  
							  
  select round(avg(daystodeliver)) from product_vendors where vendorid = 7
  
  
  
 2. 701 번 직원 아이디를 가진 직원이 처리한 주문의 갯수는 몇개인가요?

 select * from employees e 
 
 select count(distinct ordernumber) from orders o 
 where employeeid = 701
 
 
 
 