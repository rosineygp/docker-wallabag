# docker-wallabag
Another wallabag image

#https://www.wallabag.org/

Basic usage
```bash
docker run -d --name wallabag rosiney/wallabag
```

Using a external database (mysql)
```bash
docker run -d --name wallabag --link mysql:mysql rosiney/wallabag
```
