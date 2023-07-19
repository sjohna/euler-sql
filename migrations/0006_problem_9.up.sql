insert into solution(problem_number, answer)
select 9 as problem_number, a*b*(1000-a-b) as answer
from generate_series(1,1000) a
         join generate_series(1,1000) b on a <= b
where a*a + b*b = (1000-a-b) * (1000-a-b);