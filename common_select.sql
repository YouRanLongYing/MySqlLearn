SELECT student.name, score.math ,student.birthday
FROM student, score 
where student.id = score.id 
	and student.description is NULL
	AND student.birthday BETWEEN '1992-1-1' and '2000-1-1'
	and student.sex = '男'
#IS 比较仅用于空值比较