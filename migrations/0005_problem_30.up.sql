insert into solution(problem_number, answer)
select 30 as problem_number, answer
from
    (
        with digits(d) as (
            select * from generate_series(0,9) d
        )
        select sum(d1.d*100000 + d2.d*10000 + d3.d*1000 + d4.d*100 + d5.d*10 + d6.d) as answer
        from digits d1
                 join digits d2 on true
                 join digits d3 on true
                 join digits d4 on true
                 join digits d5 on true
                 join digits d6 on true
        where (d1.d*d1.d*d1.d*d1.d*d1.d + d2.d*d2.d*d2.d*d2.d*d2.d + d3.d*d3.d*d3.d*d3.d*d3.d + d4.d*d4.d*d4.d*d4.d*d4.d + d5.d*d5.d*d5.d*d5.d*d5.d + d6.d*d6.d*d6.d*d6.d*d6.d)
            = (d1.d*100000 + d2.d*10000 + d3.d*1000 + d4.d*100 + d5.d*10 + d6.d)
          and (d1.d <> 0 or d2.d <> 0 or d3.d <> 0 or d4.d <> 0 or d5.d <> 0 or d6.d <> 1) -- exclude 1
    ) calculation;