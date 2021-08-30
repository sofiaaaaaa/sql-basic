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