CREATE TABLE Orders(
order_number    int not NULL,
customer_number int,
PRIMARY KEY(order_number)
);

INSERT into Orders(order_number,customer_number)VALUES
(1 ,1),
(2 ,2),
(3 ,3),
(4 ,3);



SELECT customer_number
FROM(
	SELECT count(*) count, customer_number
	FROM Orders 
	GROUP BY customer_number
	ORDER BY count DESC
	LIMIT 0,1
) t;

# Write your MySQL query statement below
select customer_number
from Orders
group by customer_number
Order by count(*) desc
limit 0,1;



DROP TABLE Orders;