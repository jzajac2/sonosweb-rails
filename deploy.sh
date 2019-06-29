#!/bin/bash
set -eu
set -x

set +u

APP_SVR=pi@192.168.1.26
APP_DIR_SVR=/home/pi/code/sonosweb-rails
APP_DIR_LOCAL=.


#mkdir -p $(dirname $APP_DIR_SVR)

rsync --archive --verbose --delete --exclude 'bundle/' --exclude 'node_modules/' $APP_DIR_LOCAL $APP_SVR:$APP_DIR_SVR


# Note: will be run on boot as a systemd service and hot load