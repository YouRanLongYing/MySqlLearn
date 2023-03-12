CREATE TABLE if not EXISTS Warehouse(
`name` VARCHAR(255),
product_id int,
units int,
PRIMARY KEY(`name`,product_id)
);
CREATE TABLE if not EXISTS Products(
product_id    int not NULL,
product_name  VARCHAR(50),
Width         int,
Length        int,
Height        INT,
PRIMARY KEY(product_id)
);
INSERT IGNORE INTO Warehouse(`name`,product_id , units )VALUES
('LCHouse1' ,1 ,1  ),
('LCHouse1' ,2 ,10 ),
('LCHouse1' ,3 ,5  ),
('LCHouse2' ,1 ,2  ),
('LCHouse2' ,2 ,2  ),
('LCHouse3' ,4 ,1  );
INSERT IGNORE INTO Products(product_id,product_name,Width ,Length,Height) VALUES
(1  ,'LC-TV'       ,5  ,50  ,40 ),
(2  ,'LC-KeyChain' ,5  ,5   ,5  ),
(3  ,'LC-Phone'    ,2  ,10  ,10 ),
(4  ,'LC-T-Shirt'  ,4  ,10  ,20 );
/*
写一个 SQL 查询来报告, 每个仓库的存货量是多少立方英尺.

返回结果没有顺序要求.
https://leetcode.cn/problems/warehouse-manager/
*/
SELECT w.`name` WAREHOUSE_NAME ,(SUM(w.units*p.Width*p.Height*p.Length)) VOLUME
FROM Warehouse w JOIN Products p ON w.product_id = p.product_id
GROUP BY w.`name`;

# Write your MySQL query statement below
select a.name as warehouse_name,
        sum(a.units*b.width*b.length*b.height) as volume
from
warehouse a, products b
where a.product_id=b.product_id
group by a.name

DROP TABLE Warehouse;
DROP TABLE Products;