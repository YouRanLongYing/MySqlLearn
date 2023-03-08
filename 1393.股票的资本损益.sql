CREATE TABLE Stocks (
stock_name    VARCHAR(255) not NULL,
operation     ENUM('Sell','Buy'),
operation_day INT not NULL,
price         INT,
PRIMARY KEY(stock_name,operation_day)
);

INSERT INTO Stocks(stock_name,operation,operation_day,price) VALUES
('Leetcode'  ,'Buy' ,1  ,1000  ),
('Corona Masks'  ,'Buy' ,2  ,10    ),
('Leetcode'  ,'Sell' ,5  ,9000  ),
('Handbags'  ,'Buy' ,17 ,30000 ),
('Corona Masks'  ,'Sell' ,3  ,1010  ),
('Corona Masks'  ,'Buy' ,4  ,1000  ),
('Corona Masks'  ,'Sell' ,5  ,500   ),
('Corona Masks'  ,'Buy' ,6  ,1000  ),
('Handbags'  ,'Sell' ,29 ,7000  ),
('Corona Masks'  ,'Sell' ,10 ,10000 );
/*
编写一个SQL查询来报告每支股票的资本损益。

股票的资本损益是一次或多次买卖股票后的全部收益或损失。

以任意顺序返回结果即可。https://leetcode.cn/problems/capital-gainloss
*/
SELECT stock_name, SUM(abs_price) capital_gain_loss 
FROM (
	SELECT stock_name,(
			case when operation = 'Buy' THEN 0-price
			else price END
		) as abs_price
		FROM Stocks
) t
GROUP BY stock_name
ORDER BY stock_name ASC;

select stock_name, 
        sum(if(operation = 'Buy', -price, price)) capital_gain_loss
from Stocks
group by stock_name



