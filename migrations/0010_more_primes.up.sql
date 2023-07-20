insert into prime(prime)
select i as prime
from generate_series(1000001,2000000) i
where isPrime(i);