insert into solution(problem_number, answer)
select 10 as problem_number,
       sum(prime) as answer
from prime
where prime.prime < 2000000;