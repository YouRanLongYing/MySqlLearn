CREATE TABLE if not EXISTS Product(
product_id int not NULL,
product_name VARCHAR(255),
unit_price   int,
PRIMARY KEY(product_id)
);
CREATE TABLE if not EXISTS Sales(
seller_id   int,
product_id  int,
buyer_id    int,
sale_date   date,
quantity    int,
price       INT
);
INSERT IGNORE INTO Product(product_id,product_name,unit_price)VALUES
(1 ,'S8' ,1000 ),
(2 ,'G4' ,800  ),
(3 ,'iPhone' ,1400 );
INSERT IGNORE INTO Sales(seller_id,product_id,buyer_id,sale_date,quantity,price)VALUES
(1,1,1,'2019-01-21',2,2000),
(1,2,2,'2019-02-17',1,800 ),
(2,2,3,'2019-06-02',1,800 ),
(3,3,4,'2019-05-13',2,2800);




/*
编写一个SQL查询，报告2019年春季才售出的产品。即仅在2019-01-01至2019-03-31（含）之间出售的商品。

以 任意顺序 返回结果表。
https://leetcode.cn/problems/sales-analysis-iii/
*/

SELECT DISTINCT p.product_id  ,p.product_name 
FROM Product p JOIN Sales s ON p.product_id = s.product_id
WHERE s.sale_date >= '2019-01-01' AND s.sale_date <= '2019-03-31' and p.product_id not in
(
	SELECT DISTINCT product_id
	FROM Sales
	WHERE sale_date < '2019-01-01' OR sale_date > '2019-03-31'
);


DROP TABLE Product;
DROP TABLE Sales;