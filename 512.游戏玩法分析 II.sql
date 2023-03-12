CREATE TABLE if not EXISTS Activity(
player_id    int not NULL,
device_id    int,
event_date   date not NULL,
games_played int,
PRIMARY KEY(player_id,event_date)
);
INSERT IGNORE into Activity(player_id,device_id,event_date,games_played)VALUES
(1 ,2 ,'2016-03-01' ,5 ),
(1 ,2 ,'2016-05-02' ,6 ),
(2 ,3 ,'2017-06-25' ,1 ),
(3 ,1 ,'2016-03-02' ,0 ),
(3 ,4 ,'2018-07-03' ,5 );
/*
请编写一个 SQL 查询，描述每一个玩家首次登陆的设备名称
https://leetcode.cn/problems/game-play-analysis-ii/
*/

SELECT a.player_id,a.device_id
FROM Activity a JOIN (
SELECT player_id , MIN(event_date) min_date
FROM Activity
GROUP BY player_id
) t ON a.player_id = t.player_id and a.event_date = t.min_date;


# Write your MySQL query statement below

SELECT player_id
, device_id
FROM (
SELECT player_id
, device_id
, event_date
, min(event_date) OVER(PARTITION BY player_id) as first_log_date
FROM Activity) tmp
WHERE event_date = first_log_date;

DROP TABLE Activity;