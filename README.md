```
git clone https://gitlab.com/ongresinc/txbenchmark.git
docker compose up -d --build
docker compose logs bench-mongo

docker compose exec -it mongo mongotop
docker compose exec -it mongo mongostat

``` 
