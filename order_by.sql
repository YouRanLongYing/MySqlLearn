select * from student order by student.birthday;

select * from student order by birthday desc;

select city,avg(money),group_concat(name),sum(money) 
from student 
group by city 
having sum(money)>70 
order by sum(money);
/*
select 字段 from 表名 limit m; -- 从第 1 行到第 m 行
select 字段 from 表名 limit m, n; -- 从第 m 行开始，往下取 n 行
select 字段 from 表名 limit m offset n; -- 跳过前 n 行, 取后面的 m 行
*/