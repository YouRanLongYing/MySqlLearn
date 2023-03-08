CREATE TABLE if not EXISTS Users(
account      int not NULL,
`name` VARCHAR(255),
PRIMARY KEY(account)
);

CREATE TABLE if not EXISTS Transactions(
trans_id       int not NULL ,
account       int,
amount        int,
transacted_on date,
PRIMARY KEY(trans_id)
);
INSERT IGNORE INTO Users(account,`name`)VALUES
(900001 ,'Alice'),
(900002 ,'Bob'),
(900003 ,'Charlie');
INSERT IGNORE INTO Transactions(trans_id,account,amount,transacted_on)VALUES
(1  ,900001 ,7000   ,'2020-08-01'),
(2  ,900001 ,7000   ,'2020-09-01'),
(3  ,900001 ,-3000  ,'2020-09-02'),
(4  ,900002 ,1000   ,'2020-09-12'),
(5  ,900003 ,6000   ,'2020-08-07'),
(6  ,900003 ,6000   ,'2020-09-07'),
(7  ,900003 ,-4000  ,'2020-09-11');
/*
写一个 SQL,  报告余额高于 10000 的所有用户的名字和余额. 账户的余额等于包含该账户的所有交易的总和.

返回结果表单没有顺序要求.
https://leetcode.cn/problems/bank-account-summary-ii
*/

SELECT u.`name` `name` , SUM(t.amount) balance
FROM Users u JOIN Transactions t on u.account = t.account
GROUP BY u.account
HAVING balance > 10000;

# Write your MySQL query statement below
select  u.name ,  sum(amount)  balance    
from Users u, Transactions t
where u.account = t.account
group by u.account  having sum(amount) > 10000;


DROP TABLE Users;
DROP TABLE Transactions;