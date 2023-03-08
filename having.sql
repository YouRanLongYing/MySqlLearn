#having的条件查询，只能包含在前面的搜索结果里
/*select `name`, `birthday` from `student` having id > 2;*/
select `name`, `birthday`,id from `student` having id > 2;
select `name`, `birthday` from `student` WHERE id > 2;

select name as n,birthday as b,id as i from student having i > 2;
-- 报错，where只识别存在的字段
select name as n,birthday as b,id as i from student where i > 2;

-- 取出每个城市中满足最小出生年份大于1995的
select city, group_concat(birthday) from student group by city having
min(birthday) > '1995-1-1';