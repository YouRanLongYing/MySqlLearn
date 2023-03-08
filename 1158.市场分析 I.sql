CREATE TABLE IF NOT EXISTS Users(
user_id        int not NULL,
join_date       date,
favorite_brand VARCHAR(255),
PRIMARY KEY(user_id)
);
INSERT IGNORE INTO Users(user_id,join_date,favorite_brand)VALUES
 (1,'2018-01-01'  ,'Lenovo' ),
 (2,'2018-02-09'  ,'Samsung'),
 (3,'2018-01-19'  ,'LG'     ),
 (4,'2018-05-21'  ,'HP'     );
 
 CREATE TABLE IF NOT EXISTS Orders (
 order_id      int not NULL,
 order_date     date,
 item_id       int,
 buyer_id int,
 seller_id     int,
 PRIMARY KEY(order_id)
 );
 REPLACE INTO Orders(order_id,order_date,item_id,buyer_id,seller_id)VALUES
 (1 ,'2019-08-01',4 ,1 , 2 ),
(2 ,'2018-08-02',2 ,1 , 3 ),
(3 ,'2019-08-03',3 ,2 , 3 ),
(4 ,'2018-08-04',1 ,4 , 2 ),
(5 ,'2018-08-04',1 ,3 , 4 ),
(6 ,'2019-08-05',2 ,2 , 4 );

CREATE TABLE IF NOT EXISTS Items(
item_id       int not NULL,
item_brand    VARCHAR(255),
PRIMARY KEY(item_id)
);

INSERT IGNORE INTO Items(item_id,item_brand)VALUES
(1,'Samsung'),
(2,'Lenovo'),
(3,'LG'),
(4,'HP');

/*
请写出一条SQL语句以查询每个用户的注册日期和在 2019 年作为买家的订单总数。

以 任意顺序 返回结果表。
https://leetcode.cn/problems/market-analysis-i/
*/

#嵌套查询
SELECT u.user_id buyer_id  ,u.join_date  ,IFNULL(COUNT(o.order_id),0) orders_in_2019 
FROM Users u LEFT JOIN 
    (SELECT * from Orders WHERE YEAR(order_date) = 2019) o 
		 ON u.user_id = o.buyer_id
GROUP BY u.user_id;

#双重条件连接
SELECT u.user_id buyer_id  ,u.join_date  ,IFNULL(COUNT(o.order_id),0) orders_in_2019 
FROM Users u LEFT JOIN Orders o ON u.user_id = o.buyer_id and YEAR(o.order_date)=2019
GROUP BY u.user_id;

#count表达式
SELECT u.user_id buyer_id  ,u.join_date  ,
IFNULL(COUNT(YEAR(o.order_date)=2019 or NULL),0) orders_in_2019 
FROM Users u LEFT JOIN Orders o ON u.user_id = o.buyer_id
GROUP BY u.user_id ;





DROP TABLE Users;
DROP TABLE Orders;
DROP TABLE Items;