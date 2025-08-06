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
docker compose up -d mongo-init-replica-set
docker compose up bench results


```

Or simply run it in GitPod:

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/FranckPachot/ongres-txbenchmark)

<img width="1566" height="627" alt="image" src="https://github.com/user-attachments/assets/002ab962-64df-430b-ac81-49f3b2a99417" />

Note that this is not a relevant benchmark for comparing databases and making decisions on which database to choose. Real applications do not execute transactions that involve external services, such as payment validation, between statements, always looking up the aircraft capacity, which is static once the schedule is set, or running all reservations on one date. Always test performance with a relevant workload and using your high availability infrastructure. This test provides an opportunity to showcase best practices for running transactions on MongoDB, as the original benchmark was missing some important ones, like correct retry logic for optimistic locking, and indexing the keys used to access a document.
