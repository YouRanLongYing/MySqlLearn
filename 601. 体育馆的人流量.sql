CREATE stadium
( 'id' INT NOT NULL AUTO_INCREMENT,

)


(
	SELECT S1.id AS `id1`,S2.id AS `id2`,S3.id AS `id3`
	FROM stadium AS S1
-- 两天大于100
	JOIN stadium AS S2 ON(S1.id +1 = S2.id AND S1.people >=100 AND S2.people >=100)
-- 三天大于
	JOIN stadium AS S3 ON(S2.id +1 = S3.id AND S2.people >=100 AND S3.people >=100)
) AS A