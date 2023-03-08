CREATE TABLE Weather
(id int not NULL,
recordDate DATE,
temperature int,
PRIMARY KEY(id)
);

INSERT INTO Weather (id,recordDate,temperature)VALUES
(1 , '2015-01-01' , 10),
(2 , '2015-01-02' , 25),
(3 , '2015-01-03' , 20),
(4 , '2015-01-04' , 30);



SELECT wl.id
FROM Weather wl JOIN Weather wr on DATEDIFF(wl.recordDate,wr.recordDate) = 1
WHERE wl.temperature > wr.temperature;


# Write your MySQL query statement below
select w2.id 
from Weather w1,Weather w2 
where date_add(w1.recordDate,interval 1 day) = w2.recordDate and w1.Temperature < w2.Temperature;


DROP TABLE Weather;

