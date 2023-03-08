CREATE TABLE IF not EXISTS Person(
id int not NULL,
email VARCHAR(255),
PRIMARY KEY(id)
);

INSERT IGNORE INTO Person(id,email)VALUES
(1,'a@b.com'),
(2,'c@d.com'),
(3,'a@b.com');

/*编写一个 SQL 查询来报告所有重复的电子邮件。 请注意，可以保证电子邮件字段不为 NULL。
以 任意顺序 返回结果表。
https://leetcode.cn/problems/duplicate-emails
*/

SELECT DISTINCT l.email Email
FROM Person l JOIN Person r on l.email = r.email and l.id != r.id;

# Write your MySQL query statement below
select email 
from Person
group by email 
having count(email)>1;

DROP TABLE Person;
