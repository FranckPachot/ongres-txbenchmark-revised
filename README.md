This is based on https://gitlab.com/ongresinc/txbenchmark with the following fixes:
- exponential backof retries (see https://dev.to/franckpachot/transaction-performance-retry-with-backoff-12lm)
- index on audit (original was doing a COLLSCAN)

Example to run it:
```

(
    cd cli
    mvn clean package
    java -jar ./target/benchmark-1.3.jar -h
)
docker compose up bench mongo -d
docker compose up bench mongo -d mongo-init-replica-set
docker compose up bench 


```

Check collections:
```
docker compose exec -T mongo mongosh postgres <<< "show collections"
```

Create an index:
```
docker compose exec -it mongo mongosh
use postgres;
db.audit.getIndexes();
db.audit.createIndex({schedule_id: 1, day: 1})  
```


