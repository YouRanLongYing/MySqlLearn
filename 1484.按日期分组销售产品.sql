
CREATE TABLE `Activities`(
sell_date    date ,
product VARCHAR(255)
);

INSERT INTO `Activities`(sell_date,product)
VALUES
('2020-05-30', 'Headphone' ),
('2020-06-01', 'Pencil'    ),
('2020-06-02', 'Mask'      ),
('2020-05-30', 'Basketball'),
('2020-06-01', 'Bible'     ),
('2020-06-02', 'Mask'      ),
('2020-05-30', 'T-Shirt'   );

SELECT * FROM `Activities`;

SELECT sell_date,COUNT(DISTINCT product) as 'num_sold' ,GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',') as 'products'
FROM `Activities`
GROUP BY sell_date
ORDER BY sell_date;

SELECT sell_date, 
    COUNT(DISTINCT(product)) AS num_sold, 
    GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ",") AS products 
FROM Activities
GROUP BY sell_date; 
-- DISTINCT 要去重，默认就要先排序

DROP TABLE `Activities`


