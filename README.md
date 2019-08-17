# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
- Core Pi provisioning
1. In Preferences:
1. Change hostname to something unique and short e.g. rpi4
1. Enable Network, Boot and Auto login, SSH, and VNC
1. Make it a static IP via router and /etc/dhcpcd.conf
1. enable ssh
1. install ruby and rails: https://parsun.com/2017/09/23/how-to-install-ruby-on-rails-on-raspberry-pi-3/
1. create /home/pi/code/<appname> directory
1. scp -rp /Users/jzajac/code/git/personal/Projects/SonosWeb/node-sonos-http-api/  pi@192.168.1.26:/home/pi/code
1. scp -rp /Users/jzajac/code/git/personal/Projects/SonosWeb/sonosweb-rails/ pi@192.168.1.26:/home/pi/code
OR
rsync -av /Users/jzajac/code/git/personal/Projects/SonosWeb/node-sonos-http-api/ pi@192.168.1.26:/home/pi/code/node-sonos-http-api/



1. and same for sonosweb-rails
rsync -avi /Users/jzajac/code/git/personal/Projects/SonosWeb/sonosweb-rails/ pi@192.168.1.26:/home/pi/code/sonosweb-rails/
or maybe
rsync --archive --quiet --delete --exclude 'bundle/' --exclude 'node_modules/' .
1. start up as background with: nohup rails s --binding=0.0.0.0 > /dev/null 2>&1 &
todo: need to set up logging system

- For nodejs
1. sudo apt-get update
1. 
- On pi:
1. node-sonos-http-api is a dependent service
[unit]
Description=node-sonos-http-api

[Service]
ExecStart=~/code/node-sonos-http-api/server.js
Restart=always
User=nogroup
Environment=PATH=/usr/bin:/usr/local/bin
Environment=NODE_ENV=production
WorkingDirectory=~/code/node-sonos-http-api


Currently it is run using:
https://stackoverflow.com/questions/21542304/how-to-start-a-node-js-app-on-system-boot
sonosNodeService
pi@rpi3:/etc/init.d 
1. https://parsun.com/2017/09/23/how-to-install-ruby-on-rails-on-raspberry-pi-3/
1. export VISUAL=vim; crontab -e
1. ~/code/sonosweb-rails $ rails s --binding=0.0.0.0
1. su pi -c 'cd ~/code/sonosweb-rails && /home/pi/.rvm/gems/ruby-2.5.1/bin/rails s --binding=0.0.0.0'
#~/code/sonosweb-rails $ rails s --binding=0.0.0.0
1. 
#!/bin/sh
#/etc/init.d/myService
export PATH=$PATH:~/code/echo-sonos/node-sonos-http-api
export NODE_PATH=$NODE_PATH:/usr/local/bin

case "$1" in
start)
exec forever --sourceDir=/usr/local/bin -p ~/code/echo-sonos-node-sonos-http-api server.js #scriptarguments
;;
stop)
exec forever stop --sourceDir=/usr/local/bin myNodeApp.js
;;
*)
echo "Usage: /etc/init.d/myService {start|stop}"
exit 1
;;
esac
exit 0

* Troubleshooting
1. make sure the DDNS on router is set and works: http://jzajac2-ws2.asuscomm.com:5005/zones


* TODO:
1. https://aws.amazon.com/blogs/mt/manage-raspberry-pi-devices-using-aws-systems-manager/

1. health checks on {hostname:port} with status controller endpoint - get the ops middleware working with that