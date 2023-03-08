create table score (
`id` int unsigned primary key auto_increment,
`math` float not null default 0,
`english` float not null default 0
) charset=utf8;
insert into score (`math`, `english`)
values
(49, 71), (62, 66.7), (44, 86), (77.5, 74), (41, 75),
(82, 59.5), (64.5, 85), (62, 98), (44, 36), (67, 56),
(81, 90), (78, 70), (83, 66), (40, 90), (90, 90);