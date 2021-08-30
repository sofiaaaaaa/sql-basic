select * 
from customers
where custzipcode = '92199'



select sum(quotedprice  * quantityordered )
from order_details od 
where ordernumber  = 8


select count(distinct o.ordernumber)
  from orders o 
  inner join order_details od on o.ordernumber = od.ordernumber 
  inner join products p2 on od.productnumber = p2.productnumber 
 where orderdate = '2017-09-02'
   and (p2.productnumber = 1 or 
        p2.retailprice between 1000 and 2000)
 

        
        -- 4. 주문 일이 2017-09-02 일에 해당하면서, 상품 번호가 1 이거나 또는 상품의 개 당 가격이 $1000~$2000 달러 사이인 상품에 대한 구매 정보 가 포함된 주문 번호의 갯수를 알려주세요. ( 주문번호의 갯수는 중복 제거한 수량을 의미합니다.)

 select *
  from orders o 
  inner join order_details od on o.ordernumber = od.ordernumber 
  inner join products p2 on od.productnumber = p2.productnumber 
 where orderdate = '2017-09-02'
   and (p2.productnumber = 1 or 
        p2.retailprice between 1000 and 2000)
 
 