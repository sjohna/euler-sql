insert into solution (problem_number, answer)
select 1 as problem_number,
       sum(i)::text as solution
from generate_series(1,999) i
where mod(i,3) = 0 or mod(i,5) = 0;