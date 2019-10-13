#!/bin/bash
set -eu
set -x
set +u
APP_DIR_SVR=/home/pi/code/sonosweb-rails
if [ "$1" == "development" ]; then
    echo "Positional parameter 1 contains development"
    cd $APP_DIR_SVR
    setsid rails s --binding=0.0.0.0 > /dev/null 2>&1 & 
elif [ "$1" == "production" ]; then
    echo "Positional parameter 1 contains production"
    setsid rails s -e production --binding=0.0.0.0 > /dev/null 2>&1 &
else
    echo "You must speficy either 'development' or 'production'"
fi

