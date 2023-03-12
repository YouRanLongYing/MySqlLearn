CREATE TABLE TestTable(
id int not NULL AUTO_INCREMENT,
`name` VARCHAR(50),
`desc` VARCHAR(50),
`phone` VARCHAR(50),
PRIMARY KEY(id)
);

DESCRIBE TestTable;
SHOW CREATE TABLE TestTable;

INSERT INTO TestTable(`name`,`desc`,`phone`)VALUES
('AAA','AAAAA','11111111111'),
('BBB','BBBBB','22222222222'),
('CCC','CCCCC','33333333333');

SELECT * FROM TestTable;
/*修改字段属性
 alter table 表名 modify column 字段名 类型;
*/
ALTER TABLE TestTable MODIFY COLUMN `phone` DEC(11,0);
SELECT * FROM TestTable;
/*修改字段名称
alter table 表名称 change 字段名称 字段名称 字段类型 [是否允许非空];
*/
ALTER TABLE TestTable CHANGE `desc` `describe` VARCHAR(50);
SELECT * FROM TestTable;
#添加列
ALTER TABLE TestTable ADD COLUMN `height` int;
#alter table   table1 add id int unsigned not Null auto_increment primary key
UPDATE TestTable SET height = 119 WHERE id = 1;
UPDATE TestTable SET height = 120 WHERE id = 2;
UPDATE TestTable SET height = 110 WHERE id = 3;
#删除某一字段
#ALTER TABLE mytable DROP 字段名;
ALTER TABLE TestTable DROP phone;
#添加唯一键 MySQL 唯一约束（Unique Key）是指所有记录中字段的值不能重复出现
#ALTER TABLE `test2` ADD UNIQUE ( `userid`)
#修改主键
#ALTER TABLE `test2` DROP PRIMARY KEY ,ADD PRIMARY KEY ( `id` )
#增加索引
#ALTER TABLE `test2` ADD INDEX ( `id` )

DROP TABLE TestTable;