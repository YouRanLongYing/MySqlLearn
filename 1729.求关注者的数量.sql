CREATE TABLE Followers(
user_id     int not NULL,
follower_id  int not NULL,
PRIMARY KEY(user_id,follower_id)
);
/*该表包含一个关注关系中关注者和用户的编号，其中关注者关注用户。*/
INSERT INTO Followers(user_id,follower_id)VALUES
(0, 1),
(1, 0),
(2, 0),
(2, 1);


/*写出 SQL 语句，对于每一个用户，返回该用户的关注者数量。

按 user_id 的顺序返回结果表。
https://leetcode.cn/problems/find-followers-count
*/

SELECT user_id,COUNT(DISTINCT follower_id) followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id ASC;

DROP TABLE Followers;





