-- SELECT AVG(score.math)
-- FROM score
-- 

SELECT *
FROM score JOIN student ON score.id = student.id
WHERE score.math IN (SELECT MAX(score.math) FROM score)

/*
select XX from (select XX from A join B on A.a=B.a C where xxx）join D on C.a=D.a where xxx
*/

