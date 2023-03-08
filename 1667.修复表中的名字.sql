CREATE TABLE school.`Users`
(
`user_id` int not NULL,
`name` VARCHAR(255),
PRIMARY KEY(`user_id`)
);

INSERT INTO `Users` (`user_id`,`name`)
VALUES
(1,'aLice'),
(2,'bOB');


SELECT `user_id`, CONCAT(LEFT(UPPER(`name`),1),SUBSTRING(LOWER(`name`),2) ) as 'name'
FROM Users
order by user_id asc;

DROP TABLE Users;