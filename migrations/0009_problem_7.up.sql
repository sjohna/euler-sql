insert into solution(problem_number, answer)
select 7 as problem_number, prime as answer
from prime
order by prime asc
limit 1
offset 10000;