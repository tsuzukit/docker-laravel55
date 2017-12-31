# Container

## Base Containers

| Name          | Description              | Base Container                                                                                                                           | Size        |
|---------------|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| web-nginx | nginx 1.11.6             | [nginx:1.11.6-alpine](https://github.com/nginxinc/docker-nginx/blob/de8822d8d91ff0802989bc0a12f8ab55596a513c/mainline/alpine/Dockerfile) | 54.89 MB    |
| web-app   | laravel 5.4.23 + php-fpm | [php:7.1.0-fpm-alpine](https://github.com/docker-library/php/blob/173945670390f6595da8f93ae46b442167ff05be/7.1/fpm/alpine/Dockerfile)    | About 90 MB |
| web-mysql | mysql 5.7.16             | [mysql:5.7.16](https://github.com/docker-library/mysql/blob/4dd33136c4739667a223d39b6f829beb27b235cf/5.7/Dockerfile)                     | 383.4 MB    |
| web-redis | redis 3.0.7             | [redis:3.0.7](https://github.com/docker-library/redis/blob/24aa66d88990e0eeec71bd39862744fdb7b862e4/3.0/Dockerfile)                     | 176 MB    |

## Versions

```
Nginx 1.11.6
PHP 7.1.0
Mysql 5.7
```

# Dev environment Setup

## Building container

```
$ docker-compose build
```

Only for first time

```
$ sh script/dev/start.sh
$ sh script/dev/enter_app.sh

// inside container
# composer install
```

Copy .env

```
$ cd src
$ cp .env.example .env
```

Migration

```
$ sh script/dev/migrate.sh
```

# Commands

## Start container

```
$ sh script/dev/start.sh
```

## Stop container

```
$ sh script/dev/stop.sh
```

## Ssh into app container

```
$ sh script/dev/enter_app.sh
```

# Test

## Start test

```
$ sh script/test/start.sh

// only test specific group
$ sh script/test/start.sh -g <GROUPNAME>
```

