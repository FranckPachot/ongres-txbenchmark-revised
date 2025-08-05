```

(
    cd cli
    mvn clean package
    java -jar ./target/benchmark-1.3.jar -h
)
docker compose up -d
docker compose logs bench -f

```

