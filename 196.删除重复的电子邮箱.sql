SELECT * FROM student
WHERE `name` like "赵%";

update student
set sex = (case when sex = '男' then '女' else '男' END)


SELECT MIN(id)
FROM student
GROUP BY sex

DELETE from Person
where Person.id not in 
(
    select min_id from 
    (
        SELECT min(id) as min_id from Person as p group by p.email
    ) as min_ids
)