CREATE TABLE Activity(
user_id int,
session_id int,
activity_date DATE,
activity_type ENUM('open_session', 'end_session', 'scroll_down', 'send_message')
);

INSERT into  Activity(user_id,session_id,activity_date,activity_type) VALUES
(1 , 1 , '2019-07-20', 'open_session' ),
(1 , 1 , '2019-07-20', 'scroll_down' ),
(1 , 1 , '2019-07-20', 'end_session' ),
(2 , 4 , '2019-07-20', 'open_session' ),
(2 , 4 , '2019-07-21', 'send_message' ),
(2 , 4 , '2019-07-21', 'end_session' ),
(3 , 2 , '2019-07-21', 'open_session' ),
(3 , 2 , '2019-07-21', 'send_message' ),
(3 , 2 , '2019-07-21', 'end_session' ),
(4 , 3 , '2019-06-25', 'open_session' ),
(4 , 3 , '2019-06-25', 'end_session' );

/*请写SQL查询出截至 2019-07-27（包含2019-07-27），近 30 天的每日活跃用户数（当天只要有一条活动记录，即为活跃用户）。

以 任意顺序 返回结果表。

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/user-activity-for-the-past-30-days-i
*/
SELECT activity_date `day`, COUNT(DISTINCT user_id) active_users 
FROM Activity
WHERE activity_date > DATE_SUB('2019-07-27',INTERVAL 30 DAY) and activity_date <='2019-07-27'
GROUP BY activity_date;

# Write your MySQL query statement below
select activity_date as day,
       sum(1) as active_users 
from (
    select activity_date, 
           user_id
      from Activity 
      where datediff('2019-07-27',activity_date)<=29
        and datediff('2019-07-27',activity_date)>0
    group by  activity_date, user_id
)a
group by activity_date;


DROP TABLE Activity;