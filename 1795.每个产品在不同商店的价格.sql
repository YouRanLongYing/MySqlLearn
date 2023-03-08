CREATE TABLE Products(product_id  int not NULL,store1 int,store2  int,store3 INT,PRIMARY KEY(product_id));

INSERT into Products(product_id,store1,store2,store3)VALUES
(0,95,100,105),
(1,70,NULL,80);

/*请你重构 Products 表，查询每个产品在不同商店的价格，使得输出的格式变为(product_id, store, price) 。如果这一产品在商店里没有出售，则不输出这一行。

输出结果表中的 顺序不作要求 。

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/rearrange-products-table*/
SELECT t.product_id product_id,t.store store,t.price price
FROM
(SELECT product_id,'store1' as store, store1 as price 
FROM Products
WHERE  store1 is not NULL
UNION ALL
SELECT product_id,'store2' as store, store2 as price 
FROM Products
WHERE  store2 is not NULL
UNION ALL
SELECT product_id,'store3' as store, store3 as price 
FROM Products
WHERE  store3 is not NULL) as t
ORDER BY t.product_id,t.store,t.price;

DROP TABLE Products;
