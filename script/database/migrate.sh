#!/usr/bin/bash

CMDNAME=`basename $0`

# Move to project root
ROOT_DIR=`dirname $0`/../..
cd $ROOT_DIR

docker exec web-app php artisan migrate:fresh --seed

