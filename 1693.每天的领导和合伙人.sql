/*该表没有主键。
该表包含日期、产品的名称，以及售给的领导和合伙人的编号。
名称只包含小写英文字母。*/
CREATE TABLE DailySales(
date_id date not NULL,
make_name   VARCHAR(255),
lead_id     int,
partner_id  INT
);

INSERT INTO DailySales(date_id,make_name,lead_id,partner_id)VALUES
('2020-12-8','toyota' ,0 ,1),
('2020-12-8','toyota' ,1 ,0),
('2020-12-8','toyota' ,1 ,2),
('2020-12-7','toyota' ,0 ,2),
('2020-12-7','toyota' ,0 ,1),
('2020-12-8','honda' ,1 ,2),
('2020-12-8','honda' ,2 ,1),
('2020-12-7','honda' ,0 ,1),
('2020-12-7','honda' ,1 ,2),
('2020-12-7','honda' ,2 ,1);

/*写一条 SQL 语句，使得对于每一个 date_id 和 make_name，返回不同的 lead_id 以及不同的 partner_id 的数量。

按 任意顺序 返回结果表。

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/daily-leads-and-partners
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。*/

SELECT date_id ,make_name ,COUNT(DISTINCT lead_id) unique_leads ,COUNT(DISTINCT partner_id ) unique_partners
FROM  DailySales
GROUP BY make_name,date_id;

# Write your MySQL query statement below
select date_id,make_name,count(distinct lead_id) unique_leads,count(distinct partner_id) unique_partners from DailySales 
group by date_id,make_name order by date_id desc,make_name desc;

DROP TABLE DailySales;

