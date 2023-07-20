insert into solution(problem_number, answer)
select 4 as problem_number,
       max(a*b) as answer
from generate_series(100,999) a
         join generate_series(100,999) b on a < b
where (a*b)::text = reverse((a*b)::text);