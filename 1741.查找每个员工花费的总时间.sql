CREATE TABLE Employees(
emp_id      int not NULL,
event_day   date not NULL,
in_time     int not NULL,
out_time    int ,
PRIMARY KEY(emp_id, event_day, in_time)
);

INSERT INTO Employees(emp_id, event_day , in_time , out_time) VALUES
(1 ,'2020-11-28',4  ,32  ),
(1 ,'2020-11-28',55 ,200 ),
(1 ,'2020-12-03',1  ,42  ),
(2 ,'2020-11-28',3  ,33  ),
(2 ,'2020-12-09',47 ,74  );

/*
编写一个SQL查询以计算每位员工每天在办公室花费的总时间（以分钟为单位）。 请注意，在一天之内，同一员工是可以多次进入和离开办公室的。 在办公室里一次进出所花费的时间为out_time 减去 in_time。

返回结果表单的顺序无要求。

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/find-total-time-spent-by-each-employee
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
SELECT t.event_day `day`, t.emp_id emp_id,SUM(t.priMin) total_time 
FROM (
	SELECT emp_id,event_day, (out_time - in_time) as priMin
	FROM Employees
	WHERE out_time is not NULL
) t
GROUP BY t.emp_id,t.event_day  
ORDER BY `day`,`emp_id`;

DROP TABLE Employees;


