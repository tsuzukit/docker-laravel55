#!/bin/bash

docker exec -it web-app composer install
docker exec -it web-app npm install
