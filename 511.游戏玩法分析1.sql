
CREATE TABLE `Activity`(
`player_id` int not NULL,
`device_id` int,
`event_date` DATE,
`games_played` int,
PRIMARY KEY (`player_id`,`event_date`)
);

INSERT INTO Activity(player_id,device_id,event_date,games_played)
VALUES
( 1         ,2         , '2016-03-01' , 5   ),
( 1         ,2         , '2016-05-02' , 6   ),
( 2         ,3         , '2017-06-25' , 1   ),
( 3         ,1         , '2016-03-02' , 0   ),
( 3         ,4         , '2018-07-03' , 5   );

/*写一条 SQL 查询语句获取每位玩家 第一次登陆平台的日期。
https://leetcode.cn/problems/game-play-analysis-i
*/
SELECT player_id,MIN(event_date) first_login 
FROM Activity
GROUP BY player_id
ORDER BY player_id;

# Write your MySQL query statement below
select player_id,event_date as first_login from (
	select player_id,event_date,ROW_NUMBER() OVER 
	(partition by player_id order by event_date) as rn from Activity
) t1 where rn=1

DROP TABLE `Activity`;
