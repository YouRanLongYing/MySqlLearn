CREATE TABLE Employee(
id int not NULL,
salary int,
PRIMARY KEY(id)
);

INSERT into Employee(id,salary)VALUES
(1,100),
(2,100),
(3,50);

-- DELETE FROM Employee WHERE id = 1;
-- DELETE FROM Employee WHERE id = 2;
-- DELETE FROM Employee WHERE id = 3;
/*
编写一个 SQL 查询，获取并返回 Employee 表中第二高的薪水 。
如果不存在第二高的薪水，查询应该返回 null 。
*/
SELECT
(case when ISNULL(SELECT COUNT(*) FROM Employee)  THEN NULL
ELSE
(
	SELECT distinct salary as SecondHighestSalary
	FROM (SELECT DISTINCT salary FROM Employee ORDER BY salary desc LIMIT 0,2) t
	WHERE t.salary not in (SELECT MAX(salary) FROM Employee)
)
END) as SecondHighestSalary;

SELECT
(case when (SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1) is NULL then NULL
ELSE (SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1)
END)as SecondHighestSalary;

SELECT IFNULL( (
	SELECT  salary
	FROM (SELECT DISTINCT salary FROM Employee ORDER BY salary desc LIMIT 0,2) t
	WHERE t.salary not in (SELECT MAX(salary) FROM Employee)
	GROUP BY t.salary),NULL)
 as SecondHighestSalary;
 
 # Write your MySQL query statement below
SELECT IFNULL((SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1), null) AS SecondHighestSalary ;

