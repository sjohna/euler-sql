with recursive t(prev,curr) as (
    values (0,1)
    union all
    select curr,curr+prev from t where curr+prev < 4000000
)
insert into solution(problem_number, answer)
select 2, sum(curr) from t where curr%2=0;
