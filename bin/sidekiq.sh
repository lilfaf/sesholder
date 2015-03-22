#!/bin/sh
cd /home/app/webapp
exec 2>&1
exec /sbin/setuser sidekiq bundle exec sidekiq \
  -e production \
  -q default -q mailers \
  -L log/sidekiq.log
  -P /var/run/sidekiq/sidekiq.pid
