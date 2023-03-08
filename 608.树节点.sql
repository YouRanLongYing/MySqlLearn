

select id ,
(case 
when p_id is null then 'Root'
when id in (select p_id from tree ) then 'Inner'
#父节点之所以为父节点是因为他下辖多个叶子结点，
#叶子节点之所以为叶子节点就是因为他除父节点外没有其他节点，
#那么如果当前列的节点值能在p_id即父节点存储列找到，那这个节点就一定是父节点
else 'Leaf'
end )as type
from tree;


select id,(case 
when p_id is NULL then 'Root'
when id in 
(select distinct p_id from tree WHERE p_id  is not NULL) 
then 'Inner'
else 'Leaf'
end
) as Type
from tree