CREATE TABLE Users(
id int not NULL,
`name` VARCHAR(255),
PRIMARY KEY(id)
);

INSERT INTO Users(id,`name`)VALUES
(1  ,'Alice'   ),
(2  ,'Bob'     ),
(3  ,'Alex'    ),
(4  ,'Donald'  ),
(7  ,'Lee'     ),
(13 ,'Jonathan'),
(19 ,'Elvis'   );

CREATE TABLE Rides(
id int not NULL,
user_id int,
distance int,
PRIMARY KEY(id)
);

INSERT INTO Rides(id,user_id,distance)VALUES
 (1 ,1  ,120 ),
 (2 ,2  ,317 ),
 (3 ,3  ,222 ),
 (4 ,7  ,100 ),
 (5 ,13 ,312 ),
 (6 ,19 ,50  ),
 (7 ,7  ,120 ),
 (8 ,19 ,400 ),
 (9 ,7  ,230 );
/*
写一段 SQL , 报告每个用户的旅行距离。

返回的结果表单，以 travelled_distance 降序排列 ，如果有两个或者更多的用户旅行了相同的距离, 那么再以 name 升序排列 。

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/top-travellers
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

SELECT  `name`,(IFNULL(t.travelled_distance,0)) travelled_distance
FROM Users u LEFT JOIN (SELECT user_id, SUM(distance) travelled_distance
	FROM Rides GROUP BY user_id) t on u.id = t.user_id
ORDER BY travelled_distance DESC,name ASC;

SELECT  u.`name`,SUM(IFNULL(r.distance,0)) travelled_distance
FROM Users u LEFT JOIN  Rides r on u.id = r.user_id
GROUP BY u.id
ORDER BY travelled_distance DESC,name ASC;

# Write your MySQL query statement below
select name, travelled_distance
from 
(select a.name, sum(if(b.distance is null, 0, b.distance)) as travelled_distance
from
(select name, id
from Users) a
left join 
(select user_id, distance
from Rides) b on a.id = b.user_id
group by a.name, a.id) c
order by travelled_distance desc, name asc;

DROP TABLE Users;
DROP TABLE Rides;
