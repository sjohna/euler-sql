create or replace function isPrime(bigint) returns boolean as
$$
declare loopLimit bigint;
begin
    if $1 = 2 then
        return true;
    end if;

    loopLimit := floor(sqrt($1));

    if $1 % 2 = 0 then
        return false;
    end if;

    for num in 3..loopLimit by 2 loop
            if $1 % num = 0 then
                return false;
            end if;
        end loop;

    return true;
end
$$ language plpgsql;

create table prime (
    prime bigint primary key
);

insert into prime(prime)
select i as prime
from generate_series(2,1000000) i
where isPrime(i);