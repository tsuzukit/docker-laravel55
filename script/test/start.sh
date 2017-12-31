#!/usr/bin/bash

function set_env_to_test () {
  sed -i -e 's/DB_DATABASE=app/DB_DATABASE=test/g' ./src/.env
  rm ./src/.env-e
}
function set_env_to_dev () {
  sed -i -e 's/DB_DATABASE=test/DB_DATABASE=app/g' ./src/.env
  rm ./src/.env-e
}

function testApp () {
  set_env_to_test

  docker exec web-app php artisan config:clear

  if [ "$FLG_G" = "TRUE" ]; then
    docker exec web-app ./vendor/bin/phpunit --group="$VALUE_G"
  else
    docker exec web-app ./vendor/bin/phpunit
  fi

  docker exec web-app php artisan config:clear

  set_env_to_dev
}
CMDNAME=`basename $0`

# Move to project root
ROOT_DIR=`dirname $0`/../..
cd $ROOT_DIR

while getopts awg: OPT
do
  case $OPT in
    "g" ) FLG_G="TRUE" ; VALUE_G="$OPTARG" ;;
      * ) echo "start.hs Usage: $CMDNAME [-g VALUE]" 1>&2
          echo "-g: Run test with specified group" 1>&2
          exit 1 ;;
  esac
done

set_env_to_test
docker exec web-app php artisan migrate:fresh
set_env_to_dev
testApp

