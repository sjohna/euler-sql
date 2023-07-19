insert into solution (problem_number, answer)
select 6, sum_squared - sum_of_squares
from
    (
        select sum(i)*sum(i) as sum_squared, sum(i*i) as sum_of_squares
        from generate_series(1,100) i
    ) calculations