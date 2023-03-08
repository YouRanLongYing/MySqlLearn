CREATE TABLE Employees
(
employee_id  int not NULL,
`name` VARCHAR(255),
primary KEY(employee_id)
);

INSERT INTO Employees(employee_id,`name`)
VALUES
(2,'Crew'),
(4,'Haven'),
(5,'Kristian');

CREATE TABLE Salaries(employee_id int not NULL,salary INT,PRIMARY KEY(employee_id));

INSERT INTO Salaries(employee_id,salary) VALUES
(5,76071),(1,22517),(4,63539);

/*写出一个查询语句，找到所有 丢失信息 的雇员id。当满足下面一个条件时，就被认为是雇员的信息丢失：
雇员的 姓名 丢失了，或者
雇员的 薪水信息 丢失了，或者
返回这些雇员的id  employee_id ， 从小到大排序 。
链接：https://leetcode.cn/problems/employees-with-missing-information
*/
(SELECT a.employee_id
FROM Employees as a LEFT JOIN Salaries as b ON a.employee_id = b.employee_id
WHERE b.employee_id is NULL
UNION
SELECT b.employee_id
FROM Employees as a RIGHT JOIN Salaries as b ON a.employee_id = b.employee_id
WHERE a.employee_id is NULL)
ORDER BY employee_id ASC;

# Write your MySQL query statement below


select employee_id from (
select employee_id from Employees 
union all
select employee_id from Salaries) t
group by employee_id having count(employee_id)=1 order by employee_id;
 

select employee_id from 
(
    select employee_id, count(1) cnt 
    from 
    (
        select employee_id from Employees
        union all 
        select employee_id from Salaries
    ) x 
    group by employee_id having cnt=1
) y order by employee_id;

DROP TABLE Employees;
DROP TABLE Salaries;
 
 