CREATE TABLE `Patients`
(
patient_id   int not NULL,
patient_name VARCHAR(255),
conditions    VARCHAR(255),
PRIMARY KEY(patient_id)
);

INSERT INTO `Patients`(patient_id,patient_name,conditions)
VALUES
( 1         , 'Daniel'     , 'YFEV COUGH'   ),
( 2        , 'Alice'       ,NULL),
( 3        , 'Bob'        , 'DIAB100 MYOP'),
( 4        , 'George'     , 'ACNE DIAB100'),
( 5        , 'Alain'      , 'DIAB201'     );

SELECT * FROM Patients;
/*写一条 SQL 语句，查询患有 I 类糖尿病的患者 ID （patient_id）、患者姓名（patient_name）以及其患有的所有疾病代码（conditions）。I 类糖尿病的代码总是包含前缀 DIAB1 。

按 任意顺序 返回结果表。

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/patients-with-a-condition*/


SELECT patient_id,patient_name,conditions
FROM Patients
WHERE conditions LIKE '% DIAB1%' or conditions LIKE 'DIAB1%';


# Write your MySQL query statement below
select patient_id,patient_name,conditions 
from patients 
where conditions like "DIAB1%" or conditions like "% DIAB1%" order by patient_id;

DROP TABLE `Patients`;