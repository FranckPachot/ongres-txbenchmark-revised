This is based on https://gitlab.com/ongresinc/txbenchmark with the following fixes:
- exponential backoff retry (see https://dev.to/franckpachot/transaction-performance-retry-with-backoff-12lm)
- index on audit (original was doing a COLLSCAN)
  
Additionally, The two following improvements make little differences but expose best practices:
- update audit first in the transaction (to detect conflict faster)
- embed aircraft capacity into sthe chedule as it is static

Example to run it:
```

(
    cd cli
    mvn clean package
    java -jar ./target/benchmark-1.3.jar -h
)
docker compose up bench results


```
