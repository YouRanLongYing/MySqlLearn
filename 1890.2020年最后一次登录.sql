CREATE TABLE Logins(
user_id        int not NULL,
time_stamp     datetime not NULL,
PRIMARY KEY(user_id,time_stamp)
);

INSERT into Logins(user_id,time_stamp)VALUES
(6  ,'2020-06-30 15:06:07'),
(6  ,'2021-04-21 14:06:06'),
(6  ,'2019-03-07 00:18:15'),
(8  ,'2020-02-01 05:10:53'),
(8  ,'2020-12-30 00:46:50'),
(2  ,'2020-01-16 02:49:50'),
(2  ,'2019-08-25 07:59:08'),
(14 ,'2019-07-14 09:00:00'),
(14 ,'2021-01-06 11:59:59');

/*
编写一个 SQL 查询，该查询可以获取在 2020 年登录过的所有用户的本年度 最后一次 登录时间。结果集 不 包含 2020 年没有登录过的用户。

返回的结果集可以按 任意顺序 排列。

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/the-latest-login-in-2020
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
SELECT user_id ,MAX(time_stamp) last_stamp
FROM Logins
WHERE YEAR(time_stamp) = 2020
GROUP BY user_id;

# Write your MySQL query statement below
select user_id,max(time_stamp) last_stamp 
from Logins 
where  user_id in (select distinct user_id from Logins where year(time_stamp)='2020') and year(time_stamp)='2020' 
group by user_id ;

DROP TABLE Logins;