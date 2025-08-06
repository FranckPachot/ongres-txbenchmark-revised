This is based on https://gitlab.com/ongresinc/txbenchmark with the following fixes:
- exponential backoff retry (see https://dev.to/franckpachot/transaction-performance-retry-with-backoff-12lm)
- index on audit (original was doing a COLLSCAN)
  
Additionally, the two following improvements make little difference but expose best practices:
- update audit first in the transaction (to detect conflict faster)
- embed aircraft capacity into the schedule as it is static

Example to run it:
```

(
    cd cli
    mvn clean package
    java -jar ./target/benchmark-1.3.jar -h
)
docker compose up bench results


```

Or simply:
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/FranckPachot/ongres-txbenchmark)

Note that this is not a relevant benchmark, but it is the occasion to show some best practices when running transactions on MongoDB
