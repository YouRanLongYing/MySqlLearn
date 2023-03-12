CREATE TABLE if not EXISTS Calls(
from_id int,
to_id       int,
duration    INT
);

INSERT IGNORE INTO Calls(from_id,to_id,duration)VALUES
(1 ,2 ,59  ),
(2 ,1 ,11  ),
(1 ,3 ,20  ),
(3 ,4 ,100 ),
(3 ,4 ,200 ),
(3 ,4 ,200 ),
(4 ,3 ,499 );

/*
编写 SQL 语句，查询每一对用户 (person1, person2) 之间的通话次数和通话总时长，
其中 person1 < person2 。

以 任意顺序 返回结果表。

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/number-of-calls-between-two-persons
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

*/
select person1 ,person2,COUNT(1) call_count ,SUM(duration) total_duration 
from
(select from_id person1 ,to_id person2,duration  from Calls
where from_id < to_id
union all
select to_id person1,from_id person2,duration  from Calls
where from_id > to_id) t
group by person1,person2
order by person1 asc,person2 asc;

SELECT
    IF(from_id<to_id,from_id,to_id) person1,
    IF(from_id>to_id,from_id,to_id) person2,
    COUNT(*) call_count,
    SUM(duration) total_duration
FROM
    Calls
GROUP BY
    IF(from_id<to_id,from_id,to_id),
    IF(from_id>to_id,from_id,to_id)
order by person1 asc,person2 asc;

DROP TABLE Calls;
