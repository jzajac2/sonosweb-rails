#!/bin/bash

if [ "$1" == "development" ]; then
    echo "Positional parameter 1 contains development"
    APP_SVR=pi@192.168.1.26
elif [ "$1" == "production" ]; then
    echo "Positional parameter 1 contains production"
    APP_SVR=pi@192.168.1.25
else
  # Default to development
  APP_SVR=pi@192.168.1.26
fi

set -eu
set -x

set +u

# APP_SVR=pi@192.168.1.25
APP_DIR_SVR=/home/pi/code/sonosweb-rails
APP_DIR_LOCAL=.

#mkdir -p $(dirname $APP_DIR_SVR)

rsync --archive --verbose --delete --exclude={'node_modules/','tmp/','.git'} $APP_DIR_LOCAL $APP_SVR:$APP_DIR_SVR


# Note: will be run on boot as a systemd service and hot load