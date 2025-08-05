```
git clone https://gitlab.com/ongresinc/txbenchmark.git
docker compose up -d --build && docker compose logs bench -f

docker compose exec -it mongo mongotop
docker compose exec -it mongo mongostat

``` 





```

mvn clean package



mvn compile
mvn clean package  

mvn clean install  
( cd cli  && mvn exec:java -Dexec.mainClass="com.ongres.benchmark.App")



```
