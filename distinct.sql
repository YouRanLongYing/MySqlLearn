-- DISTINCT : 去重
select distinct city from student;
#dual 是一个虚拟表, 仅仅为了保证 select ... from ... 语句的完整性
select now() from dual;