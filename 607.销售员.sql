/*
CREATE TABLE `SalesPerson`  (
  `sales_id` int NOT NULL,
  `name` VARCHAR(255),
  `salary` int,
  `commission_rate` int,
  `hire_date` DATE,
  PRIMARY KEY (`sales_id`)
);

INSERT INTO `SalesPerson` 
(`sales_id`,
  `name`,
  `salary`,
  `commission_rate`,
  `hire_date`)
 VALUES
(1, "John", 100000, 6, "2006/4/1"),
(2, "Amy", 12000, 5,"2010/5/1"),
(3, "Mark", 65000, 12, "2008/12/25"),
(4, "Pam", 25000, 25,"2005/1/1"),
(5,"Alex",5000,10,"2007/2/3")

DROP TABLE `SalesPerson`

INSERT INTO school.Company(com_id,`name`,city)
VALUES
(1, "RED","Boston"), 
(2, "ORANGE", "New York"),
(3, "YELLOW", "Boston"),
(4, "GREEN", "Austin")

INSERT INTO school.Orders(order_id,order_date,com_id,sales_id,amount)
VALUES
(1,"2014/1/1",3,4,10000),
(2, "2014/2/1", 4, 5, 5000),
(3, "2014/3/1", 1, 1, 50000),
(4, "2014/4/1", 1, 4, 25000)
]]
*/
SELECT `name`
FROM SalesPerson
WHERE sales_id NOT IN ( 
 SELECT DISTINCT sales_id
FROM Company JOIN Orders ON Company.com_id = Orders.com_id
WHERE Company.`name` = 'RED');