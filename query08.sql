/*

With a query, find out how many census block groups Penn's main campus fully contains. Discuss which dataset you chose for defining Penn's campus.

Structure (should be a single value):

(
    count_block_groups integer
)


question: the result contains blocks on the other side of the river...
*/

with university as (
	select * 
	from azavea.neighborhoods
	where name = 'UNIVERSITY_CITY'
)

select 
	count(*) as count_block_groups
from census.blockgroups_2020
join 
university
on st_intersects (
	blockgroups_2020.geog::geography, 
	university.geog::geography
    );