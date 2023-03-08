CREATE TABLE if not EXISTS ActorDirector(
actor_id    int not NULL,
director_id  int not NULL,
`timestamp`   INT,
PRIMARY KEY(`timestamp`)
);

REPLACE INTO ActorDirector(actor_id,director_id,`timestamp`)VALUES
(1 ,1  ,0 ),
(1 ,1  ,1 ),
(1 ,1  ,2 ),
(1 ,2  ,3 ),
(1 ,2  ,4 ),
(2 ,1  ,5 ),
(2 ,1  ,6 );

/*
写一条SQL查询语句获取合作过至少三次的演员和导演的 id 对 (actor_id, director_id)
https://leetcode.cn/problems/actors-and-directors-who-cooperated-at-least-three-times/
*/
SELECT actor_id    ,director_id 
FROM ActorDirector 
GROUP BY actor_id    ,director_id 
HAVING COUNT(*) >= 3;




DROP TABLE ActorDirector;