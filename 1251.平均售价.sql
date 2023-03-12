CREATE TABLE if not EXISTS Prices(
product_id    int not NULL,
start_date    date not NULL,
end_date      date not NULL,
price         int,
PRIMARY KEY(product_id,start_date,end_date)
);

INSERT IGNORE INTO Prices(product_id,start_date,end_date,price)VALUES
(1 ,'2019-02-17' ,'2019-02-28',5  ),
(1 ,'2019-03-01' ,'2019-03-22',20 ),
(2 ,'2019-02-01' ,'2019-02-20',15 ),
(2 ,'2019-02-21' ,'2019-03-31',30 );

CREATE TABLE if not EXISTS UnitsSold(
product_id     int,
purchase_date  date,
units         int
);
INSERT IGNORE INTO UnitsSold(product_id,purchase_date,units)VALUES
(1 ,'2019-02-25',100),
(1 ,'2019-03-01',15 ),
(2 ,'2019-02-10',200),
(2 ,'2019-03-22',30 );

/*
https://leetcode.cn/problems/average-selling-price/
编写SQL查询以查找每种产品的平均售价。
average_price 应该四舍五入到小数点后两位。
*/
SELECT p.product_id ,  ROUND((SUM(p.price*u.units)/SUM(u.units)),2)  average_price 
FROM Prices p JOIN UnitsSold u on p.product_id = u.product_id and p.start_date <= u.purchase_date and p.end_date >= u.purchase_date
GROUP BY p.product_id;

# Write your MySQL query statement below
select t1.product_id
    ,round(sum(t1.units*t2.price)/sum(t1.units),2) average_price
from UnitsSold t1
inner join Prices t2
    on t1.product_id = t2.product_id
        and t1.Purchase_date>=t2.start_date
        and t1.Purchase_date<=t2.end_date
group by t1.product_id;

DROP TABLE Prices;
DROP TABLE UnitsSold;